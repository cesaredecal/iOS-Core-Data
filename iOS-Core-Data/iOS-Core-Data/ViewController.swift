//
//  ViewController.swift
//  iOS-Core-Data
//
//  Created by Cesare de Cal on 2/24/18.
//  Copyright © 2018 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Companies"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddCompany))
        tableView.backgroundColor = .darkBlue
        tableView.tableFooterView = UIView()
        tableView.separatorColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        setupNavigationStyle()
    }
    
    @objc internal func handleAddCompany() {
        print("Adding company...")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = .teal
        cell.textLabel?.text = "THE COMPANY NAME"
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .lightBlue
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    internal func setupNavigationStyle() {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .lightRed
        navigationController?.navigationBar.prefersLargeTitles = true
        let properties = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = properties
        navigationController?.navigationBar.largeTitleTextAttributes = properties
        navigationController?.navigationBar.isTranslucent = false
    }
}

