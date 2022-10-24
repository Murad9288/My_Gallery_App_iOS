//
//  CollectionViewCell.swift
//  GalleryImagePicker
//
//  Created by Md Murad Hossain on 17/10/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageVieW: UIImageView!
    @IBOutlet weak var removeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
