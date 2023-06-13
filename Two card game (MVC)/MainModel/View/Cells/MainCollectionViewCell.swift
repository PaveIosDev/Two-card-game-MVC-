//
//  MainCollectionViewCell.swift
//  Two card game (MVC)
//
//  Created by Павел Яковенко on 13.06.2023.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    static let idMaincollectionViewCell = "idMaincollectionViewCell"
    
    let emojiLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var cellFaceUp = false {
        didSet {
            if self.cellFaceUp {
                backgroundColor = .black
            } else {
                backgroundColor = .white
                emojiLabel.text = ""
            }
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configuge()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configuge() {
        backgroundColor = .white
        layer.cornerRadius = 10
        
        addSubview(emojiLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            emojiLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emojiLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
