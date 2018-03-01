//
//  CreateCompanyController.swift
//  iOS-Core-Data
//
//  Created by Cesare de Cal on 2/24/18.
//  Copyright © 2018 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

import UIKit
import CoreData

class CreateCompanyController: UIViewController {

    var delegate: CreateCompanyControllerDelegate?
    var company: Company? {
        didSet {
            nameTextField.text = company?.name
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // ternary syntax
        navigationItem.title = company == nil ? "Create Company" : "Edit Company"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = .darkBlue
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleSave))
    }
    
    private func setupUI() {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .lightBlue
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.addSubview(nameTextField)
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor)
        nameTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
    }
        
    @objc func handleSave() {
        if company == nil {
            createCompany()
        } else {
            saveCompanyChanges()
        }
    }
    
    private func saveCompanyChanges() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        company?.name = nameTextField.text
        do {
            try context.save()
            dismiss(animated: true, completion: {
                self.delegate?.didEditCompany(company: self.company!)
            })
        } catch let saveErr {
            print(saveErr.localizedDescription)
        }
    }
    
    private func createCompany() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let company = NSEntityDescription.insertNewObject(forEntityName: "Company", into: context)
        company.setValue(nameTextField.text, forKey: "name")
        do {
            try context.save()
            self.dismiss(animated: true, completion: {
                self.delegate?.didAddCompany(company: company as! Company)
            })
        } catch let saveError {
            print(saveError.localizedDescription)
        }
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
}
