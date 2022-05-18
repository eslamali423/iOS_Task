//
//  FooterView.swift
//  Task
//
//  Created by Eslam Ali  on 17/05/2022.
//

import UIKit

class FooterView : UIView {
    
    //MARK:- Vars
    
    var brands : [Brand] = []
    
    private let titleLabel : UILabel = {
        let label =  UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.textAlignment = .right
        label.text = "Category Title"
        label.font = UIFont(name: "Cairo-Bold", size: 15)
//        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let collectionView : UICollectionView = {
        // Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140, height: 140)
        
        let collectionView = UICollectionView(frame: .zero,  collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.semanticContentAttribute = .forceRightToLeft
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    //MARK:- Initlizaers
    init(frame: CGRect, brands : [Brand], text: String) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        self.clipsToBounds = true
        self.brands = brands
       addSubview(titleLabel)
        addSubview(collectionView)
        titleLabel.text = text
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(x: -10, y: 0, width: bounds.width, height: 20)
        collectionView.frame = CGRect(x: 0, y: titleLabel.bounds.height + 5 , width: bounds.width, height: bounds.height - titleLabel.bounds.height - 5)
        
    }
    
}

//MARK:- Extension for CollectionView Functions
extension FooterView :  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell
        else {
            print("can't get category cell")
            return UICollectionViewCell()
        }
        
        cell.configureCell(model: brands[indexPath.row])
        cell.contentView.layer.borderWidth = 0
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
}







