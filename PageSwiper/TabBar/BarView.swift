//
//  CollectionView.swift
//  CoinScol
//
//  Created by Wai Yan on 1/15/20.
//  Copyright © 2020 Wai Yan. All rights reserved.
//

import UIKit

class BarView : UICollectionView {
    
    let Cellnib = UINib(nibName: "Cell", bundle: nil)
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        
        super.init(frame: frame, collectionViewLayout: layout)
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        
        self.register(Cellnib , forCellWithReuseIdentifier: "cell")

        self.backgroundColor = .clear
        
       
        

    }
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}




extension ViewController : UICollectionViewDelegateFlowLayout  {
    

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.BarOptions.ItemSize!
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) //.zero
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}



 extension ViewController : UICollectionViewDataSource , UICollectionViewDelegate {
    
    
    
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       
       

        return self.BarOptions.Texts!.count
  
    }
        
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell" , for: indexPath) as! CollectionViewCell
        
        cell.titleLabel.text = self.BarOptions.Texts![indexPath.row ]
         // cell.titleLabel.text = self.BarOptions.Texts![indexPath.row ]
        
        let TapGuesture = UITapGestureRecognizer()
        TapGuesture.addTarget(self, action: #selector(Tap(sender:)))

        cell.addGestureRecognizer(TapGuesture)
    
     
        cell.tag = indexPath.row
        
        print("do")

            return cell
        }
    
    
    @objc func Tap( sender : UITapGestureRecognizer )
    {
        print(sender.view?.tag)
       self.ScrView.setContentOffset(CGPoint(x: CGFloat (sender.view!.tag) * self.view.frame.width , y: 0 ), animated: true )
    }
        
    
        
    
    


}






