//
//  CreatureListViewModel.swift
//  HandsTest
//
//  Created by Артём Бацанов on 03.06.2024.
//

import Foundation

class CreatureListViewModel: TableViewModel {
    // MARK: - Properties
    var onNeedsToInsertRow: ((IndexPath) -> Void)?
    var onNeedsToUpdateRow: ((IndexPath) -> Void)?
    var onNeedsToRemoveRow: ((IndexPath) -> Void)?
    
    let footerViewModel: TableHeaderFooterViewModel = EmptyFooterViewModel()
    
    private(set) var itemCellViewModels: [TableCellViewModel] = []
    
    private var creaturesList: [CreatureTypes] = []
    
    private var counterAliveCreatures: Int = 0
    private var counterDeadCreatures: Int = 0
        
    // MARK: - Public methods
    func didTapCreateButton() {
        createCreature()
        checkCountersCreatures()
    }
    
    // MARK: - Private methods
    private func createCreature() {
        let creature = CreatureTypes.random()
        creaturesList.append(creature)
        updateItemViewModels(with: creature)
        updateCounters(with: creature)
    }
    
    private func updateCounters(with creatureType: CreatureTypes) {
        switch creatureType {
        case .alive:
            counterAliveCreatures += 1
            counterDeadCreatures = 0
        case .dead:
            counterDeadCreatures += 1
            counterAliveCreatures = 0
        case .baby:
            break
        }
    }
    
    private func checkCountersCreatures() {
        if counterAliveCreatures == 3 {
            createBabyCreatures()
        }
        if counterDeadCreatures == 3 {
            killAliveCreature()
        }
    }
        
    private func createBabyCreatures() {
        counterAliveCreatures = 0
        let creatureType = CreatureTypes.baby
        creaturesList.append(creatureType)
        updateItemViewModels(with: creatureType)
    }
    
    private func killAliveCreature() {
        guard itemCellViewModels.count > 3 else { return }
        let aliveCreatureIndex = itemCellViewModels.count - counterDeadCreatures - 1
        
        if checkIsAlive(aliveCreatureIndex) {
            counterDeadCreatures = 0
            itemCellViewModels.remove(at: aliveCreatureIndex)
            creaturesList.remove(at: aliveCreatureIndex)
            let indexPath = IndexPath(row: aliveCreatureIndex, section: 0)
            onNeedsToRemoveRow?(indexPath)
        }
    }
    
    private func checkIsAlive(_ aliveCreatureIndex: Int) -> Bool {
        let creature = creaturesList[aliveCreatureIndex]
        
        switch creature {
        case .alive, .baby:
            return true
        case .dead:
            return false
        }
    }
        
    private func updateItemViewModels(with creatureType: CreatureTypes) {
        let itemViewModel = CreatureCellViewModel(creatureType: creatureType)
        itemCellViewModels.append(itemViewModel)
        let indexPath = IndexPath(row: itemCellViewModels.count - 1, section: 0)
        onNeedsToInsertRow?(indexPath)
        onNeedsToUpdateRow?(indexPath)
    }
}
