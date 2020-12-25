//
//  CocktailCategory+CoreDataProperties.swift
//  BoozyByKarl
//
//  Created by Karl H Kuhn on 2/5/17.
//  Copyright © 2017 Karl Kuhn. All rights reserved.
//

import Foundation
import CoreData


extension CocktailCategory {
	
	@nonobjc public class func fetchRequest() -> NSFetchRequest<CocktailCategory> {
		return NSFetchRequest<CocktailCategory>(entityName: "CocktailCategory");
	}
	
	@NSManaged public var name: String
	@NSManaged public var category_key: Int16
	@NSManaged public var cocktailInCategory: NSSet?
	
}

// MARK: Generated accessors for cocktailInCategory
extension CocktailCategory {
	
	@objc(addCocktailInCategoryObject:)
	@NSManaged public func addToCocktailInCategory(_ value: Cocktail)
	
	@objc(removeCocktailInCategoryObject:)
	@NSManaged public func removeFromCocktailInCategory(_ value: Cocktail)
	
	@objc(addCocktailInCategory:)
	@NSManaged public func addToCocktailInCategory(_ values: NSSet)
	
	@objc(removeCocktailInCategory:)
	@NSManaged public func removeFromCocktailInCategory(_ values: NSSet)
	
}
