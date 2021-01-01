//
//  GlobalReferences.swift
//  BoozyByKarl
//
//  Created by Karl2 on 12/25/20.
//  Copyright © 2020 Karl Kuhn. All rights reserved.
//

import UIKit
import CoreData

let karl = URL(fileURLWithPath: "www.twitter.com")

var cocktailCategories = [CocktailCategory]()
var cocktails = [Cocktail]()
var ingredientDictionary = [String: Ingredient]()


enum IngredientUsageDescription: Double {
    case Handfull = 10
    case Barspoon = 20
    case TopOff = 30
}

enum SpiritNamesEnum: Int {
    case Gin
    case Rum
    case Whiskey
    case Tequila
    case Sherry
    case Brandy
}

enum IngredientCategoryEnum: Int {
    case MainSpirit
    case Liqueurs
    case Amari
    case Vermouth
    case Wine
    case Sherry
    case Port
    case Madeira
    case AromatizedWine
    case CitrusFruit
    case FruitNonCitrus
    case Sweetener
    case Spice
    case Herb
    case Bitters
    case Egg
    case Sodas
    case Other
}
