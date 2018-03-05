//
//  CompaniesController+UITableView.swift
//  iOS-Core-Data
//
//  Created by Cesare de Cal on 3/5/18.
//  Copyright © 2018 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

import UIKit

extension CompaniesController {
    // MARK: - Rows
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? CompanyCell else { return UITableViewCell() }
        let company = companies[indexPath.row]
        cell.company = company
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employeesController = EmployeesController()
        employeesController.company = companies[indexPath.row]
        navigationController?.pushViewController(employeesController, animated: true)
    }
    
    // MARK: - Header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .lightBlue
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    // MARK: - Footer
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "No companies available..."
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return companies.isEmpty ? 150 : 0
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (_, indexPath) in
            let company = self.companies[indexPath.row]
            // remove company from table view
            self.companies.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            // delete company from Core Data
            let context = CoreDataManager.shared.persistentContainer.viewContext
            context.delete(company)
            do {
                try context.save()
            } catch let saveErr {
                print("Failed to delete company:", saveErr.localizedDescription)
            }
        }
        let editAction = UITableViewRowAction(style: .normal, title: "Edit", handler: editHandlerFunction)
        
        deleteAction.backgroundColor = .lightRed
        editAction.backgroundColor = .darkBlue
        
        return [deleteAction, editAction]
    }
    
    private func editHandlerFunction(action: UITableViewRowAction, indexPath: IndexPath) {
        print("editing")
        let editCompanyController = CreateCompanyController()
        editCompanyController.delegate = self
        editCompanyController.company = companies[indexPath.row]
        let navController = CustomNavigationController(rootViewController: editCompanyController)
        present(navController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
}
