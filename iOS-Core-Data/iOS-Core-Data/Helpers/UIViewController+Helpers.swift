//
//  UIViewController+Helpers.swift
//  iOS-Core-Data
//
//  Created by Cesare de Cal on 3/5/18.
//  Copyright © 2018 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

import UIKit

extension UIViewController {
    func setupPlusBUttonInNavBar(selector: Selector) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: selector)
    }
    
    func setupCancelButton(selector: Selector) {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: selector)
    }
}
