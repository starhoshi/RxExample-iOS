//
//  NSObjectProtocol+Extension.swift
//  classi_pocketbook_ios
//
//  Created by Kensuke Hoshikawa on 2017/05/25.
//  Copyright © 2017年 classi. All rights reserved.
//

import Foundation

public extension NSObjectProtocol {
    public static var className: String {
        return String(describing: self)
    }
}
