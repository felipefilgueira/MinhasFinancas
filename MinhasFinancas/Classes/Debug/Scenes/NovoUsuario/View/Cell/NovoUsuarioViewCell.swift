//
//  NovoUsuarioViewCell.swift
//  MinhasFinancas
//
//  Created by Felipe Filgueira on 23/05/22.
//


import Foundation
import UIKit
import SnapKit



class NovoUsuarioViewCell: UITableViewCell {
    private(set) var linhaView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    private(set) var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0
        return label
    }()
    
    private(set) var textfield: UITextField = {
        let txt = UITextField()
        txt.borderStyle = .roundedRect
        return txt
    }()
    
    private(set) var errorMessage: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0
        return label
    }()
    
    func setup(title: String, value: String) {
        self.titleLabel.text = title
        self.textfield.text = value
        setupViewConfiguration()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        textfield.addGestureRecognizer(gesture)
        NotificationCenter.default.addObserver(self, selector: #selector(tap), name: .tapTextView, object: nil)
    }
    
    @objc func tap() {
        textfield.resignFirstResponder()
    }
    
    func showErrorMessage(message: String) {
        errorMessage.text = message
    }

}

extension NovoUsuarioViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        self.contentView.addSubview(linhaView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(textfield)
        self.contentView.addSubview(errorMessage)

    }
    
    func configureView() {
        //contentView.backgroundColor = .systemBackground
    }
    
    func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.height.equalTo(120)
            make.left.right.equalToSuperview()
        }
        
        linhaView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(8)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(linhaView.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        textfield.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        errorMessage.snp.makeConstraints { make in
            make.top.equalTo(textfield.snp_bottomMargin).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }
}
