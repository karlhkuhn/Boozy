//
//  Cocktail+CoreDataProperties.swift
//  BoozyByKarl
//
//  Created by Karl H Kuhn on 2/5/17.
//  Copyright © 2017 Karl Kuhn. All rights reserved.
//

import Foundation
import CoreData


extension Cocktail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cocktail> {
        return NSFetchRequest<Cocktail>(entityName: "Cocktail");
    }

	@NSManaged public var desc: String?
    @NSManaged public var image: String
    @NSManaged public var movieName: String?
    @NSManaged public var ingredientsCount: Int16
    @NSManaged public var name: String
    @NSManaged public var spirit: Int16
    @NSManaged public var ingredientDict: NSObject?
    @NSManaged public var categoryForCocktail: CocktailCategory?
    @NSManaged public var includesIngredient: NSSet?

}

// MARK: Generated accessors for includesIngredient
extension Cocktail {

    @objc(addIncludesIngredientObject:)
    @NSManaged public func addToIncludesIngredient(_ value: Ingredient)

    @objc(removeIncludesIngredientObject:)
    @NSManaged public func removeFromIncludesIngredient(_ value: Ingredient)

    @objc(addIncludesIngredient:)
    @NSManaged public func addToIncludesIngredient(_ values: NSSet)

    @objc(removeIncludesIngredient:)
    @NSManaged public func removeFromIncludesIngredient(_ values: NSSet)

}
