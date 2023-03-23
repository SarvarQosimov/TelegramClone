

import UIKit

class InsideChat: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!{
        didSet {
            tableView.dataSource = self
        }
    }
    
    @IBOutlet weak var messageTF: UITextField!{
        didSet {
            messageTF.delegate = self
        }
        
    }
        
    var messages = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func sendPressed(_ sender: Any) {
       
        messages.append(messageTF.text!)
        messageTF.text = ""
        tableView.reloadData()
    }
        
}

extension InsideChat: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = messages[indexPath.row]
        cell.textLabel?.textAlignment = .right
        cell.contentView.backgroundColor = .clear
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
                
        return cell
    }
    
}

extension InsideChat: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        messages.append(messageTF.text!)
        messageTF.text = ""
        tableView.reloadData()
        return true
        
    }
        
}
