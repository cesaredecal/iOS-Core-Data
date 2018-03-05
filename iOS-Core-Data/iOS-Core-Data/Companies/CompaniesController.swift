//
//  ViewController.swift
//  iOS-Core-Data
//
//  Created by Cesare de Cal on 2/24/18.
//  Copyright © 2018 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

import UIKit
import CoreData

class CompaniesController: UITableViewController {
    
    var companies = [Company]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCompanies()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(handleReset))
        navigationItem.title = "Companies"
        view.backgroundColor = .white
        setupPlusBUttonInNavBar(selector: #selector(handleAddCompany))
        tableView.backgroundColor = .darkBlue
        tableView.tableFooterView = UIView()
        tableView.separatorColor = .white
        tableView.register(CompanyCell.self, forCellReuseIdentifier: "cellId")
    }
    
    private func fetchCompanies() {
        self.companies = CoreDataManager.shared.fetchCompanies()
        self.tableView.reloadData()
    }
    
    @objc private func handleReset() {
        print("attempting to delete all core data objects")
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: Company.fetchRequest())
        do {
            try context.execute(batchDeleteRequest)
            var indexPathsToRemove = [IndexPath]()
            for (index, _) in companies.enumerated() {
                let indexPath = IndexPath(row: index, section: 0)
                indexPathsToRemove.append(indexPath)
            }
            companies.removeAll()
            tableView.deleteRows(at: indexPathsToRemove, with: .left)
        } catch let delErr {
            print("Failed to delete objects from Core Data:", delErr)
        }
    }
            
    @objc internal func handleAddCompany() {
        print("Adding company...")
        let createCompanyController = CreateCompanyController()
        createCompanyController.delegate = self
        let navController = CustomNavigationController(rootViewController: createCompanyController)
        present(navController, animated: true, completion: nil)
    }    
}
