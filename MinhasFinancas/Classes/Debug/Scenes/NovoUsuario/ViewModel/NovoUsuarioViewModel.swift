//
//  NovoUsuarioViewModel.swift
//  MinhasFinancas
//
//  Created by Felipe Filgueira on 23/05/22.
//


import Foundation

class NovoUsuarioViewModel {
    var model: NovoUsuarioModel?
    var cellData: [NovoUsuarioSectionBuilderProtocol] = []
    
    init() {
        model = NovoUsuarioModel()
    }
    
    func getCellData() {
        var cells = [NovoUsuarioSectionBuilderProtocol]()
        cells.append(geNomeCell())
        cells.append(getEmailCell())
        cells.append(getTelefoneCell())
        cells.append(getSenhaCell())
        cells.append(getCadastrarCell())
        cellData = cells
    }
    
    private func geNomeCell() -> NovoUsuarioSectionBuilderProtocol {
        return NovoUsuarioSectionBuilder(title: "Nome",
                                      cell: NovoUsuarioViewCell.self,
                                         identifier: "\(NovoUsuarioEnum.name.rawValue) ")
    }
    
    private func getEmailCell() -> NovoUsuarioSectionBuilderProtocol {
        return NovoUsuarioSectionBuilder(title: "E-mail",
                                      cell: NovoUsuarioViewCell.self,
                                      identifier: "\(NovoUsuarioViewCell.self) ")
    }
    
    private func getTelefoneCell() -> NovoUsuarioSectionBuilderProtocol {
        return NovoUsuarioSectionBuilder(title: "Telefone",
                                      cell: NovoUsuarioViewCell.self,
                                      identifier: "\(NovoUsuarioViewCell.self) ")
    }
    
    private func getSenhaCell() -> NovoUsuarioSectionBuilderProtocol {
        return NovoUsuarioSectionBuilder(title: "Senha",
                                      cell: NovoUsuarioViewCell.self,
                                      identifier: "\(NovoUsuarioViewCell.self) ")
    }
    
    private func getCadastrarCell() -> NovoUsuarioSectionBuilderProtocol {
        return NovoUsuarioSectionBuilder(title: "",
                                      cell: NovoUsuarioFooterViewCell.self,
                                      identifier: "\(NovoUsuarioFooterViewCell.self) ")
    }
    
    func gravarInformacao(tag: NovoUsuarioEnum, value: String) {
        model?.setModel(field: tag, value: value)
    }
    
    func carregarInformacao(field: String) -> String {
        if let result = model[field] as? String {
            return result
        }
        return ""
    }
    
    func enviar() {
        print(model?.name)
        print(model?.mail)
        print(model?.password)
        print(model?.phone)
    }
}
