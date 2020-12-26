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
	
    var name: String = ""
    var type: String = ""
    
	let cocktailAdditionalImage: UIImageView = {
		let ui = UIImageView()
		ui.contentMode = .scaleAspectFill
		return ui
	}()
	
	override func setupViews() {

        
		super.setupViews()
        
        
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "unusualNegroni2", ofType: "mov")!))
        
        let layer = AVPlayerLayer(player: player)
        layer.frame = contentView.bounds
        contentView.layer.addSublayer(layer)
        player.play()
        player.isMuted = true
//		addSubview(cocktailAdditionalImage)
		
//		addConstraintsWithFormat(format: "H:|[v0]|", views: cocktailAdditionalImage)
//		addConstraintsWithFormat(format: "V:|[v0]|", views: cocktailAdditionalImage)
		
		
	}
}
