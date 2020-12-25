//
//  MainCocktailsController.swift
//  BoozyByKarl
//
//  Created by Karl H Kuhn on 1/30/17.
//  Copyright © 2017 Karl Kuhn. All rights reserved.
//

import UIKit
import CoreData

class MainCocktailsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let isFirstLaunch = UserDefaults.isFirstLaunch()
    private let categoryCellId = "categoryCellId"
    private let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCocktailDatabase()
        
        collectionView?.backgroundColor = .black
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: categoryCellId)
        collectionView?.register(MainCocktailsControllerHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    //MARK: CollectionView Delegate Methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cocktailCategories.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellId, for: indexPath) as! CategoryCell
        cell.cocktailCategory = cocktailCategories[indexPath.item]
        cell.nameLabel.text = cocktailCategories[indexPath.item].name
        cell.mainCocktailsController = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 180)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! MainCocktailsControllerHeader
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    func showCocktailDetailForCocktail(cocktail: Cocktail) {
        let layout = UICollectionViewFlowLayout()
        let cocktailDetailController = CocktailDetailController(collectionViewLayout: layout)
        cocktailDetailController.currentCocktail = cocktail
        navigationController?.pushViewController(cocktailDetailController, animated: true)
    }
}





