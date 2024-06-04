//
//  CreatureCellViewModel.swift
//  HandsTest
//
//  Created by Артём Бацанов on 03.06.2024.
//

import Foundation

class CreatureCellViewModel {
    // MARK: - Properties
    var onWillDisplay: (() -> Void)?
    
    var backgroundGradient: GradientTypes {
        return creatureType.gradient
    }
    
    var emojiText: String {
        return creatureType.emojiText
    }
    
    var status: String {
        return creatureType.status
    }
    
    var descriptionInfo: String {
        return creatureType.description
    }
    
    private let creatureType: CreatureTypes
    
    // MARK: - Init
    init(creatureType: CreatureTypes) {
        self.creatureType = creatureType
    }
}

// MARK: - TableCellViewModel
extension CreatureCellViewModel: TableCellViewModel {    
    var tableReuseIdentifier: String {
        return CreatureCell.reuseIdentifier
    }
    
    func select() {
        print("selected cell \(creatureType.status)")
    }
}
