//
//  CoreDataManager.swift
//  iOS-Core-Data
//
//  Created by Cesare de Cal on 2/26/18.
//  Copyright © 2018 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

import CoreData

struct CoreDataManager {
    static let shared = CoreDataManager()

    let persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "CoreDataModel")
        persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                print(error.localizedDescription)
            }
        })
        return persistentContainer
    }()

    func fetchCompanies() -> [Company] {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Company>(entityName: "Company")
        do {
            let companies = try context.fetch(fetchRequest)
            return companies
        } catch let fetchErr {
            print("Failed to fetch companies", fetchErr)
            return []
        }
    }
    
    func createEmployee(name: String) -> (Employee?, Error?) {
        let context = persistentContainer.viewContext
        guard let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context) as? Employee else {
            return (nil, nil)
        }
        
        guard let employeeInformation = NSEntityDescription.insertNewObject(forEntityName: "EmployeeInformation", into: context) as? EmployeeInformation else {
            return (nil, nil)
        }
        
        employeeInformation.taxId = "456"
        employee.employeeInformation = employeeInformation
        employee.name = name

        do {
            try context.save()
            return (employee, nil)
        } catch let saveErr {
            print(saveErr.localizedDescription)
            return (nil, saveErr)
        }
    }
}
