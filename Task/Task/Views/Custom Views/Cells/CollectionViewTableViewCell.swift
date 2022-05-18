//
//  CollectionViewTableViewCell.swift
//  Task
//
//  Created by Eslam Ali  on 16/05/2022.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    
    //MARK:- Vars
    
    static let identifier = "CollectionViewTableViewCell"
    
  
    var products : [Product] = []
    
 
    private let titleLabel : UILabel = {
        let label =  UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "Cairo-Bold", size: 16)
       // label.font = .systemFont(ofSize: 16, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    public let collectionView : UICollectionView = {
        // Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140, height: 300)
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.semanticContentAttribute = .forceRightToLeft
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    //MARK:- Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier : String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        contentView.addSubview(collectionView)
        contentView.addSubview(titleLabel)
        
      
    
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.frame = CGRect(x: -10, y: 10, width: bounds.width, height: 20)
        collectionView.frame = CGRect(x: 0, y: titleLabel.frame.height + 5
                                      , width: bounds.width - 10, height: bounds.height  )
        
 
    }
    
  //MARK:- Cell Configuration with Model
    func configure(model : [Product], title : String) {
        self.products = model
        DispatchQueue.main.async { [weak self] in
            self?.titleLabel.text = title
        
            self?.collectionView.reloadData()
        }
    }
    
    
}

//MARK:- Extension for CollectionView Functions 
extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
            guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell else {
                print("can't get category cell")
                return UICollectionViewCell()
            }
        
            cell.configureCell(model: products[indexPath.row] )
        
            return cell
            
        }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 250)
    }
    
   
 
    

}

