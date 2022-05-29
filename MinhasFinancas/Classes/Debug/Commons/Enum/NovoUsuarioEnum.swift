//
//  NovoUsuarioEnum.swift
//  MinhasFinancas
//
//  Created by Felipe Filgueira on 24/05/22.
//

import Foundation

enum NovoUsuarioEnum: Int {
    case name = 0
    case mail = 1
    case phone = 2
    case password = 3
    
    func valueString() -> String{
        switch self {
        case .name:
            return "name"
        case .mail:
            return "mail"
        case .phone:
            return "phone"
        case .password:
            return "password"
        }
    }
}
