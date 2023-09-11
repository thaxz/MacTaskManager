//
//  NSPredicate.swift
//  TaskManager
//
//  Created by thaxz on 11/09/23.
//

import Foundation

// Creating an option to show everything (or nothing) that is available by default
extension NSPredicate {
    
    static let all = NSPredicate(format: "TRUEPREDICATE")
    static let none = NSPredicate(format: "FALSEPREDICATE")
}
