//
//  MinhasFinancasCoordinator.swift
//  MinhasFinancas
//
//  Created by Felipe Filgueira on 23/05/22.
//

import Foundation
import UIKit

enum minhasFinancasPath {
    case login
    case home
    case cadastro
}

public class MinhasFinancasCoordinator {
    var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension MinhasFinancasCoordinator: Coordinator {
    public func start() {
        let viewModel = LoginViewModel(coordinator: self)
        let vc = LoginViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func go(to path: minhasFinancasPath) {
        switch path {
        case .login:
            navigationController.popViewController(animated: true)
        case .home:
//            let viewModel = HomeViewModel(coordinator: self)
//            let vc = HomeViewController(viewModel: viewModel)
//            navigationController.pushViewController(vc, animated: true)
            print("Home")
        case .cadastro:
            let vc = NovoUsuarioViewController()
            navigationController.pushViewController(vc, animated: true)
        }
    }
}
