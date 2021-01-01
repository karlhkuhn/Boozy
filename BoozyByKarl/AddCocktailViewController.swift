//
//  AddCocktailViewController.swift
//  BoozyByKarl
//
//  Created by Karl2 on 12/31/20.
//  Copyright © 2020 Karl Kuhn. All rights reserved.
//

import UIKit


protocol AddCocktailViewControllerDelegate {
    func didAddCocktail()
}

class AddCocktailViewController: UIViewController {
    
    
    let cocktailNameLabel: UILabel = {
        let label = UILabel()
        label.text = "New Cocktail Name: "
        return label
    }()
    let cocktailName: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Manhattan"
       return textField
    }()
    let categorySegmentControlA = UISegmentedControl()
    let categorySegmentControlB = UISegmentedControl()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
    
    
    func setupViews() {
        
        cocktailNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cocktailName.translatesAutoresizingMaskIntoConstraints = false
        categorySegmentControlA.translatesAutoresizingMaskIntoConstraints = false
        categorySegmentControlB.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cocktailNameLabel)
        view.addSubview(cocktailName)
        view.addSubview(categorySegmentControlA)
        view.addSubview(categorySegmentControlB)

        for cocktailIndex in 0...(cocktailCategories.count / 2) {
            categorySegmentControlA.insertSegment(withTitle: cocktailCategories[cocktailIndex].name, at: cocktailIndex, animated: true)
        }
        for cocktailIndex in (cocktailCategories.count / 2)..<cocktailCategories.count {
            categorySegmentControlB.insertSegment(withTitle: cocktailCategories[cocktailIndex].name, at: cocktailIndex, animated: true)
        }
    }
    
    func setupConstraints() {
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[cocktailNameLabel][cocktailName]-|", options: [], metrics: nil, views: ["cocktailNameLabel":cocktailNameLabel, "cocktailName":cocktailName]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[segControlA]-|", options: [], metrics: nil, views: ["segControlA":categorySegmentControlA]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[segControlB]-|", options: [], metrics: nil, views: ["segControlB":categorySegmentControlB]))

        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-45-[cocktailName]-[segControlA]-[segControlB]", options: [], metrics: nil, views: ["cocktailName":cocktailName, "segControlA":categorySegmentControlA, "segControlB":categorySegmentControlB]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-45-[cocktailNameLabel]", options: [], metrics: nil, views: ["cocktailNameLabel":cocktailNameLabel]))

    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
