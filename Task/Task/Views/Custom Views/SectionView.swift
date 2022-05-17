//
//  SectionView.swift
//  Task
//
//  Created by Eslam Ali  on 16/05/2022.
//

import UIKit
import SDWebImage


class SectionView: UIView{

   
    var productViewModel = ProductsViewModel()
    var image = ""
    
    //MARK:- Vars
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
        label.text = "Category Title"
        label.font = .systemFont(ofSize: 25, weight: .heavy)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    
//    private let collectionView : UICollectionView = {
//        // Layout
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.itemSize = CGSize(width: 140, height: 200)
//
//        let collectionView = UICollectionView(frame: .zero,  collectionViewLayout: layout)
//        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
//       // collectionView.translatesAutoresizingMaskIntoConstraints = false
//
//        return collectionView
//    }()
    
 
    
   
    
  //MARK:- Initlizaers
    init(frame: CGRect, image : String, text: String) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(HeaderImageView)
        HeaderImageView.addSubview(titleLabel)
        titleLabel.text = text
        HeaderImageView.sd_setImage(with: URL(string: image), completed: nil)
      //  addSubview(collectionView)
        
        self.image = image
        
        
        


        applyConstrains()
        
        
//        collectionView.delegate = self
//        collectionView.dataSource = self
    
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        HeaderImageView.frame = bounds
        titleLabel.frame = CGRect(x: 0, y: HeaderImageView.frame.height/2, width: HeaderImageView.frame.width, height: 20)
    }
   
    //MARK:- Constraints
    private func applyConstrains() {
        NSLayoutConstraint.activate([
            
//            HeaderImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            HeaderImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            HeaderImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            HeaderImageView.topAnchor.constraint(equalTo: topAnchor),

//            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: trailingAnchor),
//            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 90),
//            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10),
//
//            collectionView.heightAnchor.constraint(equalToConstant: 150)

        ])
    }
    
  
    
    

}

//MARK:- Extension for CollectionView Functions
extension SectionView :  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell
        else {
            print("can't get category cell")
            return UICollectionViewCell()
        }
        
        return cell
                
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: 150, height: 350)
      }
    
    
    
    
    
    
    }
    
    
    



