//
//  ViewController.swift
//  RxExample-iOS
//
//  Created by Kensuke Hoshikawa on 2017/12/03.
//  Copyright © 2017年 star__hoshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.delegate = self
        view.dataSource = self
        return view
    }()

    let controllers: [UIViewController] = [UIViewController()]

    override func viewDidLoad() {
        super.viewDidLoad()

        view = tableView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = controllers[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controllers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = String(describing: type(of: controllers[indexPath.row]))
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
