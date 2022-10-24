//
//  ViewController.swift
//  GalleryImagePicker
//
//  Created by Md Murad Hossain on 16/10/22.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var selectedImageArr = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        
    }
    
// MARK: Private Methodes:
    
    
    // MARK: Register the CollectionViewCell
    
    func setupCollectionView() {
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
    }
    
    
    // MARK: Action Button

    @IBAction func addphotobutton(_ sender: UIBarButtonItem) {
        var config = PHPickerConfiguration()
        config.selectionLimit = 1000
        let phPickerVC = PHPickerViewController(configuration: config)
        phPickerVC.modalPresentationStyle = .fullScreen
        phPickerVC.delegate = self
        self.present(phPickerVC,animated: true)
        
    }
    
}
// MARK: Image PickerViewContorllerDelegate Method

extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        for result in results{
            result.itemProvider.loadObject(ofClass: UIImage.self) { object, error in
                if let image = object as? UIImage{
                    self.selectedImageArr.append(image)
                }
                // MARK: Image Reload Picker. Main Code
                
                DispatchQueue.main.async{
                    self.collectionView.reloadData()
                }
            }
        }
    }
}

// MARK: Collection View DataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        selectedImageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.imageVieW.image = selectedImageArr[indexPath.row]
        cell.removeButton.addTarget(self, action: #selector(handleRemoveItem), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "ImageView", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ImageViewViewController") as! ImageViewViewController
        vc.imageArr = selectedImageArr
        vc.selectedImageIndex = indexPath
        
//        1 MARK: Second practice vc variable ImageViewViewController transform image
//        vc.modalTransitionStyle = .crossDissolve
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true)
        
        self.navigationController?.pushViewController(vc, animated: true) // 1 number unhide korle eita off hobe
    }
    // MARK: Delete Button and Action UIAlertController
    
    @objc func handleRemoveItem(sender: UIButton) {
        if let photoCVCell = sender.superview?.superview as? CollectionViewCell {
            let alert = UIAlertController(title: "Delete", message: "Are you sure about deleting this image!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { [self](action:UIAlertAction!) in
                guard let indexPath = collectionView.indexPath(for: photoCVCell) else {
                    return
                }
                self.selectedImageArr.remove(at: indexPath.row)
                print("Remove item")
                self.collectionView.deleteItems(at: [indexPath])
                self.collectionView.reloadData()
            }))
            
            alert.view.tintColor = .red
            self.present(alert, animated: true, completion: nil)
        }
    }
}

// MARK: UICollectionView DelegetFlow Layout

extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // MARK: Picture width and height load collection size.
        
        return CGSize(width: collectionView.frame.size.width/3, height: collectionView.frame.size.height/5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

// MARK: Finished


