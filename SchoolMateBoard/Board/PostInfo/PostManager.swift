//
//  PostManager.swift
//  SchoolMateBoard
//
//  Created by 곽은채 on 2023/11/28.
//

// postManager에서 진행하는 일
// postdata의 형태대로 가져와서(func parseJSON(weatherData: Data) -> WeatherModel?)
// postModel에 넣어주면(let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
import Foundation

protocol PostManagerDelegate {
    func didUpdatePost(_ postManager: PostManager, post: PostModel)
    func didFailWithError(error: Error)
}

struct PostManager {
    let postURL = "https://api.openweathermap.org/data/2.5/weather?appid=b0369a31d584f120998dabaeb7100611"
    
    var delegate: PostManagerDelegate?
    
    func fetchPost(cityName: String) {
        let urlString = "\(postURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let post = self.parseJSON(postData: safeData) {
                        self.delegate?.didUpdatePost(self, post: post)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(postData: Data) -> PostModel? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(PostData.self, from: postData)
            let name = decodeData.name
            let time = decodeData.main.temp
            let like = decodeData.main.feels_like
            let reply = decodeData.main.humidity
            let contents = decodeData.weather[0].description
            
            let post = PostModel(title: name, content: contents, likeCount: Int(like), replyCount: reply, time: Int(time))
            return post
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
