//
//  NovoUsuarioFooterViewCell.swift
//  MinhasFinancas
//
//  Created by Felipe Filgueira on 23/05/22.
//

import UIKit
import SnapKit

protocol NovoUsuarioFooterViewCellDelegate: AnyObject {
    func cadastrarUsuario()
}

class NovoUsuarioFooterViewCell: UITableViewCell {
    
    var delegate: NovoUsuarioFooterViewCellDelegate?
    
    private(set) var cadastrarButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.addTarget(self, action: #selector(tapCadastrar), for: .touchUpInside)
        return button
    }()
    
    func setup() {
        setupViewConfiguration()
        contentView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        gesture.cancelsTouchesInView = false
        contentView.addGestureRecognizer(gesture)
    }
    
    @objc
    func tapCadastrar() {
        delegate?.cadastrarUsuario()
    }
    
    @objc
    func tap() {
        let tapTextView = Notification.Name("tapTextView")
        NotificationCenter.default.post(name: tapTextView, object: nil)
    }
}

extension NovoUsuarioFooterViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        self.contentView.addSubview(cadastrarButton)
    }
    
    func configureView() {
        contentView.backgroundColor = .blue
    }
    
    func setupConstraints() {
        cadastrarButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
