

import UIKit

class Cellcha: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var mainLbl: UILabel!
    
    @IBOutlet weak var secondLbl: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func updateCell(par: dataModel){
        img.image = par.img
        mainLbl.text = par.main
        secondLbl.text = par.second
        date.text = par.date
        
    }
    
    
    func updateName(name: String, image: UIImage){
        img.image = image
        mainLbl.text = name
        
    }
}
