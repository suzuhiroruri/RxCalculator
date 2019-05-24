//
//  CalculatorViewController.swift
//  RxCalculator
//
//  Created by hiromasa.suzuki.ts on 2019/05/20.
//  Copyright © 2019 hir-suzuki. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

enum OperationButton {
    case plus
    case minus
    case multiple
    case division
    case none
}

class CalculatorViewController: UIViewController {

    let viewModel = CalculatorViewModel()

    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!

    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var dotButton: UIButton!

    @IBOutlet weak var divisionButton: SelectToggleColorButton!
    @IBOutlet weak var multipleButton: SelectToggleColorButton!
    @IBOutlet weak var minusButton: SelectToggleColorButton!
    @IBOutlet weak var plusButton: SelectToggleColorButton!

    @IBOutlet weak var equalButton: UIButton!

    @IBOutlet weak var allClearButton: UIButton!

    @IBOutlet weak var displayNumLabel: UILabel!

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        let viewGradientColor = UIColor.navigationGradientColor(frame: view.frame, direction: .topToBottom)
        view.backgroundColor = viewGradientColor

        self.navigationController?.navigationBar.barTintColor = UIColor.clear

        // viewModelとバインディング
        viewModel.displayNum
            .asObservable()
            .bind(to: displayNumLabel.rx.text)
            .disposed(by: disposeBag)

        setUpAction()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        zeroButton.cornerRadius = zeroButton.frame.width / 2
        oneButton.cornerRadius = oneButton.frame.width / 2
        twoButton.cornerRadius = twoButton.frame.width / 2
        threeButton.cornerRadius = threeButton.frame.width / 2
        fourButton.cornerRadius = fourButton.frame.width / 2
        fiveButton.cornerRadius = fiveButton.frame.width / 2
        sixButton.cornerRadius = sixButton.frame.width / 2
        sevenButton.cornerRadius = sevenButton.frame.width / 2
        eightButton.cornerRadius = eightButton.frame.width / 2
        nineButton.cornerRadius = nineButton.frame.width / 2

        acButton.cornerRadius = zeroButton.frame.width / 2
        dotButton.cornerRadius = zeroButton.frame.width / 2
        divisionButton.cornerRadius = divisionButton.frame.width / 2
        multipleButton.cornerRadius = multipleButton.frame.width / 2
        minusButton.cornerRadius = minusButton.frame.width / 2
        plusButton.cornerRadius = plusButton.frame.width / 2
        equalButton.cornerRadius = equalButton.frame.width / 2
    }

    /// アクションを設定
    private func setUpAction() {
        zeroButton.rx.tap
            .subscribe { [weak self] _ in
                guard let `self` = self else { return }
                self.setOperationButtonSelected(tapOperationButton: .none)
                self.viewModel.tapNumberButton(inputNum: "0")
            }
            .disposed(by: disposeBag)

        oneButton.rx.tap
            .subscribe { [weak self] _ in
                guard let `self` = self else { return }
                self.setOperationButtonSelected(tapOperationButton: .none)
                self.viewModel.tapNumberButton(inputNum: "1")
            }
            .disposed(by: disposeBag)

        twoButton.rx.tap
            .subscribe { [weak self] _ in
                guard let `self` = self else { return }
                self.setOperationButtonSelected(tapOperationButton: .none)
                self.viewModel.tapNumberButton(inputNum: "2")
            }
            .disposed(by: disposeBag)

        threeButton.rx.tap
            .subscribe { [weak self] _ in
                guard let `self` = self else { return }
                self.setOperationButtonSelected(tapOperationButton: .none)
                self.viewModel.tapNumberButton(inputNum: "3")
            }
            .disposed(by: disposeBag)

        fourButton.rx.tap
            .subscribe { [weak self] _ in
                guard let `self` = self else { return }
                self.setOperationButtonSelected(tapOperationButton: .none)
                self.viewModel.tapNumberButton(inputNum: "4")
            }
            .disposed(by: disposeBag)

        fiveButton.rx.tap
            .subscribe { [weak self] _ in
                guard let `self` = self else { return }
                self.setOperationButtonSelected(tapOperationButton: .none)
                self.viewModel.tapNumberButton(inputNum: "5")
            }
            .disposed(by: disposeBag)

        sixButton.rx.tap
            .subscribe { [weak self] _ in
                guard let `self` = self else { return }
                self.setOperationButtonSelected(tapOperationButton: .none)
                self.viewModel.tapNumberButton(inputNum: "6")
            }
            .disposed(by: disposeBag)

        sevenButton.rx.tap
            .subscribe { [weak self] _ in
                guard let `self` = self else { return }
                self.setOperationButtonSelected(tapOperationButton: .none)
                self.viewModel.tapNumberButton(inputNum: "7")
            }
            .disposed(by: disposeBag)

        eightButton.rx.tap
            .subscribe { [weak self] _ in
                guard let `self` = self else { return }
                self.setOperationButtonSelected(tapOperationButton: .none)
                self.viewModel.tapNumberButton(inputNum: "8")
            }
            .disposed(by: disposeBag)

        nineButton.rx.tap
            .subscribe { [weak self] _ in
                guard let `self` = self else { return }
                self.setOperationButtonSelected(tapOperationButton: .none)
                self.viewModel.tapNumberButton(inputNum: "9")
            }
            .disposed(by: disposeBag)

        plusButton.rx.tap
            .subscribe { [weak self] _ in
                guard let `self` = self else { return }
                self.setOperationButtonSelected(tapOperationButton: .plus)
                self.viewModel.tapOperationButton(operationType: .plus)
            }
            .disposed(by: disposeBag)

        minusButton.rx.tap
            .subscribe { [weak self] _ in
                guard let `self` = self else { return }
                self.setOperationButtonSelected(tapOperationButton: .minus)
                self.viewModel.tapOperationButton(operationType: .minus)
            }
            .disposed(by: disposeBag)

        multipleButton.rx.tap
            .subscribe { [weak self] _ in
                guard let `self` = self else { return }
                self.setOperationButtonSelected(tapOperationButton: .multiple)
                self.viewModel.tapOperationButton(operationType: .multiple)

            }
            .disposed(by: disposeBag)

        divisionButton.rx.tap
            .subscribe { [weak self] _ in
                guard let `self` = self else { return }
                self.setOperationButtonSelected(tapOperationButton: .division)
                self.viewModel.tapOperationButton(operationType: .division)
            }
            .disposed(by: disposeBag)

        equalButton.rx.tap
            .subscribe { [weak self] _ in
                guard let `self` = self else { return }
                self.setOperationButtonSelected(tapOperationButton: .none)
                self.viewModel.tapEqualButton()
            }
            .disposed(by: disposeBag)

        allClearButton.rx.tap
            .subscribe { [weak self] _ in
                guard let `self` = self else { return }
                self.setOperationButtonSelected(tapOperationButton: .none)
                self.viewModel.tapAllClearButton()
            }
            .disposed(by: disposeBag)

        dotButton.rx.tap
            .subscribe { [weak self] _ in
                guard let `self` = self else { return }
                self.setOperationButtonSelected(tapOperationButton: .none)
                let newNum = self.viewModel.displayNum.value + "."
                self.viewModel.displayNum.accept(newNum)
            }
            .disposed(by: disposeBag)
    }

    /// OperationボタンのSelect処理
    ///
    /// - Parameter tapOperationButton: タップしたOperationボタンのタイプ
    private func setOperationButtonSelected(tapOperationButton: OperationButton) {
        switch tapOperationButton {
        case .plus:
            plusButton.isSelected = true
            minusButton.isSelected = false
            multipleButton.isSelected = false
            divisionButton.isSelected = false
        case .minus:
            plusButton.isSelected = false
            minusButton.isSelected = true
            multipleButton.isSelected = false
            divisionButton.isSelected = false
        case .multiple:
            plusButton.isSelected = false
            minusButton.isSelected = false
            multipleButton.isSelected = true
            divisionButton.isSelected = false
        case .division:
            plusButton.isSelected = false
            minusButton.isSelected = false
            multipleButton.isSelected = false
            divisionButton.isSelected = true
        case .none:
            plusButton.isSelected = false
            minusButton.isSelected = false
            multipleButton.isSelected = false
            divisionButton.isSelected = false
        }
    }
}
