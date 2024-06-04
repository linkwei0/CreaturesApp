//
//  BaseViewController.swift
//  HandsTest
//
//  Created by Артём Бацанов on 03.06.2024.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .baseWhite
    }
}

