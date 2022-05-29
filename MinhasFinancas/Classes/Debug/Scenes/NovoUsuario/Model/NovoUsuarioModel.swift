//
//  DataModel.swift
//  MinhasFinancas
//
//  Created by Felipe Filgueira on 24/05/22.
//

class NovoUsuarioModel: Codable {
    var name: String? = "Felipe"
    var phone: String? = "11 11111-1111"
    var mail: String? = "email@email.com"
    var password: String? = "123456"
    
    func setModel(field: NovoUsuarioEnum, value: String) {
        switch field {
        case .name:
            name = value
        case .mail:
            mail = value
        case .phone:
            phone = value
        case .password:
            password = value
        }
    }
}

struct JSON {
    static let encoder = JSONEncoder()
}

extension Encodable {
    subscript(key: String) -> Any? {
        return dictionary[key]
    }
    var dictionary: [String: Any] {
        return (try? JSONSerialization.jsonObject(with: JSON.encoder.encode(self))) as? [String: Any] ?? [:]
    }
}
