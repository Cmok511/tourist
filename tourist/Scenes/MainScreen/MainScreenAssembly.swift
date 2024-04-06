//
//  MainScreenAssembly.swift
//  tourist
//
//  Created by user on 06.04.2024.
//

import Foundation
import UIKit

struct MainScreenAssembly {
    static func assemblyScene() -> UIViewController {
        let viewModel = MainScreenViewModel()
        let vc = MainScreenViewController(viewModel: viewModel)
        return vc
    }
}
