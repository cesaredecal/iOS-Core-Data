//
//  EmployeesController.swift
//  iOS-Core-Data
//
//  Created by Cesare de Cal on 3/5/18.
//  Copyright © 2018 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

import UIKit

class EmployeesController: UITableViewController {
    
    var company: Company?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = company?.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlusButtonInNavBar(selector: #selector(handleAdd))
        tableView.backgroundColor = .darkBlue
    }
    
    @objc private func handleAdd() {
        let createEmployeeController = CreateEmployeeController()
        let navController = UINavigationController(rootViewController: createEmployeeController)
        present(navController, animated: true, completion: nil)
    }
}
