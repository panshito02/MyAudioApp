//
//  HomePageCell.swift
//  MyAudioApp
//
//  Created by Francisco Higuera Zamarripa on 28/06/20.
//  Copyright © 2020 Francisco Higuera Zamarripa. All rights reserved.
//

import UIKit

class HomePageCell: UITableViewCell {

    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var tittleCell: UILabel!
    
    var color = [ UIColor(red: 103/255.0, green: 73/255.0, blue: 124/255.0, alpha: 1)
        , UIColor(red: 44/255.0, green: 56/255.0, blue: 124/255.0, alpha: 1)]
    static var iColor = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareCell()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepareCell(){
        
        viewCell.backgroundColor = color[0]
       // HomePageCell.iColor += 1
        
        viewCell.layer.shadowColor = UIColor(red:0/255.0, green: 0/255.0 ,blue: 0/255.0,alpha: 1.0).cgColor
        viewCell.layer.borderColor = UIColor(red:255/255.0, green: 255/255.0 ,blue: 255/255.0,alpha:1.0).cgColor
        viewCell.layer.shadowOffset = CGSize(width:0, height:1.75)
        viewCell.layer.shadowRadius = 1.75
        viewCell.layer.shadowOpacity = 0.9
        viewCell.layer.cornerRadius = 9
        
        imgCell.layer.cornerRadius = 30
    }

}
