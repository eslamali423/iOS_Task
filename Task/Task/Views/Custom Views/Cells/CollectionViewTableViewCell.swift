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
    
    var productViewModel = ProductsViewModel()
    
    
    var products : [Product] = []
    
    //    private let titleLabel : UILabel = {
    //        let label =  UILabel()
    //        label.translatesAutoresizingMaskIntoConstraints = false
    //        label.numberOfLines = 1
    //        label.textColor = .white
    //        label.textAlignment = .center
    //        label.text = "Title"
    //        label.font = .systemFont(ofSize: 25, weight: .bold)
    //        label.adjustsFontSizeToFitWidth = true
    //        return label
    //    }()
    
    public let collectionView : UICollectionView = {
        // Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140, height: 300)
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    //MARK:- Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier : String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // contentView.addSubview(titleLabel)
        contentView.addSubview(collectionView)
        
        getData()
        
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        collectionView.frame = contentView.bounds
    }
    
    private func configureConstraints(){
        NSLayoutConstraint.activate([
            
            //            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            //            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            //            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
//
//            collectionView.topAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8),
//            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
//            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
        ])
    }
    
    func getData () {
        productViewModel.getData { [weak self](isSuccess) in
            if isSuccess {
                self?.collectionView.reloadData()
            }
        }
    }
    
    func configure(model : [Product]) {
        self.products = model
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    
}

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
        return CGSize(width: 150, height: 300)
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let view = UIView()
//        let label = ""
//        
//        
//    }
    
    
    
    
    
    
    
}
