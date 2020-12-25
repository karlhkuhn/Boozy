//
//  NotesCell.swift
//  BoozyByKarl
//
//  Created by Karl H Kuhn on 3/3/17.
//  Copyright © 2017 Karl Kuhn. All rights reserved.
//

import UIKit

class IngredientsAndNotesCell: BaseCellDetail {
    
	let textView: UITextView = {
		let tv = UITextView()
		tv.text = "TEMP TEXT"
		return tv
	}()
	
	let dividerView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.darkGray
		return view
	}()
	
	override func setupViews() {
		super.setupViews()
		addSubview(textView)
		addSubview(dividerView)
		
		addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: textView)
		addConstraintsWithFormat(format: "V:|-4-[v0]-4-|", views: textView)
		addConstraintsWithFormat(format: "H:|[v0]|", views: dividerView)
		addConstraintsWithFormat(format: "V:[v0(2)]|", views: dividerView)
	}
}
