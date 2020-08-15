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
        iv.clearsContextBeforeDrawing = true
        iv.autoresizesSubviews = true
        return iv
    }()
    
    lazy var topConstraint: NSLayoutConstraint = {
        return subtitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16)
    }()
    
    var topConstraintValue: CGFloat {
        get { return self.topConstraint.constant }
        set { self.topConstraint.constant = newValue }
    }
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
        insetsLayoutMarginsFromSafeArea = false
        
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
            make.leading.trailing.equalTo(self).inset(16)
        }
    }
    
    func setSubtitleLabelConstraints() {
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            topConstraint
        ])
//        subtitleLabel.snp.makeConstraints { [weak self ](make) in
//            guard let self = self else { return }
//            make.leading.equalTo(self).inset(16)
//            make.top.equalTo(self.snp.top).inset(16)
//        }
    }
    
    func setBlurbLabelConstraints() {
        blurbLabel.snp.makeConstraints { (make) in
            make.leading.bottom.trailing.equalTo(self).inset(16)
        }
    }
    
    func setBackgroundImageConstraints() {
        backgroundImage.snp.makeConstraints { (make) in
            make.centerY.centerX.equalTo(self)
            make.height.width.equalTo(500)
        }
    }
}
