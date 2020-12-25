//
//  CocktailDetailController.swift
//  BoozyByKarl
//
//  Created by Karl H Kuhn on 2/6/17.
//  Copyright © 2017 Karl Kuhn. All rights reserved.
//
// This Controller displays all 3 compoents of the Cocktail Detail:
// Header: Has Cocktail Image and Title, and SegmentedController that changes the IngredientsAndNotesCell
// IngredientsAndNotes: Displays either Ingredients or Notes based on Header Cell - SegmentedControl Selection.
// 

import UIKit

class CocktailDetailController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var currentCocktail: Cocktail? {
        didSet {
        }
    }
    var selectedSegment = 0
    
    private let headerId = "headerId"
    private let ingredientsId = "ingredientsId"
    private let imagesViewId = "imagesViewId"
    private let descriptionsId = "descriptionsId"
    private let notesId = "notesId"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(CocktailDetailHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(IngredientsAndNotesCell.self, forCellWithReuseIdentifier: ingredientsId)
        collectionView?.register(NotesCell.self, forCellWithReuseIdentifier: notesId)
        collectionView?.register(CocktailImagesCell.self, forCellWithReuseIdentifier: imagesViewId)
        
        
    }
    
    @objc func newSegmentTouched(_ sender: UISegmentedControl!) {
        selectedSegment = sender.selectedSegmentIndex
        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! CocktailDetailHeaderCell
        header.currentCocktail = currentCocktail
        selectedSegment = header.segmentedControl.selectedSegmentIndex
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ingredientsId, for: indexPath) as! IngredientsAndNotesCell

            switch selectedSegment {
            case 1:
                cell.textView.text = "Enter Notes:"
                cell.textView.isEditable = true
                return cell
                
            default:
                cell.textView.attributedText = ingredientsAsAttributedText()
                cell.textView.isEditable = false
                return cell
            }
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imagesViewId, for: indexPath) as! CocktailImagesCell
            return cell
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    
    private func ingredientsAsAttributedText() -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "Ingredients\n\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)])
        let style = NSMutableParagraphStyle()
        let range = NSRange(location: 0, length: attributedText.string.count)
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: range)
        
        //Get Ingredient Items
        if let cocktailIngredientsDict = currentCocktail?.ingredientDict as? [String: Double] {
            let ingredientNames = Array(cocktailIngredientsDict.keys).sorted()
            
            //Format based on type of Ingredient
            for index in 0..<cocktailIngredientsDict.count {
                //If the ingredient is Bitters, add appropriate String
                if ingredientNames[index] == "Angostura Bitters" || ingredientNames[index] == "Orange Bitters"{
                    if cocktailIngredientsDict[ingredientNames[index]] == 1 {
                        attributedText.append(NSAttributedString(string: String(describing: cocktailIngredientsDict[ingredientNames[index]]!) + " dash of ", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]))
                    } else {
                        attributedText.append(NSAttributedString(string: String(describing: cocktailIngredientsDict[ingredientNames[index]]!) + " dashes of ", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]))
                    }
                //Special cases
                } else if cocktailIngredientsDict[ingredientNames[index]] == IngredientUsageDescription.Handfull.rawValue {
                    attributedText.append(NSAttributedString(string: "Handfull of ", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]))
                } else if cocktailIngredientsDict[ingredientNames[index]] == IngredientUsageDescription.Barspoon.rawValue {
                    attributedText.append(NSAttributedString(string: "Barspoon of ", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]))
                } else if cocktailIngredientsDict[ingredientNames[index]] == IngredientUsageDescription.TopOff.rawValue {
                    attributedText.append(NSAttributedString(string: "Top off with ", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]))
                } else {
                    let theString = String(describing: cocktailIngredientsDict[ingredientNames[index]]!)
                    if cocktailIngredientsDict[ingredientNames[index]]! < 1.0 {
                        let newString = String(theString.dropFirst())
                        attributedText.append(NSAttributedString(string: newString + " oz - ", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]))
                    } else {
                        attributedText.append(NSAttributedString(string: theString + " oz - ", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]))
                    }
                }
                attributedText.append(NSAttributedString(string: String(describing: ingredientNames[index]) + "\n\n", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]))
            }
        }
        return attributedText
    }
}






