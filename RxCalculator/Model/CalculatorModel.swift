//
//  CalculatorModel.swift
//  RxCalculator
//
//  Created by hiromasa.suzuki.ts on 2019/05/22.
//  Copyright © 2019 hir-suzuki. All rights reserved.
//

import Foundation

enum Operation {
    case plus
    case minus
    case multiple
    case division
    case none
}

struct CalculatorModel {

    /// 計算する
    ///
    /// - Parameters:
    ///   - operation: 計算記号
    ///   - firstNum: 一つ目の変数
    ///   - secondNum: 二つ目の変数
    /// - Returns: 結果
    func calucurate(operation: Operation, firstNum: Double, secondNum: Double) -> Double {
        var result = 0.0
        switch operation {
        case .plus:
            result = firstNum + secondNum
        case .minus:
            result = firstNum - secondNum
        case .multiple:
            result = firstNum * secondNum
        case .division:
            result = firstNum / secondNum
        case .none:
            break
        }
        return result
    }
}
