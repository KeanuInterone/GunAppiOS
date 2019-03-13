//
//  ViewController.swift
//  GunApp
//
//  Created by Keanu Interone on 3/11/19.
//  Copyright © 2019 Keanu Interone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var gunCollectionView: UICollectionView!
    var guns = [Gun]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gunCollectionView.register(UINib(nibName: "GunCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GunCell")
        
        Gun.getAllGuns { (guns, success) in
            if success {
                self.guns = guns!
                DispatchQueue.main.async {
                    self.gunCollectionView.reloadData()
                }
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return guns.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GunCell", for: indexPath) as! GunCollectionViewCell
        
        let gun = guns[indexPath.row]
        
        cell.setUpWith(gun: gun)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 250)
    }


}

