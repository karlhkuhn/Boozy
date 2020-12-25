//
//  NotesCell.swift
//  BoozyByKarl
//
//  Created by Karl H Kuhn on 3/3/17.
//  Copyright © 2017 Karl Kuhn. All rights reserved.
//
//
// Base Class for all Boozy collectionView Objects.

import UIKit

class BaseCellDetail: UICollectionViewCell {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupViews()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupViews() {
		
	}
}




extension UIView {
	
	func addConstraintsWithFormat(format: String, views: UIView...) {
		var viewsDict = [String: UIView]()
		for (index, view) in views.enumerated() {
			let key = "v\(index)"
			viewsDict[key] = view
			view.translatesAutoresizingMaskIntoConstraints = false
		}
		
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDict))
		
	}
}
