//
//  Ingredient+CoreDataProperties.swift
//  BoozyByKarl
//
//  Created by Karl H Kuhn on 2/5/17.
//  Copyright © 2017 Karl Kuhn. All rights reserved.
//

import Foundation
import CoreData


extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient");
    }

    @NSManaged public var name: String
    @NSManaged public var amount: Double
    @NSManaged public var forCocktail: NSSet?

}

// MARK: Generated accessors for forCocktail
extension Ingredient {

    @objc(addForCocktailObject:)
    @NSManaged public func addToForCocktail(_ value: Cocktail)

    @objc(removeForCocktailObject:)
    @NSManaged public func removeFromForCocktail(_ value: Cocktail)

    @objc(addForCocktail:)
    @NSManaged public func addToForCocktail(_ values: NSSet)

    @objc(removeForCocktail:)
    @NSManaged public func removeFromForCocktail(_ values: NSSet)

}
