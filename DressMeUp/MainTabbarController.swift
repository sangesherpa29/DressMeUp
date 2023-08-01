import UIKit

class MainTabbarController: UITabBarController {
    
    var primaryLabelColor : UIColor = {
        return UIColor(red: 238/255, green: 245/255, blue: 219/255, alpha: 1)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = UIColor(red: 254/255, green: 95/255, blue: 85/255, alpha: 1)

        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let closetsVC = UINavigationController(rootViewController: ClosetsViewController())
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        
        homeVC.tabBarItem.image = UIImage(systemName: "house")?.withTintColor(primaryLabelColor, renderingMode: .alwaysOriginal)
        closetsVC.tabBarItem.image = UIImage(named: "Closets")?.withTintColor(primaryLabelColor, renderingMode: .alwaysOriginal)
        profileVC.tabBarItem.image = UIImage(named: "Profile")?.withTintColor(primaryLabelColor, renderingMode: .alwaysOriginal)
        
        
        setViewControllers([homeVC, closetsVC, profileVC], animated: true)
    }
}
