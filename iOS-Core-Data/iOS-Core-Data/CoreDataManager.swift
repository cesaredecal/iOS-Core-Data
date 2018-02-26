//
//  CoreDataManager.swift
//  iOS-Core-Data
//
//  Created by Cesare de Cal on 2/26/18.
//  Copyright © 2018 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

import CoreData

struct CoreDataManager {
    static let shared = CoreDataManager() // will live forever as well as its properties
    // it never gets reclaimed by the operating system

    let persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "CoreDataModel")
        persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                print(error.localizedDescription)
            }
        })
        return persistentContainer
    }()
}
