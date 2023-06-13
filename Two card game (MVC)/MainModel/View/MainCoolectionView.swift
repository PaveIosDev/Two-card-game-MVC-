//
//  MainCoolectionView.swift
//  Two card game (MVC)
//
//  Created by Павел Яковенко on 13.06.2023.
//

import UIKit

protocol MainCollectionViewProtocol: AnyObject {
    func selectItem(indexPath: IndexPath)
}

class MaincollectionView: UICollectionView {
    
    var count = 0
    
    weak var cellDelegate: MainCollectionViewProtocol?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        configure()
    }
    
    convenience init(count: Int) {
        self.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        self.count = count
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        delegate = self
        dataSource = self
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
        register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.idMaincollectionViewCell)
    }
}

//MARK: - UICollectionViewDataSource

extension MaincollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.idMaincollectionViewCell, for: indexPath) as? MainCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension MaincollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellDelegate?.selectItem(indexPath: indexPath)
    }
}

extension MaincollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 4.4,
               height: collectionView.frame.height / 4.4)
    }
}
