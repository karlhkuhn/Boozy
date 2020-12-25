//
//  NotesCell.swift
//  BoozyByKarl
//
//  Created by Karl H Kuhn on 3/3/17.
//  Copyright © 2017 Karl Kuhn. All rights reserved.
//
// This file is the top 3rd of the Screen - CocktailDetailView.  The segmentedControl effects the second 3rd of the screen "IngredientsCell", and displays the ingredients of the cocktail or notes provided by the user.

import UIKit

class CocktailDetailHeaderCell: BaseCellDetail {
	
	var currentCocktail: Cocktail? {
		didSet {
			if let imageName = currentCocktail?.image {
				imageView.image = UIImage(named: imageName)
			}
			if let nameText = currentCocktail?.name {
				nameLabel.text = nameText
			}
		}
	}
	
	let imageView: UIImageView = {
		let iv = UIImageView()
		iv.contentMode = .scaleAspectFill
		iv.layer.cornerRadius = 16
		iv.layer.masksToBounds = true
		
		return iv
	}()
	
	let segmentedControl: UISegmentedControl = {
		let sc = UISegmentedControl(items: ["Ingredients", "Notes"])
		sc.tintColor = UIColor.gray
		sc.selectedSegmentIndex = 0
		return sc
	}()
	
	let nameLabel: UILabel = {
		let label = UILabel()
		label.text = "TEST"
		label.font = UIFont.systemFont(ofSize: 20)
		return label
	}()
	
	let dividerView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.darkGray
		return view
	}()
	
	override func setupViews() {
		super.setupViews()
		
		addSubview(imageView)
		addSubview(segmentedControl)
		addSubview(nameLabel)
		addSubview(dividerView)
		
		addConstraintsWithFormat(format: "H:|-14-[v0(100)]-8-[v1]|", views: imageView, nameLabel)
		addConstraintsWithFormat(format: "V:|-14-[v0(100)]", views: imageView)
		
		addConstraintsWithFormat(format: "V:|-14-[v0(20)]", views: nameLabel)
		
		addConstraintsWithFormat(format: "H:|-40-[v0]-40-|", views: segmentedControl)
		addConstraintsWithFormat(format: "V:[v0(34)]-8-|", views: segmentedControl)
		
		addConstraintsWithFormat(format: "H:|[v0]|", views: dividerView)
		addConstraintsWithFormat(format: "V:[v0(2)]|", views: dividerView)
		
		segmentedControl.addTarget(nil, action: #selector(CocktailDetailController.newSegmentTouched(_:)), for: .valueChanged)
		
		
		
	}
}
