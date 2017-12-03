//
//  Expense+CoreDataClass.swift
//  Expenses
//
//  Created by Matthew McCarthy on 12/2/17.
//  Copyright © 2017 Tech Innovator. All rights reserved.
//
//
import CoreData
import UIKit
@objc(Expense)
public class Expense: NSManagedObject {
    var date: Date?{
        get{
            return rawDate as Date?
        
        }
        set{
            rawDate = newValue as  NSDate?
        }
    }
    convenience init?(name: String?, amount: Double, date: Date?){
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let managedConext = appDelegate?.persistentContainer.viewContext else{
            return nil;
        
        }
        self.init(entity:Expense.entity(),insertInto: managedConext)
            self.name = name
            self.amount = amount
            self.date = date
    }
}
