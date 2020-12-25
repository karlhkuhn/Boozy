//
//  MainCocktailsControllerHeader.swift
//  BoozyByKarl
//
//  Created by Karl2 on 12/25/20.
//  Copyright © 2020 Karl Kuhn. All rights reserved.
//

import UIKit

class MainCocktailsControllerHeader: BaseCellDetail {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "boozyByKarlLogo")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override func setupViews() {
        
        addSubview(imageView)
        
        addConstraintsWithFormat(format: "H:|-165-[v0(100)]|", views: imageView)
        addConstraintsWithFormat(format: "V:|-14-[v0(100)]|", views: imageView)
        
        backgroundColor = .red
    }
}
