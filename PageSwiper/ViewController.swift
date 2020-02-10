//
//  ViewController.swift
//  PageSwiper
//
//  Created by Wai Yan on 2/6/20.
//  Copyright © 2020 Wai Yan. All rights reserved.
//

import UIKit

class ViewController : UIViewController {

    var BarOptions =  TabBarOptions()
    let flowlayout = UICollectionViewFlowLayout()
    var PageIndex : Int = 0
 
    
    let indicator :  UIView = {
        let v = UIView()
          v.backgroundColor = UIColor.blue
          v.frame = CGRect(origin: .zero, size: CGSize(width: 0, height: 5 ))
        return v
    }()
    
    var Bar : BarView!
    //var Bar = BarView(frame: CGRect.zero , collectionViewLayout: UICollectionViewFlowLayout())
   
  
    
    @IBOutlet weak var ScrView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        
        Bar = BarView(frame: CGRect.zero , collectionViewLayout: flowlayout )
       
         Bar.isScrollEnabled = false
        
        
        self.BarOptions.Bartype = .TextOnly
        self.BarOptions.BgColor = UIColor.black
        self.BarOptions.TextColor = UIColor.white
        self.BarOptions.Texts  = ["0" ,"1" ,"2" ,"3" ,"4" ,"5","6","7"]
        self.BarOptions.ItemSize = CGSize(width: self.view.frame.width / 3  , height: 30)
        self.BarOptions.ItemCount = 6
        self.ScrView.contentSize.width = self.view.frame.width  * CGFloat(self.BarOptions.Texts!.count)
        
      //  print(BarOptions)
        
          Bar.delegate   = self
          Bar.dataSource = self
          self.Bar.isScrollEnabled = false

        let Bframe  = CGRect(x: 0, y: 100, width: self.view.frame.width , height: 50)
        self.indicator.frame.origin.y = 150
        self.indicator.frame.size.width = self.view.frame.width / 3
        Bar.frame = Bframe
       
       
        self.view.addSubview(Bar)
        self.view.addSubview(indicator)
        
        for i in 0...self.BarOptions.Texts!.count - 1 {
           let  label = UILabel()
            label.textColor = UIColor.white
            label.text = String(i)
            label.backgroundColor  = UIColor.black
            label.textAlignment = .center
            label.frame = CGRect(x: Int(self.view.frame.width) * i + 100 , y: 100, width: 100, height: 50)
        
            self.ScrView.addSubview(label)
        }
       
        
        
        // Do any additional setup after loading the view.
     }


}


extension ViewController    : UIScrollViewDelegate
{
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
       
        
        if ( scrollView == self.ScrView ) {
            
        
        PageIndex = Int (scrollView.contentOffset.x / self.view.frame.width )
            
           
        for  cell   in self.Bar.visibleCells
        {
            let c = cell as! CollectionViewCell
                c.titleLabel.textColor = UIColor.lightGray
            if ( PageIndex == c.tag){
                
                c.titleLabel.textColor = indicator.backgroundColor
                
            }else{
                
                 c.titleLabel.textColor = UIColor.lightGray
            }
            
         
        }
        
        
        if (PageIndex < 1 )
        {
            self.indicator.frame.origin.x = scrollView.contentOffset.x / 3
            
            
        }else
        {
           
            
                self.Bar.setContentOffset(CGPoint(x:  CGFloat(PageIndex - 1) * (self.view.frame.width / 3)    , y: 0 ), animated: true)
            
            
         }
            
        
            
        }
        
 

    }
    
  
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
       
        
        
    }
    
    
    
    
}

