//
//  EmptyFooterView.swift
//  HandsTest
//
//  Created by Артём Бацанов on 04.06.2024.
//

import UIKit

class EmptyFooterView: UITableViewHeaderFooterView, TableHeaderFooterView {
    // MARK: - Properties
    
    // MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Configure
    func configure(with viewModel: TableHeaderFooterViewModel) {}
    
    // MARK: - Setup
    private func setup() {
        setupBackground()
    }
    
    private func setupBackground() {
        contentView.backgroundColor = .clear
    }
}
