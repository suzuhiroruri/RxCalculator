//
//  UIButton+.swift
//  RxCalculator
//
//  Created by hiromasa.suzuki.ts on 2019/05/23.
//  Copyright © 2019 hir-suzuki. All rights reserved.
//

import Foundation
import UIKit

class SelectToggleColorButton: UIButton {

    @IBInspectable var selectedBackgroundColor: UIColor?
    @IBInspectable var nonSelectedBackgroundColor: UIColor?

    override var isSelected: Bool {
        didSet {
            self.backgroundColor =  isSelected ? selectedBackgroundColor : nonSelectedBackgroundColor
            self.setTitleColor(selectedBackgroundColor, for: .normal)
            self.setTitleColor(nonSelectedBackgroundColor, for: .selected)
        }
    }
}
