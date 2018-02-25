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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        title = "Create Company"
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
        print("Trying to save company...")
        guard let name = self.nameTextField.text else { return }

        dismiss(animated: true) {
            let persistentContainer = NSPersistentContainer(name: "CoreDataModel")
            persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error {
                    print(error.localizedDescription)
                }
            })
            let context = persistentContainer.viewContext
            let company = NSEntityDescription.insertNewObject(forEntityName: "Company", into: context)
            company.setValue(name, forKey: "name")
            
            // perform the save
            do {
                try context.save()
            } catch let saveError {
                print(saveError.localizedDescription)
            }
            
            /*
            let company = Company(name: name, founded: Date())
            self.delegate?.didAddCompany(company: company)
             */
        }
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
}
