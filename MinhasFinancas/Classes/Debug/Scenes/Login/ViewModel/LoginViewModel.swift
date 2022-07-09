//
//  LoginViewModel.swift
//  MinhasFinancas
//
//  Created by Felipe Filgueira on 23/05/22.
//

import Foundation

class LoginViewModel {
    var coordinator: MinhasFinancasCoordinator?
    
    init(coordinator: MinhasFinancasCoordinator) {
        self.coordinator = coordinator
    }
    
    func goToHome() {
        coordinator?.go(to: .home)
    }
    
    func goToCadastro() {
        coordinator?.go(to: .newUser)
    }

}
