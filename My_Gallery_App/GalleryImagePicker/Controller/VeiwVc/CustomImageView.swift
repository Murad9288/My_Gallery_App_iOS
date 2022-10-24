//
//  imageview.swift
//  GalleryImagePicker
//
//  Created by Md Murad Hossain on 22/10/22.
//

import Foundation
import UIKit

class CustomImageLayout: UICollectionViewFlowLayout {

    var numberOfColumns:CGFloat = 1

override init() {
    super.init()
    setupLayout()
}

required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupLayout()
}

override var itemSize: CGSize {
    set { }
    get {
        let itemWidth = (self.collectionView!.frame.width - (self.numberOfColumns - 0.09)) / self.numberOfColumns
        return CGSize(width: itemWidth, height: itemWidth)
    }
}

func setupLayout() {
    minimumInteritemSpacing = 0.2 
    minimumLineSpacing = 0.2
    scrollDirection = .horizontal
    
    }
}
