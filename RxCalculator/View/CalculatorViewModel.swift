//
//  CalculatorViewModel.swift
//  RxCalculator
//
//  Created by hiromasa.suzuki.ts on 2019/05/17.
//  Copyright © 2019 hir-suzuki. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

enum LastTapButton {
    case number
    case operation
    case equal
    case allClear
}

class CalculatorViewModel {

    private var lastTapButton: LastTapButton = .allClear

    private let model = CalculatorModel()

    let displayNum = BehaviorRelay(value: "0")

    private var formerInputNumber: Double?

    private var currentInputNumber: Double?

    private var result: Double?

    //  + , - , × , ÷
    private var operation: Operation = .none

    private var nextResetDisplayFlag: Bool = true

    /// 計算する
    private func calucurate() {
        var firstNum: Double = 0.0

        if let lastResult = result {
            firstNum = lastResult
        } else if let formerInputNumber = formerInputNumber {
            firstNum = formerInputNumber
        }
        guard let secondNum = currentInputNumber else {
            return
        }
        result = model.calucurate(operation: operation, firstNum: firstNum, secondNum: secondNum)
    }

    /// 表示更新
    private func updateDisplayNum() {
        calucurate()
        guard let result = result else {
            return
        }
        if (abs(result.truncatingRemainder(dividingBy: 1.0)).isLess(than: .ulpOfOne)) {
            if result < Double(Int.max) {
                let integerNumber = String(Int(result))
                // 小数点なし
                displayNum.accept(String(integerNumber))
            }
        } else {
            // 小数点あり
            displayNum.accept(String(result))
        }
    }

    /// 数字ボタンをタップ
    ///
    /// - Parameter inputNum: 入力した数値
    func tapNumberButton(inputNum: String) {
        if nextResetDisplayFlag == true {
            nextResetDisplayFlag = false
            displayNum.accept("")
        }
        let newNum = displayNum.value + inputNum
        displayNum.accept(newNum)

        lastTapButton = .number
    }

    /// イコールボタンをタップ
    func tapEqualButton() {
        nextResetDisplayFlag = true

        switch lastTapButton {
        case .number:
            currentInputNumber = atof(displayNum.value)
            updateDisplayNum()
        case .operation:
            break
        case .equal:
            updateDisplayNum()
        case .allClear:
            break
        }
        lastTapButton = .equal
    }

    /// 計算記号ボタンをタップ
    ///
    /// - Parameter operationType: タップした記号(+-*/)
    func tapOperationButton(operationType: Operation) {
        nextResetDisplayFlag = true
        switch lastTapButton {
        case .number:
            if formerInputNumber != nil {
                if result != nil {
                    currentInputNumber = atof(displayNum.value)
                } else {
                    currentInputNumber = formerInputNumber
                }
                updateDisplayNum()
            } else {
                formerInputNumber = atof(displayNum.value)
            }
            lastTapButton = .operation
            operation = operationType
        case .operation:
            operation = operationType
            if lastTapButton != .number {
                lastTapButton = .operation
            }
        case .equal:
            lastTapButton = .operation
            operation = operationType
        case .allClear:
            lastTapButton = .operation
            operation = operationType
        }
    }

    /// ACボタンをタップ
    func tapAllClearButton() {
        operation = .none
        formerInputNumber = nil
        currentInputNumber = nil
        displayNum.accept("0")
        nextResetDisplayFlag = true
        result = nil
        lastTapButton = .allClear
    }
}
