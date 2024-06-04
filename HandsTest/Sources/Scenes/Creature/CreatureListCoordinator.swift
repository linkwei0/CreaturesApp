//
//  CreatureListCoordinator.swift
//  HandsTest
//
//  Created by Артём Бацанов on 03.06.2024.
//

import Foundation

class CreatureListCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    var onDidFinish: (() -> Void)?
    
    let navigationController: NavigationController

    required init(navigationController: NavigationController) {
        self.navigationController = navigationController
    }
    
    func start(_ animated: Bool) {
        showCreatureListScreen(animated: animated)
    }
    
    private func showCreatureListScreen(animated: Bool) {
        let viewModel = CreatureListViewModel()
        let viewController = CreatureListViewController(viewModel: viewModel)
        addPopObserver(for: viewController)
        navigationController.pushViewController(viewController, animated: animated)
    }
}
