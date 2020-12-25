//
//  NotesCell.swift
//  BoozyByKarl
//
//  Created by Karl H Kuhn on 3/3/17.
//  Copyright © 2017 Karl Kuhn. All rights reserved.
//

import UIKit

class CocktailImagesCell: BaseCellDetail, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	
	let imagesCellId = "imagesCellId"
	
	let cocktailImagesCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		let uiView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		
		uiView.backgroundColor = UIColor.white
		
		return uiView
	}()
	
	let dividerView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.darkGray
		return view
	}()
	
	override func setupViews() {
		super.setupViews()
		
		addSubview(cocktailImagesCollectionView)
		addSubview(dividerView)
		
		cocktailImagesCollectionView.register(CocktailDetailImageCell.self, forCellWithReuseIdentifier: imagesCellId)
		
		cocktailImagesCollectionView.dataSource = self
		cocktailImagesCollectionView.delegate = self
		
		addConstraintsWithFormat(format: "H:|[v0]|", views: cocktailImagesCollectionView)
		addConstraintsWithFormat(format: "V:|[v0]|", views: cocktailImagesCollectionView)
		
		
		
		addConstraintsWithFormat(format: "H:|[v0]|", views: dividerView)
		addConstraintsWithFormat(format: "V:[v0(2)]|", views: dividerView)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 3
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: frame.width - 40, height: frame.height - 40)
	}
	
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imagesCellId, for: indexPath) as! CocktailDetailImageCell
		if indexPath.item == 0 {
			cell.cocktailAdditionalImage.image = #imageLiteral(resourceName: "supplimentImage1")
		}
		if indexPath.item == 1 {
			cell.cocktailAdditionalImage.image = #imageLiteral(resourceName: "supplimentImage2")
		}
		if indexPath.item == 2 {
			cell.cocktailAdditionalImage.image = #imageLiteral(resourceName: "supplimentImage3")
		}
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		//		let cocktailsInCategory = cocktailCategory?.cocktailInCategory?.allObjects as! [Cocktail]
		//		mainCocktailsController?.showCocktailDetailForCocktail(cocktail: cocktailsInCategory[indexPath.item])
	}
}
