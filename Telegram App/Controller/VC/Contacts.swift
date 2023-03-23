import UIKit

class Contacts: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
 
    var names = [
        ["Arslon","Abduraxmon","Abduqodir"],
        ["Bobur","Botir"],
        ["Sarvar"]
    ]
    
    var img = UIImage()
    
    var empty:[String] = []
    var sortedNames:[[String]] = [[]]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contacts"
        setupBarItem()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "Cellcha", bundle: nil), forCellReuseIdentifier: "Cellcha")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getPhotoFromServer()
        tableView.reloadData()
    }

    func setupBarItem(){
        
        let leftItem = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(leftBtnPressed(_:)))
        navigationItem.leftBarButtonItem = leftItem

        let rightItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(rightBtnPressed(_:)))
        navigationItem.rightBarButtonItem = rightItem
        
    }
    
    @objc func leftBtnPressed(_ sender : UIButton){
        
    }
    
    @objc func rightBtnPressed(_ sender : UIButton){
        
    }
    
    //MARK: URLSession
    
    func getPhotoFromServer(){

        let api = "https://picsum.photos/200/300"
        
        guard let apiURL = URL(string: api) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: apiURL) { ( data, response, error) in
            guard let data = data , error == nil else { return }
               
            DispatchQueue.main.async { [self] in
                img = UIImage(data: data)!
                
            }
            
        }
        
        task.resume()
    }
    
}

//MARK: UITableViewDataSource

extension Contacts :  UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        if section == 0 {
            return  2
        } else if section == 1{
            return 3
        } else if section == 2 {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        if indexPath.section == 0 && indexPath.row == 0 {
            cell.textLabel?.text = "Find People Nearby"
            cell.imageView?.image = UIImage(named: "locationImg")

        } else if indexPath.section == 0 && indexPath.row == 1 {
            cell.textLabel?.text = "Invite Friends"
            cell.imageView?.image = UIImage(systemName: "plus")
        } else {
           
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "Cellcha", for: indexPath) as! Cellcha
                        
            if indexPath.section == 1 {
                cell2.updateName(name: names[0][indexPath.row], image: img)
            } else if indexPath.section == 2 {
                cell2.updateName(name: names[1][indexPath.row], image: img)
            } else  {
                cell2.updateName(name: names[2][indexPath.row], image: img)
            }
            
            cell2.secondLbl.isHidden = true
            cell2.selectionStyle = .none
            
            return cell2
            
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0: return ""
        case 1: return "A"
        case 2: return "B"
        default: return "S"
        }
    }
}
