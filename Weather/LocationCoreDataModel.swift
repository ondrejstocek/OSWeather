//
//  LocalityCoreDataModel.swift
//  Weather
//
//  Created by Ondřej Štoček on 31.03.15.
//  Copyright (c) 2015 Ondrej Stocek. All rights reserved.
//

import UIKit
import CoreData

class LocationCoreDataModel: NSObject {
    
    let managedObjectContext: NSManagedObjectContext
    let itemName = "LocationDataItem"
    var error: NSError? = nil
    
    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
        super.init()
    }
    
    func saveContext() -> Bool {
        if !self.managedObjectContext.hasChanges {
            return true
        }
        if self.managedObjectContext.save(&self.error) {
            return true
        }
        return false
    }
    
    var _items: [LocationDataItem]?
    
    var items: [LocationDataItem]? {
        if _items == nil {
            let fetchRequest = NSFetchRequest(entityName: itemName)
            _items = self.managedObjectContext.executeFetchRequest(fetchRequest, error: &self.error) as? [LocationDataItem]
        }
        return _items
    }
    
    func newItemWithName(name: String, country: String, countryCode: String) {
        let newItem = NSEntityDescription.insertNewObjectForEntityForName(itemName, inManagedObjectContext: self.managedObjectContext) as! LocationDataItem
        newItem.name = name
        newItem.country = country
        newItem.isoCountryCode = countryCode
        self.saveContext()
        _items = nil
    }
    
    func deleteItem(item: LocationDataItem) {
        self.managedObjectContext.deleteObject(item)
        self.saveContext()
        _items = nil
    }
}
