//
//  Creature.swift
//  HandsTest
//
//  Created by Артём Бацанов on 03.06.2024.
//

import UIKit

enum GradientTypes {
    case cyan
    case orange
    case purple
    
    var colors: [UIColor] {
        switch self {
        case .cyan:
            return [.accentCyan, .accentCyanLight]
        case .orange:
            return [.accentOrange, .accentOrangeLight]
        case .purple:
            return [.accentPurple, .accentPurpleDark]
        }
    }
}

enum CreatureTypes: Int {
    case alive
    case dead
    case baby
    
    var gradient: GradientTypes {
        switch self {
        case .alive:
            return .orange
        case .dead:
            return .cyan
        case .baby:
            return .purple
        }
    }
    
    var emojiText: String {
        switch self {
        case .alive:
            "💥"
        case .dead:
            "💀"
        case .baby:
            "🐣"
        }
    }
    
    var status: String {
        switch self {
        case .alive:
            R.string.creatureList.creatureTypeAliveStatus()
        case .dead:
            R.string.creatureList.creatureTypeDeadStatus()
        case .baby:
            R.string.creatureList.creatureTypeBabyStatus()
        }
    }
    
    var description: String {
        switch self {
        case .alive:
            R.string.creatureList.creatureTypeAliveDescription()
        case .dead:
            R.string.creatureList.creatureTypeDeadDescription()
        case .baby:
            R.string.creatureList.creatureTypeBabyDescription()
        }
    }
    
    static func random() -> CreatureTypes {
        let randomInt = Int.random(in: 0..<2)
        if randomInt == 0 {
            return .alive
        } else {
            return .dead
        }
    }
}
