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
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .clear
        return sv
    }()
    
    private lazy var maskView: UIView = {
        let sv = UIView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .clear
        return sv
    }()
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .clear
        sv.contentInsetAdjustmentBehavior = .never
        return sv
    }()
    
    private lazy var commonView: CommonView = {
        let cv = CommonView()
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private lazy var bodyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
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
        
        shadowView.addSubview(maskView)
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
        NSLayoutConstraint.activate([
            shadowView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            shadowView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            shadowView.topAnchor.constraint(equalTo: view.topAnchor),
            shadowView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setMaskViewConstraints() {
        NSLayoutConstraint.activate([
            maskView.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
            maskView.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor),
            maskView.topAnchor.constraint(equalTo: shadowView.topAnchor),
            maskView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor)
        ])
    }
    
    func setScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: maskView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: maskView.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: maskView.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: maskView.bottomAnchor)
        ])
    }
    
    func setCommonViewConstraints() {
        NSLayoutConstraint.activate([
            commonView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            commonView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor),
            commonView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            commonView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    
    func setBodyViewConstraints() {
        NSLayoutConstraint.activate([
            bodyView.topAnchor.constraint(equalTo: commonView.bottomAnchor),
            bodyView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            bodyView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            bodyView.bottomAnchor.constraint(greaterThanOrEqualTo: scrollView.bottomAnchor)
        ])
    }
    
    func setCloseButtonConstraints() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: maskView.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: maskView.trailingAnchor, constant: -16),
            closeButton.heightAnchor.constraint(equalToConstant: 44),
            closeButton.widthAnchor.constraint(equalToConstant: 44)
        ])
    }
}
