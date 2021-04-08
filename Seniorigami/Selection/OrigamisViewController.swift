//
//  OrigamisViewController.swift
//  Seniorigami
//
//  Created by Shiddiq Syuhada on 08/04/21.
//

import Foundation
import UIKit

class OrigamisViewController: UIViewController{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    public var origamis = [Origamis]()
    
    let origamiCollectionViewCellId = "OrigamiCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nibCell = UINib(nibName: origamiCollectionViewCellId, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: origamiCollectionViewCellId)
        
        for _ in 1...25 {
            let origami = Origamis()
            origami?.title = "Plane"
            origami?.step = "10 Steps"
            origami?.paper = "1 Origami Paper"
            
            origamis.append(origami!)
        }
        collectionView.reloadData()
    }
}

extension OrigamisViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return origamis.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset:CGFloat = 10
        return UIEdgeInsets(top: inset, left: inset, bottom:inset, right:inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: origamiCollectionViewCellId, for: indexPath) as! OrigamiCollectionViewCell
        let origami = origamis[indexPath.row]
        cell.origamiImg.image = UIImage(named: "Plane")
        cell.titlelabel.text = origami.title!
        cell.stepLabel.text = origami.step!
        cell.paperLabel.text = origami.paper!
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let origami = origamis[indexPath.row]
        print("\(indexPath.row) - \(origami.title!)")
    }
}
