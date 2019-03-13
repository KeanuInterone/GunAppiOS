//
//  GunCollectionViewCell.swift
//  GunApp
//
//  Created by Keanu Interone on 3/11/19.
//  Copyright © 2019 Keanu Interone. All rights reserved.
//

import UIKit

class GunCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpWith(gun: Gun) {
        imageView.downloaded(from: gun.imageURL)
        label.text = gun.name
    }

}
