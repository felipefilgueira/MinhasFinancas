//
//  ViewConfiguration.swift
//  MinhasFinancas
//
//  Created by Felipe Filgueira on 23/05/22.
//

import Foundation

protocol ViewConfiguration {
    func buildViewHierarchy()
    func configureView()
    func setupConstraints()
    func setupViewConfiguration()
}

extension ViewConfiguration {
    func setupViewConfiguration() {
        configureView()
        buildViewHierarchy()
        setupConstraints()
    }
}
