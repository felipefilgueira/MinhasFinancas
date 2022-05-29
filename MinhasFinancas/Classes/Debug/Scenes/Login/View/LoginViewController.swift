//
//  LoginViewController.swift
//  MinhasFinancas
//
//  Created by Felipe Filgueira on 23/05/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    var loginView: LoginView?
    var viewModel: LoginViewModel?
    
    init(viewModel: LoginViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func loadView() {
        loginView = LoginView()
        loginView?.delegate = self
        view = loginView
    }
}

extension LoginViewController: LoginViewDelegate {
    func cadastro() {
        viewModel?.goToCadastro()
    }
    
    func login() {
        viewModel?.goToHome()
    }
    
}
