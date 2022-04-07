//
//  ViewController.swift
//  TestFlip
//
//  Created by Mohamed Ali on 05/04/2022.
//

import UIKit
import Gemini

class ViewController: UIViewController {
    
    @IBOutlet weak var LineOne: UIView!
    @IBOutlet weak var RequestesLabel: UILabel!
    
    @IBOutlet weak var LineTwo: UIView!
    @IBOutlet weak var WaitingLabel: UILabel!
    
    @IBOutlet weak var LineThree: UIView!
    @IBOutlet weak var CompletedLabel: UILabel!
    
    @IBOutlet weak var collectionView: GeminiCollectionView!
    
    // MARK:- TODO:- This section for initialise new varibles.
    let cellIdentifier1 = "Cell1"
    let cellIdentifier2 = "Cell2"
    let cellIdentifier3 = "Cell3"
    let nibFileName    = "PageOne"
    let nibFileName2   = "PageTwo"
    let nibFileName3   = "PageThree"
    let arr = [1,2,3]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        RegesterCollectionView()
        configureAnimation()
    }

    // MARK: TODO: This Method For Regester Cell to CollectionView.
    func RegesterCollectionView() {
        collectionView.register(UINib(nibName: nibFileName, bundle: nil), forCellWithReuseIdentifier: cellIdentifier1)
        collectionView.register(UINib(nibName: nibFileName2, bundle: nil), forCellWithReuseIdentifier: cellIdentifier2)
        collectionView.register(UINib(nibName: nibFileName3, bundle: nil), forCellWithReuseIdentifier: cellIdentifier3)
    }
    // -------------------------------------------
    
    // MARK: TODO: Configure animation and properties
    func configureAnimation() {
//        collectionView.gemini
//            .circleRotationAnimation()
//            .radius(400)
//            .rotateDirection(.clockwise)
        
        collectionView.gemini.cubeAnimation().cubeDegree(90).ease(.linear)
    }
    // -------------------------------------------
    
    // MARK: TODO: Call animation function
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        collectionView.animateVisibleCells()
    }
    // -------------------------------------------

    // MARK: TODO: this method for configure sction ui.
    func ConfgureUI(label: [UILabel], line: [UIView]) {
        label[0].textColor = UIColor().hexStringToUIColor(hex: "4B94FF")
        label[1].textColor = UIColor().hexStringToUIColor(hex: "#B6B9A9")
        label[2].textColor = UIColor().hexStringToUIColor(hex: "#B6B9A9")
        
        UIView.animate(withDuration: 0.4) {
            line[0].layer.backgroundColor = UIColor().hexStringToUIColor(hex: "#4B94FF").cgColor
            line[1].layer.backgroundColor = .none
            line[2].layer.backgroundColor = .none
            self.view.layoutIfNeeded()
        }
    }
    // -------------------------------------------

}

