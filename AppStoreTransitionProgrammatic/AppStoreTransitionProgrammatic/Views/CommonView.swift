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
        label.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 0
      
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.4823529412, green: 0.4823529412, blue: 0.4823529412, alpha: 1)
        label.numberOfLines = 0
        
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
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
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
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
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
        setBackgroundImageConstraints()
    }
    
    func setTitleLabelConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    func setSubtitleLabelConstraints() {
        subtitleLabel.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview().inset(16)
        }
    }
    
    func setBlurbLabelConstraints() {
        blurbLabel.snp.makeConstraints { (make) in
            make.leading.bottom.trailing.equalToSuperview().inset(16)
        }
    }
    
    func setBackgroundImageConstraints() {
        backgroundImage.snp.makeConstraints { (make) in
            make.centerY.centerX.equalToSuperview()
            make.height.width.equalTo(500)
        }
    }
}
