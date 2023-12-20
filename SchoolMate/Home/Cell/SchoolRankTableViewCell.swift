//
//  SchoolRankTableViewCell.swift
//  SchoolMate
//
//  Created by 박도연 on 12/20/23.
//

import UIKit

class SchoolRankTableViewCell: UITableViewCell {

    @IBOutlet weak var searchSchool: UITextField!
    @IBOutlet weak var schoolRank: UILabel!
    @IBOutlet weak var goToSchool: UIButton!
    @IBOutlet weak var firstRank: UIStackView!
    @IBOutlet weak var secondRank: UIStackView!
    @IBOutlet weak var thirdRank: UIStackView!
    @IBOutlet weak var nowSchool: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
