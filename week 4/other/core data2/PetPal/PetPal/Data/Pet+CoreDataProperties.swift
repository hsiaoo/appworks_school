//
//  Pet+CoreDataProperties.swift
//  PetPal
//
//  Created by H.W. Hsiao on 2020/10/1.
//  Copyright © 2020 Razeware. All rights reserved.
//
//

import Foundation
import CoreData


extension Pet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pet> {
        return NSFetchRequest<Pet>(entityName: "Pet")
    }

    @NSManaged public var name: String
    @NSManaged public var kind: String
    @NSManaged public var picture: Data?
    @NSManaged public var dob: Date?
    @NSManaged public var owner: Friend

}
