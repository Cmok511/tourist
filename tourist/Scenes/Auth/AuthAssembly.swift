//
//  AuthAssembly.swift
//  tourist
//
//  Created by user on 06.04.2024.
//

import Foundation
import UIKit

struct AuthAssembly {
    static func assemblyScene() -> UIViewController {
        let viewModel = AuthViewModel()
        let vc = AuthController(viewModel: viewModel )
        return vc
    }
}
