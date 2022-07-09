//
//  UserFirebase.swift
//  MinhasFinancas
//
//  Created by Felipe Filgueira on 29/05/22.
//

import Foundation
import FirebaseAuth

class UserFirebase{
    func createUser(email: String, password: String, completion: @escaping (_ success: Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            print(error)
            print(authResult)
            if error == nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
