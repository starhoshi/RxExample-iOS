//
//  SimpleValidationViewController.swift
//  RxExample-iOS
//
//  Created by Kensuke Hoshikawa on 2017/12/04.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class SimpleValidationViewController: UIViewController, Storyboardable {
    @IBOutlet weak var usernameOutlet: UITextField!
    @IBOutlet weak var usernameValidOutlet: UILabel!

    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet weak var passwordValidOutlet: UILabel!

    @IBOutlet weak var doSomethingOutlet: UIButton!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        let usernameValid = usernameOutlet.rx.text.orEmpty
            .map { $0.count >= 5 }
            .debug()
            .share(replay: 1)

        usernameValid
            .bind(to: usernameValidOutlet.rx.isHidden)
            .disposed(by: disposeBag)

        let passwordValid = passwordOutlet.rx.text.orEmpty
            .map { $0.count >= 5 }
            .debug()
            .share(replay: 1)

        passwordValid
            .bind(to: passwordValidOutlet.rx.isHidden)
            .disposed(by: disposeBag)

        Observable.combineLatest(usernameValid, passwordValid) { $0 && $1 }
            .bind(to: doSomethingOutlet.rx.isEnabled)
            .disposed(by: disposeBag)

        doSomethingOutlet.rx.tap
            .subscribe(onNext: { _ in print("tap") })
            .disposed(by: disposeBag)
    }
}
