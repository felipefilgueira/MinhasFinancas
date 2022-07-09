//
//  MinhasFinancasCoordinator.swift
//  MinhasFinancas
//
//  Created by Felipe Filgueira on 23/05/22.
//

import Foundation
import UIKit
import FirebaseCore

enum minhasFinancasPath {
    case login
    case home
    case newUser
    case newUserSuccess
    case newUserError
}

public class MinhasFinancasCoordinator {
    var navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension MinhasFinancasCoordinator: Coordinator {
    public func start() {
        FirebaseApp.configure()
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
            let vc = PerguntasFrequentesViewController()
            navigationController.pushViewController(vc, animated: true)
            print("Home")
        case .newUser:
            let viewModel = NovoUsuarioViewModel(coordinator: self)
            let vc = NovoUsuarioViewController(viewModel: viewModel)
            navigationController.pushViewController(vc, animated: true)
        case .newUserSuccess:
            navigationController.popViewController(animated: true)
            let vc = NewUserSuccessViewController()
            navigationController.pushViewController(vc, animated: true)
        case .newUserError:
            let vc = NewUserErrorViewController()
            navigationController.pushViewController(vc, animated: true)
        }
    }
}
