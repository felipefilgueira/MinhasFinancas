//
//  NovoUsuarioViewController.swift
//  MinhasFinancas
//
//  Created by Felipe Filgueira on 23/05/22.
//

import Foundation
import UIKit

class NovoUsuarioViewController: UIViewController {
    
    var cadastroTableView: NovoUsuarioTableView?
    var viewModel: NovoUsuarioViewModel

    init(viewModel: NovoUsuarioViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        cadastroTableView = NovoUsuarioTableView(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .blue
        cadastroTableView?.registerCells()
        self.view = cadastroTableView
    }
}

