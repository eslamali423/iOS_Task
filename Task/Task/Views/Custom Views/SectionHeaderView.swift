//
//  SectionHeaderView.swift
//  Task
//
//  Created by Eslam Ali  on 16/05/2022.
//

import UIKit

class SectionHeaderView: UIView{

   
    //MARK:- Vars
    
  
    
    
    private let HeaderImageView : UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.alpha = 0.5
        return image
    }()
    
    private let collectionView : UICollectionView = {
        // Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140, height: 200)
        
        let collectionView = UICollectionView(frame: .zero,  collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
       // collectionView.translatesAutoresizingMaskIntoConstraints = false
 
        return collectionView
    }()
    
 
    
   
    
  //MARK:- Initlizaers
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
       // addSubview(HeaderImageView)
        addSubview(collectionView)
        


        applyConstrains()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        collectionView.frame = bounds
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
extension SectionHeaderView :  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell
        else {
            print("can't get category cell")
            return UICollectionViewCell()
        }
        
        return cell
                
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: 150, height: 150)
      }
    
    
    
    
    
    
    }
    
    
    


