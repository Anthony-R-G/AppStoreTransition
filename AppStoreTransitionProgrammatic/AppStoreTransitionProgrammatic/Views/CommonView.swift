//
//  CommonView.swift
//  AppStoreTransitionProgrammatic
//
//  Created by Anthony Gonzalez on 8/14/20.
//  Copyright © 2020 Antnee. All rights reserved.
//

import UIKit

class CommonView: UIView {
    //MARK: -- UI Element Initialization
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.lineBreakMode = .byTruncatingTail
        
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.4823529412, green: 0.4823529412, blue: 0.4823529412, alpha: 1)
        return label
    }()
    
    private lazy var blurbLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var backgroundImage: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "wwdc")
        iv.contentMode = .scaleAspectFill
    
        return iv
    }()
    
    //MARK: -- Methods
    
    func configureView() {
        titleLabel.text = "Join the Developers of WWDC"
        subtitleLabel.text = "NOW TRENDING"
        blurbLabel.text = "The event brings together creators and dreamers of all ages"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraints()
        backgroundColor = .purple
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: -- Add Subviews & Constraints

fileprivate extension CommonView {
    func addSubviews() {
        let UIElements = [backgroundImage, titleLabel, subtitleLabel, blurbLabel]
        UIElements.forEach { addSubview($0) }
        UIElements.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    func setConstraints() {
        setTitleLabelConstraints()
        setSubtitleLabelConstraints()
        setBlurbLabelConstraints()
    }
    
    func setTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    func setSubtitleLabelConstraints() {
        NSLayoutConstraint.activate([
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            subtitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        ])
    }
    
    func setBlurbLabelConstraints() {
        NSLayoutConstraint.activate([
            blurbLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            blurbLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            blurbLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16)
        ])
    }
    
    func setBackgroundImageConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            backgroundImage.heightAnchor.constraint(equalToConstant: 500),
            backgroundImage.widthAnchor.constraint(equalToConstant: 500)
        
        ])
    }
}
