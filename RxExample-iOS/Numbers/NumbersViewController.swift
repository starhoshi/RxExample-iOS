//
//  ViewController.swift
//  RxExample-iOS
//
//  Created by Kensuke Hoshikawa on 2017/12/03.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class NumbersViewController: UIViewController, Storyboardable {
    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var number3: UITextField!

    @IBOutlet weak var result: UILabel!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        Observable.combineLatest(number1.rx.text.orEmpty, number2.rx.text.orEmpty, number3.rx.text.orEmpty) { text1, text2, text3 -> Int in
            return (Int(text1) ?? 0) + (Int(text2) ?? 0) + (Int(text3) ?? 0)
        }
            .map { $0.description }
            .bind(to: result.rx.text)
            .disposed(by: disposeBag)
    }
}
