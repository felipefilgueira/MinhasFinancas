//
//  LoginViewControllerTest.swift
//  MinhasFinancas_Tests
//
//  Created by Felipe Filgueira on 02/06/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import MinhasFinancas

class LoginViewControllerTest: QuickSpec {
    override func spec() {
       describe("LoginViewXib"){
           var view: LoginView!
           
           beforeEach {
               view = LoginView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
               view.translatesAutoresizingMaskIntoConstraints = false
           }
           
           it("should have a cool layout") {
               expect(view) == recordSnapshot()
           }
       }
   }
}
