//
//  ViewControllerCollectionViewDelegate.swift
//  TestFlip
//
//  Created by Mohamed Ali on 05/04/2022.
//

import Foundation
import UIKit
import Gemini

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
       if let cell = cell as? GeminiCell {
           self.collectionView.animateCell(cell)
       }
        
        if indexPath.row == 0 {
            ConfgureUI(label: [RequestesLabel,WaitingLabel,CompletedLabel], line: [LineOne,LineTwo,LineThree])
        }
        else if indexPath.row == 1 {
            ConfgureUI(label: [WaitingLabel,RequestesLabel,CompletedLabel], line: [LineTwo,LineOne,LineThree])
        }
        else {
            ConfgureUI(label: [CompletedLabel,RequestesLabel,WaitingLabel], line: [LineThree,LineOne,LineTwo])
        }
   }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if indexPath.row == 0 {
            ConfgureUI(label: [RequestesLabel,WaitingLabel,CompletedLabel], line: [LineOne,LineTwo,LineThree])
        }
        else if indexPath.row == 1 {
            ConfgureUI(label: [WaitingLabel,RequestesLabel,CompletedLabel], line: [LineTwo,LineOne,LineThree])
        }
        else {
            ConfgureUI(label: [CompletedLabel,RequestesLabel,WaitingLabel], line: [LineThree,LineOne,LineTwo])
        }
        return true
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell: PageOne = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier1 , for: indexPath) as! PageOne
            
            self.collectionView.animateCell(cell)
            
            return cell
        }
        else if indexPath.row == 1 {
            let cell: PageTwo = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier2, for: indexPath) as! PageTwo
            
            self.collectionView.animateCell(cell)
            
            return cell
        }
        else {
            let cell: PageThree = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier3, for: indexPath) as! PageThree
            
            self.collectionView.animateCell(cell)
            
            return cell
        }
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.height)
    }
}
