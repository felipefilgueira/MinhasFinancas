//
//  NewUserSuccessViewControllerTests.swift
//  MinhasFinancas_ExampleUITests
//
//  Created by Felipe Filgueira on 02/06/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import MinhasFinancas

class NewUserSuccessViewControllerTests: QuickSpec {
    override func spec() {
       describe("LoginViewXib"){

           var sut: NewUserSuccessViewController!
           
           beforeEach {
               sut = NewUserSuccessViewController()
           }
           
           it("should have a cool layout") {
//                   expect(sut) == recordSnapshot()
               expect(sut) == snapshot()
           }
       }
   }
}
