//
//  BoardCollectionViewCell.swift
//  SchoolMateBoard
//
//  Created by 곽은채 on 2023/11/27.
//

// 전체 게시판에서 각각의 게시물이 보이는 방식
import UIKit

class BoardCollectionViewCell: UICollectionViewCell {
    static let identifier = "BoardCollectionView"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var replyCountLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
