//
//  ViewController.swift
//  AppStoreTransitionProgrammatic
//
//  Created by Anthony Gonzalez on 8/14/20.
//  Copyright © 2020 Antnee. All rights reserved.
//

import UIKit

let reuseIdentifier = "cellId"

class ViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 335, height: 410)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 30
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.dataSource = self
        cv.delegate = self
        cv.register(CardCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        return cv
    }()
    
    fileprivate var selectedCell: UICollectionViewCell?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setConstraints()
        navigationController?.navigationBar.isHidden = true
    }
}


//MARK: -- Collection View Data Source
extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CardCell
        return cell
    }
}


//MARK: -- Collection View Delegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCell = collectionView.cellForItem(at: indexPath)
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
}


//MARK: -- Add Subviews & Constraints
extension ViewController {
    func addSubviews() {
        let UIElements = [collectionView]
        UIElements.forEach { view.addSubview($0) }
    }
    
    func setConstraints() {
        setCollectionViewConstraints()
    }
    
    func setCollectionViewConstraints() {
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension ViewController: Animatable {
    var containerView: UIView? {
        return self.collectionView
    }

    var childView: UIView? {
        return self.selectedCell
    }
}
