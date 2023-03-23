

import UIKit

class Tabbar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        setUpTabbar()
        selectedIndex = 2
    }
    
    func setUpTabbar(){
                
        let vc1 = Contacts(nibName: "Contacts", bundle: nil)
        let item1 = UITabBarItem(title: "Contacts", image: UIImage(systemName: "person"), selectedImage: nil)
        vc1.tabBarItem = item1
        vc1.getPhotoFromServer()
       
        let navi1 = UINavigationController(rootViewController: vc1)
        
        let vc2 = Chats(nibName: "Chats", bundle: nil)
        let item2 = UITabBarItem(title: "Chats", image: UIImage(systemName: "message.fill"), selectedImage: nil)
        let navi2 = UINavigationController(rootViewController: vc2)
        vc2.tabBarItem = item2
        vc2.getPhotoFromServer()
        
        let vc3 = SettingsVC(nibName: "SettingsVC", bundle: nil)
        let item3 = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), selectedImage: nil)
        vc3.tabBarItem = item3
        let navi3 = UINavigationController(rootViewController: vc3)
        
        viewControllers = [navi1,navi2,navi3]
        
    }
}
