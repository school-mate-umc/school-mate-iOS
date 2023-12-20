//
//  PostViewController.swift
//  SchoolMateBoard
//
//  Created by 곽은채 on 2023/11/27.
//

// 개별 post 클릭했을 때 보이는 부분
// 게시글 하나
import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postTimeLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postLikeCountLabel: UILabel!
    @IBOutlet weak var postContentLabel: UILabel!
    
    @IBOutlet weak var postLikeButton: UIButton!
    @IBOutlet weak var replyLikeButton: UIButton!
    @IBOutlet weak var replyLikeCountLabel: UILabel!
    
    var postManager = PostManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func postLikeButtonPressed(_ sender: Any) {
        if postLikeButton.isSelected {
            postLikeButton.isSelected = false
            postLikeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        } else {
            postLikeButton.isSelected = true
            postLikeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }
    
    @IBAction func replyLikeButtonPressed(_ sender: UIButton) {
        if replyLikeButton.isSelected {
            replyLikeButton.isSelected = false
            replyLikeButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        } else {
            replyLikeButton.isSelected = true
            replyLikeButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
        }
    }
    
}
