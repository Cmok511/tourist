import Foundation
import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        
        let mainController = generateController(
            rootViewVontroller: MainScreenAssembly.assemblyScene(),
            image: UIImage(systemName: "mic.circle.fill"))
        
        let auth = generateController(rootViewVontroller: AuthAssembly.assemblyScene(), image: UIImage(systemName: "mic.circle.fill"))
                                    
        viewControllers = [
            mainController,
            auth,
        ]
    }
}

// MARK: - Private Methods

private extension TabBarController {
    func commonInit() {
        tabBar.backgroundColor = .white
       }
    
    func generateController(
        rootViewVontroller: UIViewController,
        image: UIImage?
    ) -> UINavigationController {
       
        let controller = UINavigationController(rootViewController: rootViewVontroller)
        controller.tabBarItem.image = image
        controller.navigationBar.tintColor = .red
        return controller
    }
}

