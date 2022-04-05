import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }

    func setupViewControllers() {
        
        // MARK: Icons for TabBar
        let firstTabImage = UIImage(named: "IconHome")
        let secondTabImage = UIImage(named: "IconFav")
        let thirdTabImage = UIImage(named: "IconShop")
        let fourthTabImage = UIImage(named: "IconNotification")
        let fifthTabImage = UIImage(named: "IconMore")
        
        // MARK: First View Controller in TabBar
        let firstTab = SearchScreenViewController(nibName: "SearchScreenViewController", bundle: nil)
        
        firstTab.navigationItem.backBarButtonItem = UIBarButtonItem(image: UIImage(named: "Icon Back"))
        firstTab.navigationItem.backBarButtonItem?.tintColor = .black

        let firstTabNavigationViewController = UINavigationController(rootViewController: firstTab)
        firstTabNavigationViewController.tabBarItem = UITabBarItem(title: "Inicio", image: firstTabImage, selectedImage: firstTabImage)
        
        
        // MARK: Second View Controller in TabBar
        let secondTab = FavoritesViewController(nibName: "FavoritesViewController", bundle: nil)
        
        let secondTabNavigationViewController = UINavigationController(rootViewController: secondTab)
        
        secondTabNavigationViewController.tabBarItem = UITabBarItem(title: "Favoritos", image: secondTabImage, selectedImage: secondTabImage)
        
        // MARK: Third View Controller in TabBar
        let thirdTab = MyShopsViewController(nibName: "MyShopsViewController", bundle: nil)
        
        let thirdTabNavigationViewController = UINavigationController(rootViewController: thirdTab)
        
        thirdTabNavigationViewController.tabBarItem = UITabBarItem(title: "Mis Compras", image: thirdTabImage, selectedImage: thirdTabImage)
        
        // MARK: Fourth View Controller in TabBar
        let fourthTab = NotificationsViewController(nibName: "NotificationsViewController", bundle: nil)
        
        let fourthTabNavigationViewController = UINavigationController(rootViewController: fourthTab)
        
        fourthTabNavigationViewController.tabBarItem = UITabBarItem(title: "Notificaciones", image: fourthTabImage, selectedImage: fourthTabImage)
        
        // MARK: Fifth View Controller in TabBar
        let fifthTab = NotificationsViewController(nibName: "NotificationsViewController", bundle: nil)
        
        let fifthTabNavigationViewController = UINavigationController(rootViewController: fifthTab)
        
        fifthTabNavigationViewController.tabBarItem = UITabBarItem(title: "Más", image: fifthTabImage, selectedImage: fifthTabImage)
        
        // MARK: List of view controllers in TabBar
        viewControllers = [firstTabNavigationViewController, secondTabNavigationViewController, thirdTabNavigationViewController, fourthTabNavigationViewController, fifthTabNavigationViewController]
        
        // MARK: Styles from TabBar
        tabBar.layer.borderWidth = 0.3
        tabBar.barTintColor = .white
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
    
    }
}
