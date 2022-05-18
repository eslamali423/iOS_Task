//
//  SectionView.swift
//  Task
//
//  Created by Eslam Ali  on 16/05/2022.
//

import UIKit
import SDWebImage


class SectionView: UIView{

    //MARK:- Vars
    
    var products : [Product] = []
    var image = ""
    
    private let HeaderImageView : UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "logo")
        image.clipsToBounds = true
       
        return image
    }()
    
    
    private let titleLabel : UILabel = {
        let label =  UILabel()
        label.numberOfLines = 1
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Cairo-Bold", size: 25)
//        label.font = .systemFont(ofSize: 25, weight: .heavy)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    
    private let collectionView : UICollectionView = {
        // Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140, height: 300)

        let collectionView = UICollectionView(frame: .zero,  collectionViewLayout: layout)
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.semanticContentAttribute = .forceRightToLeft
       // collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()
    
 
  //MARK:- Initlizaers
    init(frame: CGRect, image : String, title: String, products : [Product]) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(HeaderImageView)
        addSubview(titleLabel)
        titleLabel.text = title
        
        addSubview(collectionView)
       
        self.titleLabel.text = title
        self.image = image
        self.products = products
        HeaderImageView.sd_setImage(with: URL(string: image), completed: nil)
        

        collectionView.delegate = self
        collectionView.dataSource = self
    
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    

   //MARK:- Layout / Constraints 
    override func layoutSubviews() {
        super.layoutSubviews()
        //let imageSize: CGFloat = bounds.height
        HeaderImageView.frame = CGRect(
            x: 0,
            y: 0,
            width: bounds.width,
            height: bounds.height / 2
        )
        titleLabel.frame = CGRect(
            x: 0,
            y: 40,
            width: bounds.width,
            height: 50
        )
        
        collectionView.frame = CGRect(x: 0, y: 70
                                      , width: bounds.width - 10, height: bounds.height  )
 
    }
    

    
  
    
    

}

//MARK:- Extension for CollectionView Functions
extension SectionView :  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.products.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell
        else {
            print("can't get category cell")
            return UICollectionViewCell()
        }
        cell.configureCell(model: self.products[indexPath.row])
        return cell
                
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: 150, height: 250)
      }
    
    
    
    
    
    
    }
    
    
    



