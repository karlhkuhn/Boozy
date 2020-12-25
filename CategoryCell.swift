//
//  CategoryCell.swift
//  Cocktails
//
//  Created by Karl H Kuhn on 1/30/17.
//  Copyright © 2017 Karl Kuhn. All rights reserved.
//

import UIKit


class CategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	
	var mainCocktailsController: MainCocktailsViewController?
	var cocktailCategory: CocktailCategory?

	
	let cocktailCellId = "cocktailCellId"
	
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.text = "Gin Cocktails"
		label.font = UIFont.systemFont(ofSize: 16)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let cocktailCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		let uiView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		
		uiView.backgroundColor = UIColor.clear

		return uiView
	}()
	
	let dividerLineView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupViews()
		
		}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupViews() {
		
		addSubview(cocktailCollectionView)
		addSubview(nameLabel)
		addSubview(dividerLineView)
		
		cocktailCollectionView.dataSource = self
		cocktailCollectionView.delegate = self
		
		cocktailCollectionView.translatesAutoresizingMaskIntoConstraints = false
		cocktailCollectionView.register(CocktailCellItem.self, forCellWithReuseIdentifier: cocktailCellId)
		
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": nameLabel]))

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": dividerLineView]))

		
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": cocktailCollectionView]))
		
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel(40)][v0][v1(0.5)]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": cocktailCollectionView, "v1": dividerLineView, "nameLabel": nameLabel]))
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return (cocktailCategory?.cocktailInCategory?.count)!
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: CGFloat(100), height: frame.height - 40)
	}
	
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cocktailCellId, for: indexPath) as! CocktailCellItem
		let cocktailsInCategory = cocktailCategory?.cocktailInCategory?.allObjects as! [Cocktail]
		let sortedCocktailsInCategory = cocktailsInCategory.sorted { $0.name.localizedCaseInsensitiveCompare($1.name) == ComparisonResult.orderedAscending }
		cell.cocktail = sortedCocktailsInCategory[indexPath.item]
//		let currentCocktails = cocktailCategory!.cocktailInCategory?.allObjects as! [Cocktail]
//		cell.cocktail = currentCocktails[indexPath.item]
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let cocktailsInCategory = cocktailCategory?.cocktailInCategory?.allObjects as! [Cocktail]
		let sortedCocktailsInCategory = cocktailsInCategory.sorted { $0.name.localizedCaseInsensitiveCompare($1.name) == ComparisonResult.orderedAscending }

		mainCocktailsController?.showCocktailDetailForCocktail(cocktail: sortedCocktailsInCategory[indexPath.item])
	}
}

class CocktailCellItem: UICollectionViewCell {
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	var cocktail: Cocktail? {
		didSet {
			//set Name Label From Model
			if let name = cocktail?.name {
				nameLabel.text = name
			}
			
//			//set Price Label From Model
//			if let price = app?.price {
//				priceLabel.text = "$\(price)"
//			} else {
//				priceLabel.text = ""
//			}
			
			//set Image from Model
			if let imageName = cocktail?.image {
				imageView.image = UIImage(named: imageName)
			}
		}
	}
	
	func setupViews() {
		backgroundColor = UIColor.clear
		addSubview(imageView)
		addSubview(nameLabel)
		imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.width)
		nameLabel.frame = CGRect(x: 0, y: frame.width + 2, width: frame.width, height: 20)
		
		backgroundColor = .white
		
	}
	
	let imageView: UIImageView = {
		let iv = UIImageView()
		iv.image = UIImage(named: "aviationPict")
		iv.contentMode = .scaleAspectFill
		iv.layer.cornerRadius = 20
		iv.layer.masksToBounds = true
		return iv
	}()
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.text = "Aviation Cocktail"
		label.font = UIFont.systemFont(ofSize: 14)
		return label
	}()
	

}
