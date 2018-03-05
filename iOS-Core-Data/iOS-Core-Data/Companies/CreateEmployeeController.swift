//
//  CreateEmployeeController.swift
//  iOS-Core-Data
//
//  Created by Cesare de Cal on 3/5/18.
//  Copyright © 2018 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

import UIKit

class CreateEmployeeController: UIViewController {
    
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
        title = "Create Employee"
        view.backgroundColor = .darkBlue
        setupCancelButton()
        _ = setupBackgroundView(height: 50)
        setupUI()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleSave))
    }
    
    @objc private func handleSave() {
        print("saving employee...")
        if let name = nameTextField.text {
            let error = CoreDataManager.shared.createEmployee(name: name)
            print(error ?? "Error")
        }
        dismiss(animated: true, completion: nil)
    }
    
    private func setupUI() {
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
}
