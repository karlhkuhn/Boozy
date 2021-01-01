//
//  UIViewControllerExtension.swift
//  BoozyByKarl
//
//  Created by Karl2 on 12/31/20.
//  Copyright © 2020 Karl Kuhn. All rights reserved.
//

import Foundation
import UIKit

@nonobjc extension UIViewController {
    func add(_ child: UIViewController, frame: CGRect? = nil) {
        addChild(child)
        if let frame = frame {
            child.view.frame = frame
        }
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
    
}
