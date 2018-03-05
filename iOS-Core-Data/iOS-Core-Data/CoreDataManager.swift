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
    
    func createEmployee(name: String) -> Error? {
        let context = persistentContainer.viewContext
        let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context)
        employee.setValue(name, forKey: "name")
        do {
            try context.save()
            return nil
        } catch let saveErr {
            print(saveErr.localizedDescription)
            return saveErr
        }
    }
}
