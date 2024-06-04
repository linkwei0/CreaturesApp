//
//  EmptyFooterViewModel.swift
//  HandsTest
//
//  Created by Артём Бацанов on 04.06.2024.
//

import Foundation

class EmptyFooterViewModel {}

// MARK: - Init
extension EmptyFooterViewModel: TableHeaderFooterViewModel {
    var tableReuseIdentifier: String {
        return EmptyFooterView.reuseIdentifier
    }
}
