//
//  ViewController.swift
//  RxExample-iOS
//
//  Created by Kensuke Hoshikawa on 2017/12/03.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import UIKit

final class NumbersViewController: UIViewController, Storyboardable {
    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var number3: UITextField!

    @IBOutlet weak var result: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
