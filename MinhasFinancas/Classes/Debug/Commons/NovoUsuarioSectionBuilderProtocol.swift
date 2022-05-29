//
//  NovoUsuarioSectionBuilderProtocol.swift
//  MinhasFinancas
//
//  Created by Felipe Filgueira on 23/05/22.
//

import Foundation

protocol NovoUsuarioSectionBuilderProtocol {
    var title: String { get }
    var cell: AnyClass { get }
    var identifier: String { get }
}

class NovoUsuarioSectionBuilder: NovoUsuarioSectionBuilderProtocol {
    var title: String
    var cell: AnyClass
    var identifier: String
    
    init(title: String,
         cell: AnyClass,
         identifier: String) {
        self.title = title
        self.cell = cell
        self.identifier = identifier
    }
}
