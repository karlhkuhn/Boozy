//
//  DataFileInitializer.swift
//  BoozyByKarl
//
//  Created by Karl H Kuhn on 2/6/17.
//  Copyright © 2017 Karl Kuhn. All rights reserved.
//

import UIKit
import CoreData

extension MainCocktailsViewController {

	
	func setupCocktailDatabase() {
		
		if isFirstLaunch {
			setupCategoryItems()
			setupIngredientItems()
			setupCocktailItems()
		} else {
			fetchCategories()
		}
		sortArrays()
	}
	
	func sortArrays() {
		
	}
	
	func setupCategoryItems() {
		cocktailCategories.append(insertCocktailCategoryIntoContext(categroyName: "Gin", categoryKeyNumber: 1))
		cocktailCategories.append(insertCocktailCategoryIntoContext(categroyName: "Rum", categoryKeyNumber: 2))
		cocktailCategories.append(insertCocktailCategoryIntoContext(categroyName: "Whiskey", categoryKeyNumber: 3))
		cocktailCategories.append(insertCocktailCategoryIntoContext(categroyName: "Tequila", categoryKeyNumber: 4))
	}
	
	func setupCocktailItems() {
		insertCocktailIntoContext(cocktailName: "Last Word", ingredientsCount: 4, imageName: "lastWordPict", spiritName: .Gin, cocktailIngredients: ["Gin": 0.75, "Lime Juice": 0.75, "Green Chartreuse": 0.75, "Maraschino Liqueur": 0.75], theDescription: "A spirt forward cocktail with a wonderful sweet herbaceousness coming from the Chartreuse and Maraschino")
			
		
		insertCocktailIntoContext(cocktailName: "French 75", ingredientsCount: 4, imageName: "french75Pict", spiritName: .Gin, cocktailIngredients: ["Gin": 1, "Lemon Juice": 0.5, "Simple Syrup": 0.5, "Brut Sparkling Wine": 30], theDescription: "Like bubbles?  Like booze?  You're in luck!  Sip this during celebrations, or on a nice spring day")
		
		
		insertCocktailIntoContext(cocktailName: "Clover Club", ingredientsCount: 5, imageName: "cloverClubPict", spiritName: .Gin, cocktailIngredients: ["Gin":2, "Lemon Juice":0.75, "Simple Syrup":0.75, "Egg White":1, "Raspberry":2], theDescription: "A classic cocktail that's refreshing, creamy, and fruity all at the same time!")
		
		insertCocktailIntoContext(cocktailName: "Corpse Reviver #2", ingredientsCount: 4, imageName: "corpseReviver2Pict", spiritName: .Gin, cocktailIngredients: ["Gin": 0.75, "Lemon Juice": 0.75, "Lillet Blanc": 0.75, "Cointreau": 0.75], theDescription: "This is a delicions cocktail")
		
		insertCocktailIntoContext(cocktailName: "Bijou", ingredientsCount: 4, imageName: "bijouPict", spiritName: .Gin, cocktailIngredients: ["Gin": 1, "Sweet Vermouth": 1, "Green Chartreuse": 1, "Orange Bitters": 1], theDescription: "This is a delicions cocktail")
		
		insertCocktailIntoContext(cocktailName: "Aviation", ingredientsCount: 4, imageName: "aviationPict", spiritName: .Gin, cocktailIngredients: ["Gin": 1.5, "Lemon Juice": 0.75, "Maraschino Liqueur": 0.75, "Creme de Violet": 0.375], theDescription: "This is a delicions cocktail")
		
		
		insertCocktailIntoContext(cocktailName: "Missionary's Downfall", ingredientsCount: 6, imageName: "missionarysDownfallPict", spiritName: .Rum, cocktailIngredients: ["Rum": 2, "Mint Leaves": 10, "Pineapple Juice": 2, "Lime Juice": 0.75, "Honey": 0.5, "Peach Brandy": 0.5], theDescription: "This is a delicions cocktail")
		
        insertCocktailIntoContext(cocktailName: "El Presidente", ingredientsCount: 4, imageName: "elPresidentePict", spiritName: .Rum, cocktailIngredients: ["White Rum": 2, "Dry Vermouth": 0.5, "Curacao": 0.5, "Grenadine": IngredientUsageDescription.Barspoon.rawValue], theDescription: "This is a delicions cocktail")
		
		insertCocktailIntoContext(cocktailName: "Daiquiri", ingredientsCount: 3, imageName: "daiquiriPict", spiritName: .Rum, cocktailIngredients: ["White Rum": 2, "Lime Juice": 1, "Simple Syrup": 0.75], theDescription: "This is a delicions cocktail")
		
		insertCocktailIntoContext(cocktailName: "Knickerbocker", ingredientsCount: 5, imageName: "knickerbockerPict", spiritName: .Rum, cocktailIngredients: ["Aged Rum": 2, "Lemon Juice": 0.75, "Simple Syrup": 0.375, "Dry Curacao": 0.375, "Raspberry": 2], theDescription: "This is a delicions cocktail")
		
		insertCocktailIntoContext(cocktailName: "Mary Pickford", ingredientsCount: 5, imageName: "marypickfordPict", spiritName: .Rum, cocktailIngredients: ["White Rum": 5, "Pineapple Juice": 1, "Lime Juice": 0.5, "Maraschino Liqueur": 0.25, "Grenadine": 0.25], theDescription: "This is a delicions cocktail")
		
		insertCocktailIntoContext(cocktailName: "Mojito", ingredientsCount: 5, imageName: "mojitoPict", spiritName: .Rum, cocktailIngredients: ["White Rum": 1.5, "Lime Juice": 0.5, "Mint Leaves": 10, "Simple Syrup": 0.5, "Club Soda": 30], theDescription: "This is a delicions cocktail")
		
		
		insertCocktailIntoContext(cocktailName: "Bobby Burns", ingredientsCount: 4, imageName: "bobbyBurnsPict", spiritName: .Whiskey, cocktailIngredients: ["Scotch": 2, "Sweet Vermouth": 0.75, "Benedictine": 0.25, "Angostura Bitters": 3], theDescription: "This is a delicions cocktail")
		
		insertCocktailIntoContext(cocktailName: "Rusty Nail", ingredientsCount: 2, imageName: "rustyNailPict", spiritName: .Whiskey, cocktailIngredients: ["Scotch": 2, "Drambuie": 1], theDescription: "This is a delicions cocktail")
		
		insertCocktailIntoContext(cocktailName: "Old Pal", ingredientsCount: 3, imageName: "oldPalPict", spiritName: .Whiskey, cocktailIngredients: ["Rye Whiskey": 1.5, "Dry Vermouth": 0.75, "Campari": 0.75], theDescription: "This is a delicions cocktail")
		
		insertCocktailIntoContext(cocktailName: "Mint Julep", ingredientsCount: 5, imageName: "mintJulepPict", spiritName: .Whiskey, cocktailIngredients: ["Burbon": 2.5, "Sugar Cube": 1, "Mint Syrup": 0.25, "Mint Leaves": 10], theDescription: "This is a delicions cocktail")
		
		insertCocktailIntoContext(cocktailName: "Manhattan", ingredientsCount: 3, imageName: "manhattanPict", spiritName: .Whiskey, cocktailIngredients: ["Rye Whiskey": 2, "Sweet Vermouth": 1, "Angostura Bitters": 3], theDescription: "This is a delicions cocktail")
		
		insertCocktailIntoContext(cocktailName: "Blood & Sand", ingredientsCount: 4, imageName: "bloodAndSandPict", spiritName: .Whiskey, cocktailIngredients: ["Scotch": 0.75, "Sweet Vermouth": 0.75, "Cerry Heering": 0.75, "Orange Juice": 0.75], theDescription: "This is a delicions cocktail")
		
		insertCocktailIntoContext(cocktailName: "Paloma", ingredientsCount: 5, imageName: "palomaPict", spiritName: .Tequila, cocktailIngredients: ["Tequila Blanco": 2, "Lime Juice": 0.5, "Grapefruit Juice": 2, "Agave Syrup": 0.5], theDescription: "This is a delicions cocktail")
		
		insertCocktailIntoContext(cocktailName: "Mezcal Negroni", ingredientsCount: 4, imageName: "mezcalNegroniPict", spiritName: .Tequila, cocktailIngredients: ["Mezcal": 1, "Sweet Vermouth": 1, "Aperol": 0.75, "Cynar": 0.25], theDescription: "This is a delicions cocktail")
		
		insertCocktailIntoContext(cocktailName: "Margarita", ingredientsCount: 4, imageName: "margaritaPict", spiritName: .Tequila, cocktailIngredients: ["Tequila": 2, "Cointreau": 0.75, "Lime Juice": 0.75, "Simple Syrup": 0.75], theDescription: "This is a delicions cocktail")
		
		insertCocktailIntoContext(cocktailName: "Matador", ingredientsCount: 3, imageName: "matadorPict", spiritName: .Tequila, cocktailIngredients: ["Tequila": 1.5, "Pineapple Juice": 3, "Lime Juice": 0.5], theDescription: "This is a delicions cocktail")
		
		insertCocktailIntoContext(cocktailName: "TequilaSunrise", ingredientsCount: 3, imageName: "tequilaSunrisePict", spiritName: .Tequila, cocktailIngredients: ["Tequila": 1.5, "Orange Juice": 3, "Grenadine": 0.5], theDescription: "This is a delicions cocktail")
		
		insertCocktailIntoContext(cocktailName: "El Diablo", ingredientsCount: 4, imageName: "elDiabloPict", spiritName: .Tequila, cocktailIngredients: ["Tequila": 1.5, "Creme de Cassis": 0.5, "Lime Juice": 0.5, "Ginger Beer": 30], theDescription: "This is a delicions cocktail")
		
	}
	
	func setupIngredientItems() {
//		insertIngredientIntoContext(name: "White Rum", category: .MainSpirit)
//		insertIngredientIntoContext(name: "Aged Rum", category: .MainSpirit)
//		insertIngredientIntoContext(name: "Rum", category: .MainSpirit)
//		insertIngredientIntoContext(name: "Gin", category: .MainSpirit)
//		insertIngredientIntoContext(name: "Scotch", category: .MainSpirit)
//		insertIngredientIntoContext(name: "Rye Whiskey", category: .MainSpirit)
//		insertIngredientIntoContext(name: "Burbon", category: .MainSpirit)
//		insertIngredientIntoContext(name: "Tequila", category: .MainSpirit)
//		insertIngredientIntoContext(name: "Tequila Blanco", category: .MainSpirit)
//		insertIngredientIntoContext(name: "Mezcal", category: .MainSpirit)
//		
//		
//		insertIngredientIntoContext(name: "Lemon Juice", category: .CitrusFruit)
//		insertIngredientIntoContext(name: "Lime Juice", category: .CitrusFruit)
//		insertIngredientIntoContext(name: "Grapefruit Juice", category: .CitrusFruit)
//		insertIngredientIntoContext(name: "Orange Juice", category: .CitrusFruit)
//		
//		insertIngredientIntoContext(name: "Raspberry", category: .FruitNonCitrus)
//		insertIngredientIntoContext(name: "Pineapple Juice", category: .FruitNonCitrus)
//		
//		insertIngredientIntoContext(name: "Mint Leaves", category: .Herb)
//		
//		insertIngredientIntoContext(name: "Sweet Vermouth", category: .Vermouth)
//		insertIngredientIntoContext(name: "Dry Vermouth", category: .Vermouth)
//		
//		insertIngredientIntoContext(name: "Lillet Blanc", category: .AromatizedWine)
//		
//		insertIngredientIntoContext(name: "Green Chartreuse", category: .Liqueurs)
//		insertIngredientIntoContext(name: "Creme de Violet", category: .Liqueurs)
//		insertIngredientIntoContext(name: "Maraschino Liqueur", category: .Liqueurs)
//		insertIngredientIntoContext(name: "Curacao", category: .Liqueurs)
//		insertIngredientIntoContext(name: "Dry Curacao", category: .Liqueurs)
//		insertIngredientIntoContext(name: "Cointreau", category: .Liqueurs)
//		insertIngredientIntoContext(name: "Peach Brandy", category: .Liqueurs)
//		insertIngredientIntoContext(name: "Cerry Heering", category: .Liqueurs)
//		insertIngredientIntoContext(name: "Aperol", category: .Liqueurs)
//		insertIngredientIntoContext(name: "Campari", category: .Liqueurs)
//		insertIngredientIntoContext(name: "Cynar", category: .Liqueurs)
//		insertIngredientIntoContext(name: "Creme de Cassis", category: .Liqueurs)
//		insertIngredientIntoContext(name: "Benedictine", category: .Liqueurs)
//		insertIngredientIntoContext(name: "Drambuie", category: .Liqueurs)
//		
//		insertIngredientIntoContext(name: "Orange Bitters", category: .Bitters)
//		insertIngredientIntoContext(name: "Angostura Bitters", category: .Bitters)
//		insertIngredientIntoContext(name: "Peychaud's Bitters", category: .Bitters)
//		
//		insertIngredientIntoContext(name: "Simple Syrup", category: .Sweetener)
//		insertIngredientIntoContext(name: "Honey", category: .Sweetener)
//		insertIngredientIntoContext(name: "Agave Syrup", category: .Sweetener)
//		insertIngredientIntoContext(name: "Grenadine", category: .Sweetener)
//		insertIngredientIntoContext(name: "Sugar Cube", category: .Sweetener)
//		
//		insertIngredientIntoContext(name: "Egg White", category: .Egg)
//		insertIngredientIntoContext(name: "Brut Sparkling Wine", category: .Wine)
//		insertIngredientIntoContext(name: "Club Soda", category: .Sodas)
//		insertIngredientIntoContext(name: "Tonic Water", category: .Sodas)
//		insertIngredientIntoContext(name: "Ginger Beer", category: .Sodas)
	}
	
	func insertIngredientIntoContext(name: String, amount: Double) {
		let entity = NSEntityDescription.entity(forEntityName: "Ingredient", in: context)
		let newIngredient: Ingredient
		newIngredient = Ingredient(entity: entity!, insertInto: context)
		newIngredient.name = name
		
		saveContext()
		ingredientDictionary[name] = newIngredient
	}
    
    /// Creates a Cocktail Instance and saves into CoreData
    /// - Parameters:
    ///   - cocktailName: Cocktail Name
    ///   - ingredientsCount: How many ingredients are in the cocktail
    ///   - imageName: The filename for cocktail image
    ///   - spiritName: The main spirit in the cocktail - From an enum of spirits
    ///   - cocktailIngredients: A  Dictionary of ingrident names and quanitiy.
    ///   - theDescription: A quick description of the cocktail
	func insertCocktailIntoContext(cocktailName: String, ingredientsCount: Int, imageName: String, spiritName: SpiritNamesEnum, cocktailIngredients: [String: Double], theDescription: String) {
		
		
		let entity = NSEntityDescription.entity(forEntityName: "Cocktail", in: context)
		var newCocktail: Cocktail
		newCocktail = Cocktail(entity: entity!, insertInto: context)
		
		newCocktail.name = cocktailName
		newCocktail.ingredientsCount = Int16(ingredientsCount)
		newCocktail.image = imageName
		newCocktail.desc = theDescription
		newCocktail.ingredientDict = cocktailIngredients as NSObject
        newCocktail.movieName = "unusalNegroni"
		
//		let cocktailIngredientKeys = Array(cocktailIngredients.keys)
//		print(cocktailIngredientKeys[0])
//		for item in 0..<cocktailIngredients.count {
//			let ingredientFromCategory = ingredientDictionary[cocktailIngredientKeys[item]]
//			ingredientFromCategory?.amount = cocktailIngredients[cocktailIngredientKeys[item]]!
//			newCocktail.addToIncludesIngredient(ingredientFromCategory!)
//		}
		newCocktail.categoryForCocktail = cocktailCategories[spiritName.rawValue]
		saveContext()
		cocktails.append(newCocktail)
		
	}
    
    
	
	func insertCocktailCategoryIntoContext(categroyName: String, categoryKeyNumber: Int) -> CocktailCategory {
		let entity = NSEntityDescription.entity(forEntityName: "CocktailCategory", in: context)
		var newCocktailCategory: CocktailCategory
		newCocktailCategory = CocktailCategory(entity: entity!, insertInto: context)
		newCocktailCategory.name = categroyName
		newCocktailCategory.category_key = Int16(categoryKeyNumber)
		
		saveContext()
		return newCocktailCategory
	}
	
	func fetchCocktails() {
		
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cocktail")
		
		do {
			if let results = try context.fetch(fetchRequest) as? [Cocktail] {
				cocktails = results
			}
		} catch {
			fatalError("There was an error fetching the inital Tasted Wines")
		}
		
	}

	func fetchCategories() {
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CocktailCategory")
		
		do {
			if let results = try context.fetch(fetchRequest) as? [CocktailCategory] {
				cocktailCategories = results
			}
		} catch {
			fatalError("There was an error fetching the inital Tasted Wines")
		}
	}

	func fetchIngredients() {
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Ingredient")
		
		do {
			if let results = try context.fetch(fetchRequest) as? [Ingredient] {
				for item in 0...results.count {
					ingredientDictionary[results[item].name] = results[item]
				}
			}
		} catch {
			fatalError("There was an error fetching the inital Tasted Wines")
		}
	}
	
	func saveContext () {
		
		if context.hasChanges {
			do {
				try context.save()
			} catch {
				// Replace this implementation with code to handle the error appropriately.
				// fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
				let nserror = error as NSError
				fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
			}
		}
	}
}
