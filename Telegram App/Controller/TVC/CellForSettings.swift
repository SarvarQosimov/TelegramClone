//
//  CellForSettings.swift
//  Telegram App
//
//  Created by Sarvar Qosimov on 21/03/23.
//

import UIKit

class CellForSettings: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var lbl: UILabel!
    
    @IBOutlet weak var chevronImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    func updataCell(image: String, name: String){
        
        img.image = UIImage(named: image)
        lbl.text = name
        
    }
    
    
}
