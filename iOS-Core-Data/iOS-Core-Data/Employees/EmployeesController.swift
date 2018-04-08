//
//  EmployeesController.swift
//  iOS-Core-Data
//
//  Created by Cesare de Cal on 3/5/18.
//  Copyright © 2018 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

import UIKit
import CoreData

class EmployeesController: UITableViewController, CreateEmployeeControllerDelegate {
    
    var company: Company?
    var employees = [Employee]()
    let cellId = "cellId"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = company?.name
    }
    
    private func fetchEmployees() {
        print("Trying to fetch employees...")
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let request = NSFetchRequest<Employee>(entityName: "Employee")
        
        do {
            let employees = try context.fetch(request)
            self.employees = employees
        } catch let error {
            print("Failed to fetch employees:", error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchEmployees()
        setupPlusButtonInNavBar(selector: #selector(handleAdd))
        tableView.backgroundColor = .darkBlue
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    @objc private func handleAdd() {
        let createEmployeeController = CreateEmployeeController()
        createEmployeeController.delegate = self
        let navController = UINavigationController(rootViewController: createEmployeeController)
        present(navController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let employee = employees[indexPath.row]
        cell.textLabel?.text = employee.name
        cell.backgroundColor = .teal
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        cell.textLabel?.textColor = .white
        return cell
    }
    
    func didAddEmployee(employee: Employee) {
        employees.append(employee)
        tableView.reloadData()
    }
}
