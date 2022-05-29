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
    
    func setup(title: String, value: String) {
        self.titleLabel.text = title
        self.textfield.text = value
        setupViewConfiguration()
//        textfield.delegate = self
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tap))
        textfield.addGestureRecognizer(gesture)
        
        let tapTextView = Notification.Name("tapTextView")
        NotificationCenter.default.addObserver(self, selector: #selector(tap), name: tapTextView, object: nil)
    }
    
    @objc func tap() {
        textfield.resignFirstResponder()
    }
}

extension NovoUsuarioViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        self.contentView.addSubview(linhaView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(textfield)

    }
    
    func configureView() {
        //contentView.backgroundColor = .systemBackground
    }
    
    func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.height.equalTo(100)
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
    }
    

}

//extension NovoUsuarioViewCell: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        //print("teste \(textField.tag)")
//        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
//            print("teste1 \(nextField.tag)")
//            nextField.becomeFirstResponder()
//        } else {
//            print("teste2 \(textField.tag)")
//            textField.resignFirstResponder()
//            return true;
//        }
//        return false
//    }
//}
