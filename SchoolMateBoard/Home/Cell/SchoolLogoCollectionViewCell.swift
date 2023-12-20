//
//  SchoolLogoCollectionViewCell.swift
//  SchoolMate
//
//  Created by 박도연 on 12/20/23.
//

import UIKit

class SchoolLogoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var schoolLogo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        schoolLogo.layer.cornerRadius = 40
        schoolLogo.clipsToBounds = true //같이 짤리도록 함
    }

}
