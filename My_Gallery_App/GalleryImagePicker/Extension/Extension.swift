//
//  Extension.swift
//  GalleryImagePicker
//
//  Created by Md Murad Hossain on 22/10/22.
//
//
//import UIKit
//import Foundation
//
//extension UICollectionView {
//
//    func scrollToNextItem() {
//        let scrollOffset = CGFloat(floor(self.contentOffset.x + self.bounds.size.width))
//        self.scrollToFrame(scrollOffset: scrollOffset)
//    }
//
//    func scrollToPreviousItem() {
//        let scrollOffset = CGFloat(floor(self.contentOffset.x - self.bounds.size.width))
//        self.scrollToFrame(scrollOffset: scrollOffset)
//    }
//
//    func scrollToFrame(scrollOffset : CGFloat) {
//        guard scrollOffset <= self.contentSize.width - self.bounds.size.width else { return }
//        guard scrollOffset >= 0 else { return }
//        self.setContentOffset(CGPoint(x: scrollOffset, y: self.contentOffset.y), animated: true)
//    }
//}
