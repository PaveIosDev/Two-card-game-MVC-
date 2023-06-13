//
//  ViewController.swift
//  Two card game (MVC)
//
//  Created by Павел Яковенко on 13.06.2023.
//

import UIKit

class MainViewController: UIViewController {

    private var collectionView = MainCollectionView(count: 20)
    
    private let emojiArray = ["💪", "🏆", "😎", "😈", "💥", "🧡", "👺", "🥰", "😙", "☺️"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }

    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        view.addSubview(collectionView)
        collectionView.cellDelegate = self
    }
}

//MARK: - SelectMainCollectionViewItemProtocol

extension MainViewController: MainCollectionViewProtocol {
    
    func selectItem(indexPath: IndexPath) {
        print(indexPath)
    }
}

//MARK: - setConstraints

extension MainViewController{
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            
        ])
    }
}
