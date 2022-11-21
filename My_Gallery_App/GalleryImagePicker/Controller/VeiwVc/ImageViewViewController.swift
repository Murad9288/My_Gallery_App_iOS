//
//  ImageViewViewController.swift
//  GalleryImagePicker
//
//  Created by Md Murad Hossain on 17/10/22.
//
// MARK: Email: muradhossianm01@gmail.com
//
//

import UIKit

class ImageViewViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageArr: [UIImage] = [UIImage]()
    var selectedImageIndex: IndexPath?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupCollectionView()
        collectionView.alpha = 0
        collectionView.isPagingEnabled = false

    }


    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.collectionView.scrollToItem(at: self.selectedImageIndex ?? [0,0], at: .centeredHorizontally, animated: false)
        collectionView.isPagingEnabled = true
        
        UIView.animate(withDuration: 0.5){
            self.collectionView.alpha = 1
        }
        
    }
    

    // MARK: - Private Methods
    func setupCollectionView() {
        let nib = UINib(nibName: "SubCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
    }
    
}

extension ImageViewViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SubCollectionViewCell
        cell.imageView.image = imageArr[indexPath.row]
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 20
        return cell
    }
    
    

}

extension ImageViewViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.size.width, height: view.frame.size.height)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

// MARK: Code Finished



