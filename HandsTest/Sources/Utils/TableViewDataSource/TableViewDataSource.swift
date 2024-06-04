//
//  TableViewDataSource.swift
//  HandsTest
//
//  Created by Артём Бацанов on 03.06.2024.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    private var tableView: UITableView?
    private var viewModel: TableViewModel?
    
    func setup(tableView: UITableView, viewModel: TableViewModel) {
        self.tableView = tableView
        self.viewModel = viewModel
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    func update(with viewModel: TableViewModel) {
        self.viewModel = viewModel
        tableView?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.itemCellViewModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellViewModel = viewModel?.itemCellViewModels[indexPath.row] else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.tableReuseIdentifier,
                                                 for: indexPath)
        (cell as? TableCell)?.configure(with: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footerViewModel = viewModel?.footerViewModel else { return nil }
        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: footerViewModel.tableReuseIdentifier)
        (footerView as? TableHeaderFooterView)?.configure(with: footerViewModel)
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if viewModel?.footerViewModel != nil {
            return UITableView.automaticDimension
        }
        
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.itemCellViewModels[indexPath.row].select()
    }
}
