//
//  MenuEntity.swift
//  MyAudioApp
//
//  Created by Francisco Higuera Zamarripa on 28/06/20.
//  Copyright © 2020 Francisco Higuera Zamarripa. All rights reserved.
//

import UIKit

class MenuEntity{
    
    var image : UIImage?
    var tittle: String?
    
    init(){
        
    }
    
    init(image: UIImage, tittle:String){
        self.image = image
        self.tittle = tittle
    }

}
