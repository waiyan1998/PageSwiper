//
//  TabBarOptions.swift
//  PageSwiper
//
//  Created by Wai Yan on 2/6/20.
//  Copyright © 2020 Wai Yan. All rights reserved.
//

import UIKit

public  class TabBarOptions  : NSObject  {
    
    public enum BarType {
        
    case  ImageAndLabel
    case  TextOnly
        
    }
    
    
    public var Bartype : TabBarOptions.BarType?
    public var TextColor     : UIColor?
    public var BgColor    : UIColor
    public var HightlightedColor : UIColor?
    public var ItemSize          :  CGSize?
    public var ItemCount         : Int?
    public var Texts : [String]?
    public var Images : [UIImage]?
    
    override init() {
        
        self.TextColor = UIColor.white
        self.BgColor = UIColor.clear
        self.HightlightedColor = UIColor.blue
        self.Bartype    = .TextOnly
        self.ItemCount = 0
        self.ItemSize   = CGSize.zero
        
    }
    
    
    
    
    
//    init( TextColor : UIColor , BackgroundColor : UIColor , HighlightedColor : UIColor  ) {
//
//        self.TextColor = TextColor
//        self.BackgroundColor = BackgroundColor
//        self.HightlightedColor = HighlightedColor
//    }
}





