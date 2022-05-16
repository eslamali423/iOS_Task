//
//  ProductCollectionViewCell.swift
//  Task
//
//  Created by Eslam Ali  on 16/05/2022.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
 
    static let identifier = "ProductCollectionViewCell"

    
    private let productImageView : UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    public let AddToBasketButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("أضف إلى السلة", for: .normal)
        button.backgroundColor =  .clear
        button.layer.borderWidth = 2
        button.layer.borderColor =  UIColor(red: 231/255.0, green: 93/255.0, blue: 36/255.0, alpha: 1.0).cgColor
        button.setTitleColor( UIColor(red: 231/255.0, green: 93/255.0, blue: 36/255.0, alpha: 1.0), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight : .regular)
        return button
    }()
    
    
    private let brandLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .label
        label.textAlignment = .right
        label.text = "Brand"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let oldPriceLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .label
        label.textAlignment = .right
        label.text = "35.5LE"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let discountLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = UIColor(red: 231/255.0, green: 93/255.0, blue: 36/255.0, alpha: 1.0)
        label.textAlignment = .right
        label.text = "خصم ٢٥"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let newPriceLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .label
        label.textAlignment = .right
        label.text = "35.5LE"
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let discriptionLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .label
        label.textAlignment = .right
        label.text = "Product Descripton Product DescriptonProduct DescriptonProduct DescriptonProduct DescriptonProduct DescriptonProduct Descripton"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        label.frame = CGRect(x:0,y:0,width:label.intrinsicContentSize.width,height:label.intrinsicContentSize.height)

        return label
    }()
    
    private let stackView : UIStackView = {
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.fill
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    //MARK:- Initilizers
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        
        setupLayouts()
        configureConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        productImageView.frame = contentView.bounds
//    }
    
    
    private func setupLayouts(){
        contentView.addSubview(productImageView)
        contentView.addSubview(AddToBasketButton)
        stackView.addArrangedSubview(discountLabel)
        stackView.addArrangedSubview(oldPriceLabel)
        
        contentView.addSubview(stackView)
        contentView.addSubview(newPriceLabel)
        contentView.addSubview(discriptionLabel)
    }
    
    private func configureConstraints (){
        NSLayoutConstraint.activate([
        
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 8),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -8),
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8),
            productImageView.heightAnchor.constraint(equalToConstant: 130),
            
            AddToBasketButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            AddToBasketButton.topAnchor.constraint(equalTo: productImageView.bottomAnchor,constant: 2),
            AddToBasketButton.heightAnchor.constraint(equalToConstant: 35),
            AddToBasketButton.widthAnchor.constraint(equalToConstant: 120),
            
          
           stackView.topAnchor.constraint(equalTo: AddToBasketButton.bottomAnchor,constant: 2),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -8),
            
            newPriceLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor,constant: 2),
            newPriceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 8),
            newPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -8),
            
             discriptionLabel.topAnchor.constraint(equalTo: newPriceLabel.bottomAnchor,constant: 2),
             discriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 8),
             discriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -8),
            
        
        
        ])
    }
    
    
}
