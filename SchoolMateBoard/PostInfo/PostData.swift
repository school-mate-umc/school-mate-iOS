//
//  PostData.swift
//  SchoolMateBoard
//
//  Created by 곽은채 on 2023/11/28.
//

// api의 형태를 그대로 가져와서 변수 선언
import Foundation

struct PostData: Codable {
    let name: String // 제목
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double // 시간
    let feels_like: Double // 좋아요 개수
    let humidity: Int // 댓글 개수
}

struct Weather: Codable {
    let description: String // 내용
}
