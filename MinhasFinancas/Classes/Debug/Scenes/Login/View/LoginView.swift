//
//  LoginView.swift
//  MinhasFinancas
//
//  Created by Felipe Filgueira on 23/05/22.
//

import Foundation
import UIKit
import SnapKit

protocol LoginViewDelegate: AnyObject {
    func login()
    func cadastro()
}

class LoginView: UIView {
    
    private(set) var view: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    private(set) var logoImage: UIImageView = {
        let imgView = UIImageView()
        let bundle = Bundle(for: LoginView.self)
        let image = UIImage(named: "financasLogo",
                            in: bundle,
                            compatibleWith: nil)
        imgView.image = image
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.backgroundColor = .blue
        return imgView
    }()
    
    private(set) var  emailLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "E-mail"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private(set) var emailText: UITextField = {
        let tf = UITextField(frame: .zero)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Insira seu e-mail"
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    private(set) var  senhaLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Senha"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private(set) var senhaText: UITextField = {
        let tf = UITextField(frame: .zero)
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite sua senha"
        tf.isSecureTextEntry = true
        tf.borderStyle = .roundedRect
        tf.keyboardType = .numberPad
        return tf
    }()
    
    private(set) var logarBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Logar", for: .normal)
        button.addTarget(self, action: #selector(tapLogar), for: .touchUpInside)
        return button
    }()
    
    private(set) var cadastrarBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.addTarget(self, action: #selector(tapCadastrar), for: .touchUpInside)
        return button
    }()
    
    var delegate: LoginViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewConfiguration()
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self,
                                         action: #selector(dismiss))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        senhaText.inputAccessoryView = toolBar
        emailText.delegate = self
        senhaText.delegate = self
    }
    
    @objc func dismiss() {
       view.endEditing(true)
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapLogar() {
        delegate?.login()
    }
    
    @objc func tapCadastrar() {
        delegate?.cadastro()
    }
}

extension LoginView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(view)
        view.addArrangedSubview(logoImage)
        view.addArrangedSubview(emailLabel)
        view.addArrangedSubview(emailText)
        view.addArrangedSubview(senhaLabel)
        view.addArrangedSubview(senhaText)
        view.addArrangedSubview(logarBtn)
        view.addArrangedSubview(cadastrarBtn)
    }
    
    func configureView() {
        
    }
    
    func setupConstraints() {
        
        logoImage.snp.makeConstraints { make in
            make.height.width.equalTo(200)
        }
        
        view.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(60)
            make.right.equalToSuperview().inset(60)
        }
    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            return true;
        }
        return false
    }
}
