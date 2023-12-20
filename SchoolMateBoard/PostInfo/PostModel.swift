//
//  PostModel.swift
//  SchoolMateBoard
//
//  Created by 곽은채 on 2023/11/28.
//

// postData의 값을 내가 쓸 변수로 저장
import UIKit

struct PostModel {
    let title: String
    let content: String
    let likeCount: Int
    let replyCount: Int
    let time: Int
    
    var likeCountString: String {
        return "좋아요 \(likeCount)개"
    }
    
    var replyCountString: String {
        return "댓글 \(replyCount)개"
    }
    
    var timeString: String {
        return "\(time)분 전"
    }
}
