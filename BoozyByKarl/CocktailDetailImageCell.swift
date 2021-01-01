//
//  NotesCell.swift
//  BoozyByKarl
//
//  Created by Karl H Kuhn on 3/3/17.
//  Copyright © 2017 Karl Kuhn. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class CocktailDetailImageCell: BaseCellDetail {
	

	let cocktailAdditionalImage: UIImageView = {
		let ui = UIImageView()
		ui.contentMode = .scaleAspectFill
		return ui
	}()
    

	override func setupViews() {

		super.setupViews()
        
        
		addSubview(cocktailAdditionalImage)
		
		addConstraintsWithFormat(format: "H:|[v0]|", views: cocktailAdditionalImage)
		addConstraintsWithFormat(format: "V:|[v0]|", views: cocktailAdditionalImage)
		
		
	}
}
