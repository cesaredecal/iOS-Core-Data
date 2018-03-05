//
//  CreateEmployeeController.swift
//  iOS-Core-Data
//
//  Created by Cesare de Cal on 3/5/18.
//  Copyright © 2018 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

import UIKit

class CreateEmployeeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create Employee"
        view.backgroundColor = .darkBlue
        setupCancelButton(selector: #selector(handleCancel))
    }
        
    @objc private func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
}
