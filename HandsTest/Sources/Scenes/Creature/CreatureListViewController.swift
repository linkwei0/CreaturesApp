//
//  CreatureListViewController.swift
//  HandsTest
//
//  Created by Артём Бацанов on 03.06.2024.
//

import UIKit

class CreatureListViewController: BaseViewController, NavigationBarHiding {
    // MARK: - Properties
    private let titleLabel = Label(textStyle: .header2)
    private let tableView = UITableView(frame: .zero, style: .grouped)
    private let createButton = UIButton(type: .system)
    
    private let dataSource = TableViewDataSource()
    
    private let viewModel: CreatureListViewModel
    
    // MARK: - Init
    init(viewModel: CreatureListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupBindables()
    }
    
    // MARK: - Actions
    @objc private func didTapCreateButton() {
        viewModel.didTapCreateButton()
    }
    
    // MARK: - Setup
    private func setup() {
        setupBackground()
        setupTitleLabel()
        setupTableView()
        setupCreateButton()
    }
    
    private func setupBackground() {
        view.setGradientBackground(colorOne: .accentPurpleDark, colorTwo: .baseBlack)
    }
    
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .baseWhite
        titleLabel.text = R.string.creatureList.creatureListTitle()
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(5)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(CreatureCell.self, forCellReuseIdentifier: CreatureCell.reuseIdentifier)
        tableView.register(EmptyFooterView.self, forHeaderFooterViewReuseIdentifier: EmptyFooterView.reuseIdentifier)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(2)
            make.leading.trailing.bottom.equalToSuperview()
        }
        dataSource.setup(tableView: tableView, viewModel: viewModel)
    }
    
    private func setupCreateButton() {
        view.addSubview(createButton)
        createButton.setTitleColor(.baseWhite, for: .normal)
        createButton.titleLabel?.font = UIFont.body
        createButton.setTitle(R.string.creatureList.creatureButtonCreateTitle(), for: .normal)
        createButton.layer.cornerRadius = 8
        createButton.backgroundColor = .accentBtn
        createButton.addTarget(self, action: #selector(didTapCreateButton), for: .touchUpInside)
        createButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(40)
        }
    }
    
    private func setupBindables() {
        viewModel.onNeedsToInsertRow = { [weak self] indexPath in
            self?.tableView.insertRows(at: [indexPath], with: .none)
        }
        
        viewModel.onNeedsToRemoveRow = { [weak self] indexPath in
            self?.tableView.deleteRows(at: [indexPath], with: .none)
            self?.tableView.reloadData()
        }
        
        viewModel.onNeedsToUpdateRow = { [weak self] indexPath in
            self?.tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
}
