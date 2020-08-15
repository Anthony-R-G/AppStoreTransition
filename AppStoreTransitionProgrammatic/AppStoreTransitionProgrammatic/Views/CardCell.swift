//
//  CardCell.swift
//  AppStoreTransitionProgrammatic
//
//  Created by Anthony Gonzalez on 8/14/20.
//  Copyright © 2020 Antnee. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    weak var commonView: CommonView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonView.layer.cornerRadius = 10
        commonView.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


