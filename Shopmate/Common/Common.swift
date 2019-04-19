//
//  Common.swift
//  Shopmate
//
//  Created by Ky Nguyen on 4/10/19.
//  Copyright © 2019 Ky Nguyen. All rights reserved.
//

import UIKit
import SwiftyDrop

struct Common {
    static func makeTextField(placeholder: String, icon: UIImage? = nil) -> UITextField {
        let tf = UIMaker.makeTextField(placeholder: placeholder,
                                       font: UIFont.main(.medium, size: 14),
                                       color: UIColor.black)
        
        tf.setPlaceholderColor(UIColor.c_163_169_175)
        tf.setCorner(radius: 7.5)
        tf.setBorder(width: 1, color: UIColor.c_230_232_234)

        if let icon = icon {
            let leftView = tf.setView(.left, image: icon)
            leftView.imageView?.changeColor(to: UIColor.lightGray)
        } else {
            tf.setView(.left, space: 20)
        }
        return tf
    }

    
}

struct MessageHub {
    static func getMessage(_ message: String?, title: String?,
                            cancelActionName: String? = "OK") -> UIAlertController {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if cancelActionName != nil {
            controller.addAction(UIAlertAction(title: cancelActionName, style: .destructive, handler: nil))
        }
        return controller
    }

    static func presentMessage(_ message: String?, title: String? = nil,
                            cancelActionName: String? = "OK") {
        let controller = getMessage(message, title: title, cancelActionName: cancelActionName)
        UIApplication.topViewController()?.present(controller)
    }

    static func showError(_ message: String) {
        Drop.down(message, state: .error, duration: 3)
    }

    static func showMessage(_ message: String) {
        Drop.down(message, state: .info, duration: 3)
    }

}
