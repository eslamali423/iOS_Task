//
//  CategoryCollectionViewCell.swift
//  Task
//
//  Created by Eslam Ali  on 16/05/2022.
//

import UIKit
import SDWebImage

class CategoryCollectionViewCell: UICollectionViewCell {
    
    //MARK:- Vars
    static let identifier = "CategoryCollectionViewCell"
    
    private let CategoryImageView : UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()
    
    private let titleLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .label
        label.textAlignment = .center
        label.text = "Category Title"
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    
    //MARK:- Initilizers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(CategoryImageView)
        contentView.addSubview(titleLabel)
        ConfigureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func ConfigureConstraints(){
        NSLayoutConstraint.activate([
            CategoryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            CategoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            CategoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            CategoryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),


            
        
            titleLabel.topAnchor.constraint(equalTo: CategoryImageView.bottomAnchor,constant: -8),

            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

   
        ])
    }
    
    
    public func configureCell(model : Block) {
        self.titleLabel.text = model.title
        let url = URL(string: model.blockImage ?? "")
        self.CategoryImageView.sd_setImage(with: url, completed: nil)
        
        
    }
  
  
    
    
    
    
}
