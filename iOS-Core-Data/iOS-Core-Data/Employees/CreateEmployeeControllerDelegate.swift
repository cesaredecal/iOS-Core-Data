//
//  CreateEmployeeControllerDelegate.swift
//  iOS-Core-Data
//
//  Created by Cesare de Cal on 08/04/2018.
//  Copyright © 2018 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

import Foundation

protocol CreateEmployeeControllerDelegate: class {
    func didAddEmployee(employee: Employee)
}
