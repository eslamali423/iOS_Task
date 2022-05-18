//
//  ProductCollectionViewCell.swift
//  Task
//
//  Created by Eslam Ali  on 16/05/2022.
//

import UIKit
import SDWebImage

class ProductCollectionViewCell: UICollectionViewCell {
 
    //MARK:- Vars
    static let identifier = "ProductCollectionViewCell"
    
    private let productImageView : UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleToFill
      
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let offerLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .white
        label.textAlignment = .center
        label.text = "عرض"
        label.backgroundColor = .black
        label.font = UIFont(name: "Cairo-Bold", size: 12)
      //  label.font = .systemFont(ofSize: 12, weight: .bold)
       
        return label
    }()
   
    
    public let AddToBasketButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("أضف إلى السلة", for: .normal)
        button.backgroundColor =  .clear
        button.layer.borderWidth = 2
        button.layer.borderColor =  UIColor(red: 231/255.0, green: 93/255.0, blue: 36/255.0, alpha: 1.0).cgColor
        button.setTitleColor( UIColor(red: 231/255.0, green: 93/255.0, blue: 36/255.0, alpha: 1.0), for: .normal)
        button.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 12)
//        button.titleLabel?.font = .systemFont(ofSize: 16, weight : .regular)
        return button
    }()
    
    
    private let brandLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .label
        label.textAlignment = .right
        label.font = UIFont(name: "Cairo-Bold", size: 12)
      //  label.font = .systemFont(ofSize: 12, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let oldPriceLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .label
        label.textAlignment = .right
        label.font = UIFont(name: "Cairo-Regular", size: 12)
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        
        
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "Text")
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        
        label.attributedText = attributeString
        
        
        return label
    }()
    
    private let discountLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = UIColor(red: 231/255.0, green: 93/255.0, blue: 36/255.0, alpha: 1.0)
        label.textAlignment = .right
        label.font = UIFont(name: "Cairo-Regular", size: 12)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let newPriceLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .label
        label.textAlignment = .right
        label.font = UIFont(name: "Cairo-Bold", size: 14)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let describtionLabel : UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = .label
        label.textAlignment = .right
        label.font = UIFont(name: "Cairo-Regular", size: 12)
        label.adjustsFontSizeToFitWidth = false
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
    
    //MARK:- Layout / Constraints
    private func setupLayouts(){
        contentView.addSubview(productImageView)
        contentView.addSubview(offerLabel)
        
        contentView.addSubview(AddToBasketButton)
        stackView.addArrangedSubview(discountLabel)
        stackView.addArrangedSubview(oldPriceLabel)
        
        contentView.addSubview(stackView)
        contentView.addSubview(newPriceLabel)
        contentView.addSubview(describtionLabel)
        
        contentView.layer.borderWidth = 0.5
        contentView.layer.cornerRadius = 5
        contentView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
    }
    
    private func configureConstraints (){
        NSLayoutConstraint.activate([
        
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 8),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -8),
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8),
            productImageView.heightAnchor.constraint(equalToConstant: 110),
            
            offerLabel.leadingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -145),
           offerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
           offerLabel.heightAnchor.constraint(equalToConstant: 20),
            offerLabel.widthAnchor.constraint(equalToConstant: 35),
            
            AddToBasketButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            AddToBasketButton.topAnchor.constraint(equalTo: productImageView.bottomAnchor),
            AddToBasketButton.heightAnchor.constraint(equalToConstant: 35),
            AddToBasketButton.widthAnchor.constraint(equalToConstant: 120),
            
          
           stackView.topAnchor.constraint(equalTo: AddToBasketButton.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -8),
            
            newPriceLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            newPriceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 8),
            newPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -8),
            
             describtionLabel.topAnchor.constraint(equalTo: newPriceLabel.bottomAnchor),
             describtionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 8),
             describtionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -8),
            
        
        
        ])
    }
    
    //MARK:- Configure Cell with Model
    func configureCell(model : Product) {
        let url = URL(string: model.image ?? "")
    
        self.productImageView.sd_setImage(with: url, completed: nil)
        self.brandLabel.text = model.brand
        self.oldPriceLabel.text = "\(model.variants[0].price)"
        self.newPriceLabel.text = "\(model.variants[0].salePrice)"
        self.discountLabel.text = "خصم \(model.variants[0].saleAmount) %"
        self.describtionLabel.text = model.title
    
    }
    
    
}
