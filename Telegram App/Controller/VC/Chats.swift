import UIKit

class Chats: UIViewController {

    @IBOutlet weak var currentView: UIView!
    @IBOutlet weak var tableView1:UITableView! {
        didSet{
            tableView1.dataSource = self
            tableView1.delegate = self
            tableView1.register(UINib(nibName: "Cellcha", bundle: nil), forCellReuseIdentifier: "Cellcha")
        }
    }
    @IBOutlet weak var tableView2:UITableView!{
        didSet {
            tableView2.dataSource = self
            tableView2.delegate = self
            tableView2.register(UINib(nibName: "Cellcha", bundle: nil), forCellReuseIdentifier: "Cellcha")
        }
    }
    @IBOutlet weak var tableView3: UITableView! {
        didSet {
            tableView3.dataSource = self
            tableView3.delegate = self
            tableView3.register(UINib(nibName: "Cellcha", bundle: nil), forCellReuseIdentifier: "Cellcha")
        }
    }
    @IBOutlet weak var scrollDelegate:UIScrollView!
    @IBOutlet var headerBtnOutLet: [UIButton]!
    
    var data = [
        
        dataModel(img: UIImage(systemName: "apple.logo")!, main: "ios juft kunlari", second: "salom", date: "20:15"),
        
        dataModel(img: UIImage(systemName: "apple.logo")!, main: "kun.uz English", second: "Helth Ministry provides", date: "Thu"),
        
        dataModel(img: UIImage(systemName: "apple.logo")!, main: "Alif Tech", second: "#Exadel_RelaxingFridays", date: "23:57"),
        
        dataModel(img: UIImage(systemName: "apple.logo")!, main: "Yangiliklar", second: "Fevral oyida 112 ta “Onix” avtomobili ", date: "08:20"),
        
        dataModel(img: UIImage(systemName: "apple.logo")!, main: "TechCells", second: "Узбекистан занимает второе место в мире", date: "19:39"),
        
        dataModel(img: UIImage(systemName: "apple.logo")!, main: "Noutbooklar", second: "More than 870 thousand tourists visited ", date: "12:20"),
        
        dataModel(img: UIImage(systemName: "apple.logo")!, main: "Exadel Global", second: "#Vakansiya Kompaniya: Grant Capital", date: "00:30"),
        
        dataModel(img: UIImage(systemName: "apple.logo")!, main: "Mashinalar kanali", second: "«Cambridge LC» va «Najot Ta'lim» ", date: "09:00"),
        
        dataModel(img: UIImage(systemName: "apple.logo")!, main: "Exadel Global", second: "IT компания «RealSoft» приглашает Strong Junior ", date: "13:22"),
        
        dataModel(img: UIImage(systemName: "apple.logo")!, main: "Dunyo yangiliklari", second: "ТОП-10 стран во внешнеторговом ", date: "23:30")


    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        title = "Chats"
        setupItem()
        scrollDelegate.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        getPhotoFromServer()
        tableView1.reloadData()
        tableView2.reloadData()
        tableView3.reloadData()
    }
    
    @objc func item1Btn(_ sender : Any){
        getPhotoFromServer()
        tableView1.reloadData()
        tableView2.reloadData()
        tableView3.reloadData()
    }
   
    @IBAction func headerBtn(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3) { [self] in
         
            getPhotoFromServer()
            self.data.shuffle()
           
            switch sender.tag {
                
            case 0 : self.scrollDelegate.contentOffset.x = 0
                self.currentView.transform = CGAffineTransform(translationX: 0, y: 0)
                self.clearTintButton()
                self.headerBtnOutLet[0].tintColor = .tintColor
           
            case 1 : self.scrollDelegate.contentOffset.x = self.scrollDelegate.frame.width
                self.currentView.transform = CGAffineTransform(translationX: self.currentView.frame.width + 60, y: 0)
                self.clearTintButton()
                self.headerBtnOutLet[1].tintColor = .red
                
            default: self.scrollDelegate.contentOffset.x = self.scrollDelegate.frame.width*2
                self.currentView.transform = CGAffineTransform(translationX: self.currentView.frame.width*3 + 50, y: 0)
                self.clearTintButton()
                self.headerBtnOutLet[2].tintColor = .tintColor
            }
        
        }
       
        tableView1.reloadSections(IndexSet(integer: 0), with: .middle)
        tableView2.reloadSections(IndexSet(integer: 0), with: .middle)
        tableView3.reloadSections(IndexSet(integer: 0), with: .middle)

    }
    
    //  MARK: Functions
    
    func setupItem(){
      
        let item1 = UIBarButtonItem(title:"Edit", style: .plain, target: self, action: #selector(item1Btn(_:)))
        navigationItem.leftBarButtonItem = item1
        
        let item2 = UIBarButtonItem(image: UIImage(systemName: "note.text"), style: .plain, target: self, action: #selector(item1Btn(_:)))
        navigationItem.rightBarButtonItem = item2
    }
    
    func getPhotoFromServer(){

        let api = "https://picsum.photos/200/300"
        
        guard let apiURL = URL(string: api) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: apiURL) { ( data, response, error) in
            guard let data = data , error == nil else { return }
               
            DispatchQueue.main.async {
                for i in self.data.enumerated() {
                    self.data[i.offset].img = UIImage(data: data)!
                }
            }
        }
        
        task.resume()
    }
}

//  MARK: UITableViewDataSource

extension Chats : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cellcha", for: indexPath) as?
            Cellcha else { return UITableViewCell()}
        
    
    cell.updateCell(par: data[indexPath.row])
        
    return cell
 }
    
}

//  MARK: UITableViewDelegate

extension Chats: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let vc = InsideChat(nibName: "InsideChat", bundle: nil)
        hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
        hidesBottomBarWhenPushed = false

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}

// MARK: UIScrollViewDelegate

extension Chats : UIScrollViewDelegate {
        
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        currentView.transform = CGAffineTransform(translationX: scrollView.contentOffset.x/3, y: 0)
    }
    
    func clearTintButton(){
        for i in headerBtnOutLet {
            i.tintColor = .lightGray
        }
    }
}

