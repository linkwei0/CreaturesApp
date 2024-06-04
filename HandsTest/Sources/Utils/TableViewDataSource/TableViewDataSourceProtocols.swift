//
//  TableViewDataSourceProtocols.swift
//  HandsTest
//
//  Created by Артём Бацанов on 03.06.2024.
//

protocol TableCellViewModel {
    var tableReuseIdentifier: String { get }
    func select()
}

extension TableCellViewModel {
    func select() {}
}

protocol TableHeaderFooterViewModel {
    var tableReuseIdentifier: String { get }
}

protocol TableCell {
    func configure(with viewModel: TableCellViewModel)
}

protocol TableHeaderFooterView {
    func configure(with viewModel: TableHeaderFooterViewModel)
}

protocol TableViewModel {
    var itemCellViewModels: [TableCellViewModel] { get }
    var footerViewModel: TableHeaderFooterViewModel { get }
}
