//
//  MainCoordinator.swift
//  HandsTest
//
//  Created by Артём Бацанов on 03.06.2024.
//

import Foundation

final class MainCoordinator: Coordinator {
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
        show(CreatureListCoordinator.self, animated: animated)
    }
}
