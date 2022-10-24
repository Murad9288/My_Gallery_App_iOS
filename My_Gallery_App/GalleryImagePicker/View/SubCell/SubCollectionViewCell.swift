//
//  SubCollectionViewCell.swift
//  GalleryImagePicker
//
//  Created by Md Murad Hossain on 22/10/22.
//

import UIKit

class SubCollectionViewCell: UICollectionViewCell,UIScrollViewDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        self.scrollView.delegate = self

    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
        
    }
    
}
