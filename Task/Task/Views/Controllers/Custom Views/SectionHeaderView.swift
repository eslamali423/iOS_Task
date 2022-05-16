//
//  SectionHeaderView.swift
//  Task
//
//  Created by Eslam Ali  on 16/05/2022.
//

import UIKit

class SectionHeaderView: UIView {

   
    //MARK:- Vars
    
    private let heroImageView : UIImageView = {
       let imageview = UIImageView()
       
        imageview.contentMode =  .scaleToFill
        imageview.image = UIImage(named: "logo")
        imageview.clipsToBounds = true
        return imageview
    }()
    
    private let collectionView : UICollectionView = {
        // Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140, height: 200)
    
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addSubview(collectionView)
        

        applyConstrains()
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func applyConstrains() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10),
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
        
        ])
    }
    
    

}
