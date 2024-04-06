import Foundation
import UIKit

struct MapViewControllerAssembly {
    static func assemblyScene() -> UIViewController {
        let viewModel = MapViewControllerViewModel()
        let vc = MapViewController()
        return vc
    }
}
