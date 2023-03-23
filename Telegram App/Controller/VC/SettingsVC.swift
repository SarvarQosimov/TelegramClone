//
//  SettingsVC.swift
//  Telegram App
//
//  Created by Sarvar Qosimov on 21/03/23.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UINib(nibName: "CellForSettings", bundle: nil), forCellReuseIdentifier: "CellForSettings")
            
            tableView.register(UINib(nibName: "CellForSettingsMain", bundle: nil), forCellReuseIdentifier: "CellForSettingsMain")
        }
        
    }
    
    let img0 = [
    "cameraPlus"
    ]
    
    let img1 = [
        "QS",
        "plus"
    ]
    
    let img2 = [
        "saved message",
        "phoneImg",
        "devices",
        "chat folder"
    ]
    
    let img3 = [
        "notification",
        "privacy",
        "dataAndStorage",
        "Apearance",
        "Power Saving",
        "Language"
    ]
    
    let img4 = [
        "Telegram Premium"
    ]
    
    let img5 = [
        "Ask a Quation",
        "Telegram FAQ",
        "Telegram Feature"
    ]
    
    let name0 = [
        "Set Profile Photo"
    ]
    
    let name1 = [
        "Qosimov Sarvar",
        "Add Account"
    ]
    
    let name2 = [
        "Saved Messages",
        "Recent Calls",
        "Devices",
        "Chat Folders"
    ]
    
    let name3 = [
        "Notifications and Sounds",
        "Privacy and Security",
        "Data and Storage",
        "Apearance",
        "Power Saving",
        "Language"
    ]
    
    let name4 = [
        "Telegram Premium"
    ]
    
    let name5 = [
        "Ask a Quation",
        "Telegram FAQ",
        "Telegram Feature"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

//MARK: UITableViewDataSource

extension SettingsVC: UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0: return 2
        case 1: return 2
        case 2: return 4
        case 3: return 6
        case 4: return 1
        default: return 3
        
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 && indexPath.row == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellForSettingsMain", for: indexPath) as? CellForSettingsMain else { return UITableViewCell() }
            
            cell.selectionStyle = .none
            
            return cell
            
        } else {
                    
           guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellForSettings", for: indexPath) as?
                    CellForSettings else { return UITableViewCell() }
           
            if indexPath.section == 0 || indexPath.section == 1 {
                cell.chevronImg.isHidden = true
            }
            
            ///` setup images and names
            
            switch indexPath.section {
            case 0:
            cell.updataCell(image: img0[0], name: name0[0])
            case 1:
            cell.updataCell(image: img1[indexPath.row], name: name1[indexPath.row])
            case 2:
            cell.updataCell(image: img2[indexPath.row], name: name2[indexPath.row])
            case 3:
            cell.updataCell(image: img3[indexPath.row], name: name3[indexPath.row])
            case 4:
            cell.updataCell(image: img4[indexPath.row], name: name4[indexPath.row])
            default:
            cell.updataCell(image: img5[indexPath.row], name: name5[indexPath.row])
            }
            
            
            cell.selectionStyle = .none
            
           return cell

        }
    }
}

//MARK: UITableViewDelegate

extension SettingsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0  && indexPath.row == 0{
            return 200
        } else {
            return 50
        }
    }
    
}
