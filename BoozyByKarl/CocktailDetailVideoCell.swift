//
//  CocktailDetailVideoCell.swift
//  BoozyByKarl
//
//  Created by Karl2 on 12/26/20.
//  Copyright © 2020 Karl Kuhn. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class CocktailDetailVideoCell: BaseCellDetail {

let player: AVPlayer = {
    let pr = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "unusualNegroni2", ofType: "mov")!))
    return pr
}()

override func setupViews() {

    super.setupViews()
    
    let layer = AVPlayerLayer(player: player)
    layer.frame = contentView.bounds
    contentView.layer.addSublayer(layer)
    player.play()
    player.isMuted = true
//        addSubview(cocktailAdditionalImage)
    
//        addConstraintsWithFormat(format: "H:|[v0]|", views: cocktailAdditionalImage)
//        addConstraintsWithFormat(format: "V:|[v0]|", views: cocktailAdditionalImage)
    
    
}
}
