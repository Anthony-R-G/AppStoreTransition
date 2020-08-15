//
//  CardCell.swift
//  AppStoreTransitionProgrammatic
//
//  Created by Anthony Gonzalez on 8/14/20.
//  Copyright © 2020 Antnee. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {
    private lazy var shadowView: ShadowView = {
        let sv = ShadowView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .clear
        return sv
    }()
    
    private lazy var commonView: CommonView = {
        let cv = CommonView()
        cv.layer.cornerRadius = 10
        cv.layer.masksToBounds = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: -- Add Subviews & Constraints
extension CardCell {
    func addSubviews() {
        contentView.addSubview(shadowView)
        shadowView.addSubview(commonView)
    }
    
    func setConstraints() {
        setShadowViewConstraints()
        setCommonViewConstraints()
    }
    
    func setShadowViewConstraints() {
        NSLayoutConstraint.activate([
            shadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            shadowView.topAnchor.constraint(equalTo: contentView.topAnchor),
            shadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setCommonViewConstraints() {
        NSLayoutConstraint.activate([
            commonView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            commonView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            commonView.topAnchor.constraint(equalTo: contentView.topAnchor),
            commonView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

