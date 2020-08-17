//
//  UIAlertController.swift
//  Demo
//
//  Created by apple on 2019/10/11.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

extension UIAlertController {
    func add(_ title: String?, style:UIAlertAction.Style = .default, handler: ((UIAlertAction) -> Void)?) {
        let alertAction = UIAlertAction(title: title,
                                        style: style,
                                        handler: { action in
                                            handler?(action)
        })
        addAction(alertAction)
    }
}
