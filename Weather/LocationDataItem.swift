//
//  LocalityItem.swift
//  Weather
//
//  Created by Ondřej Štoček on 31.03.15.
//  Copyright (c) 2015 Ondrej Stocek. All rights reserved.
//

import Foundation
import CoreData

class LocationDataItem: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var country: String
    @NSManaged var isoCountryCode: String
    @NSManaged var weatherApiId: UInt
}
