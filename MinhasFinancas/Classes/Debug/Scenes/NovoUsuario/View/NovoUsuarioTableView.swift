//
//  NovoUsuarioTableView.swift
//  MinhasFinancas
//
//  Created by Felipe Filgueira on 23/05/22.
//


import Foundation
import UIKit

class NovoUsuarioTableView: UITableView {
    var viewModel: NovoUsuarioViewModel
    
    init(viewModel: NovoUsuarioViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero, style: .plain)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func registerCells() {
        viewModel.getCellData()
        self.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.delegate = self
        self.dataSource = self
        reloadData()
    }
}

extension NovoUsuarioTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = viewModel.cellData[indexPath.row]
        self.register(data.cell, forCellReuseIdentifier: data.identifier)
        
        if data.cell == NovoUsuarioViewCell.self {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: data.identifier, for: indexPath)
                    as? NovoUsuarioViewCell else { return UITableViewCell() }
            print(data.identifier)
            print(indexPath)
            cell.textfield.tag = indexPath.row
            cell.textfield.delegate = self
            if indexPath.row == NovoUsuarioEnum.name.rawValue {
                cell.textfield.becomeFirstResponder()
            }
            let fieldName = NovoUsuarioEnum(rawValue: indexPath.row)?.valueString() ?? ""
            let value = viewModel.carregarInformacao(field: fieldName)
            cell.setup(title: data.title, value: value)
            return cell
        }
        
        if data.cell == NovoUsuarioFooterViewCell.self {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: data.identifier, for: indexPath)
                    as? NovoUsuarioFooterViewCell else { return UITableViewCell() }
            cell.delegate = self
            cell.setup()
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension NovoUsuarioTableView: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        guard let value = textField.text else { return  }
        guard let item = NovoUsuarioEnum(rawValue: textField.tag) else { return  }
        
        viewModel.gravarInformacao(tag: item, value: value)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        let nextTextField = textField.tag + 1
        let indexPath = IndexPath(row: nextTextField, section: 0)
        if let cell = self.cellForRow(at: indexPath) as? NovoUsuarioViewCell {
            cell.textfield.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }

        return false
    }
}

extension NovoUsuarioTableView: NovoUsuarioFooterViewCellDelegate {
    func cadastrarUsuario() {
        viewModel.enviar()
    }
}
