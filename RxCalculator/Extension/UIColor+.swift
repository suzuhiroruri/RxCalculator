//
//  UIColor+.swift
//  RxCalculator
//
//  Created by hir-suzuki on 2018/12/27.
//  Copyright © 2018年 hir-suzuki. All rights reserved.
//

import Foundation
import UIKit
import UIGradient

extension UIColor {

    class func navigationGradientColor(frame: CGRect, direction: UIGradient.GradientDirection) -> UIColor {
        guard let flatSkyBlue = R.color.flatSkyBlue() else {
            return UIColor()
        }
        let colors: Array<UIColor> = [flatSkyBlue, UIColor.blue]

        guard let navColor = UIColor.fromGradientWithDirection(direction, frame: frame, colors: colors) else {
            return UIColor()
        }
        return navColor
    }
}
