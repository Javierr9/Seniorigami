//
//  StepViewController.swift
//  Seniorigami
//
//  Created by Javier Fransiscus on 06/04/21.
//

import UIKit

class StepsViewController: UIViewController {

    @IBOutlet weak var stepsCollection: UICollectionView!
    @IBOutlet weak var finishButton: UIBarButtonItem!
    @IBOutlet weak var stepsNavigationBar: UINavigationItem!
    
    @IBAction func finishBtnClicked(_ sender: Any) {
        Database.shared.setOrigamiFinished(origami: test)
        
        var origamiCheck = Database.shared.getOrigamiList()[0]
        if origamiCheck.finished == true{
            print("true")
        }else{
            print("false")
        }
        print("test button")
    }
    
    var selected = Origami()
    let stepCellID = "StepCell"
    var test = Database.shared.getOrigamiList()[0]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selected = Database.shared.getOrigamiList()[0]
        
        
        self.title = selected.name
        
        let nibcell = UINib(nibName: stepCellID, bundle: nil)
        
        stepsCollection.register(nibcell, forCellWithReuseIdentifier: stepCellID)
        
        
    }
}

extension StepsViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    
   //notes 2.0:
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, tartgetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let layout = self.collectionView
        
    }
    
    
    
    //notes 1.1: nambahin features ke class yang udah
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selected.instructions!.count
    }
    
    //notes 1.2: ngitung size collection view brp cell.
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // notes 1.4: kaya naruh cell didalam collection view sesuai index (jadi jumlah si cell), as! itu nge recast
        var cell = stepsCollection.dequeueReusableCell(withReuseIdentifier: stepCellID, for: indexPath) as! StepCell
        let color = UIColor.init(named: (selected.mode?.color)!)
        
        //notes 1.5: nampung UIImage (cuman gara2 string di database, jadi harus di cast sebagai image disini)
        var imgs: [UIImage] = []
        //notes 1.6: ... itu maksudnya "sampai dengan"
        for index in 0...selected.instructions![indexPath.row].images.count-1{
            imgs.append(UIImage(named: selected.instructions![indexPath.row].images[index]!)!) //notes 1.7: dia masukin string name si image (dr DB) kedalam si UIimage jadi nanti image2 yang ada di asset tinggal dipanggil aja
        }
        cell.origamiStepImg.image = UIImage.animatedImage(with: imgs, duration: 3) //notes 1.8: automatis image sequencing pake array
    
        cell.origamiStepCount.text = "\(indexPath.row+1) of \(selected.steps!)" // notes 1.9: String interpolation
        cell.origamiStepCount.sizeToFit()
        cell.origamiStepDesc.text = selected.instructions![indexPath.row].desc
        cell.origamiStepCount.layer.backgroundColor = color?.cgColor
        
        
        return cell
    }
    
    
    
    //notes 1.3: ngeload cellnya si collection view, cell diisi apa?
    
}
