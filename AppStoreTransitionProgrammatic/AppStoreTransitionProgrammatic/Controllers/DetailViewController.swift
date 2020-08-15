//
//  DetailViewController.swift
//  AppStoreTransitionProgrammatic
//
//  Created by Anthony Gonzalez on 8/14/20.
//  Copyright © 2020 Antnee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    private lazy var shadowView: ShadowView = {
        let sv = ShadowView()
        sv.backgroundColor = .clear
        return sv
    }()
    
    private lazy var maskView: UIView = {
        let sv = UIView()
        sv.backgroundColor = .clear
        return sv
    }()
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .clear
        sv.contentInsetAdjustmentBehavior = .never
        return sv
    }()
    
    private lazy var commonView: CommonView = {
        let cv = CommonView()
        cv.clipsToBounds = true
        return cv
    }()
    
    private lazy var bodyView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var closeButton: UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "close"), for: .normal)
        btn.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    //MARK: -- Methods
    
    @objc private func closeButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    func asCard(_ value: Bool) {
        if value {
            // Round the corners
            self.maskView.layer.cornerRadius = 10
        } else {
            // Round the corners
            self.maskView.layer.cornerRadius = 0
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        addSubviews()
        setConstraints()
        view.backgroundColor = .white
    }
}

//MARK: -- Add Subviews & Constraints

extension DetailViewController {
    func addSubviews() {
        view.addSubview(shadowView)
        view.addSubview(maskView)
        maskView.addSubview(scrollView)
        
        scrollView.addSubview(bodyView)
        scrollView.addSubview(commonView)
        view.addSubview(closeButton)
    }
    
    func setConstraints() {
        setShadowViewConstraints()
        setMaskViewConstraints()
        
        setScrollViewConstraints()
        setCommonViewConstraints()
        setBodyViewConstraints()
        
        setCloseButtonConstraints()
    }
    
    func setShadowViewConstraints() {
        shadowView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func setMaskViewConstraints() {
        maskView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func setScrollViewConstraints() {
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func setCommonViewConstraints() {
        commonView.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView)
            make.left.right.equalTo(view)
            make.height.equalTo(500)
        }
    }
    
    func setBodyViewConstraints() {
        bodyView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(commonView.snp.bottom)
            make.bottom.greaterThanOrEqualToSuperview()
        }
    }
    
    func setCloseButtonConstraints() {
        closeButton.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.width.equalTo(44)
        }
    }
}
