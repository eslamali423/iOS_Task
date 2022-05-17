//
//  SectionHeaderView.swift
//  Task
//
//  Created by Eslam Ali  on 16/05/2022.
//

import UIKit

class HeaderView: UIView{

   
    //MARK:- Vars
    
    var categoryViewModel = CategoryViewModel()

    private let HeaderImageView : UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "logo")
        image.clipsToBounds = true
        image.alpha = 0.5
        return image
    }()
    
    private let collectionView : UICollectionView = {
        // Layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero,  collectionViewLayout: layout)
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
 
    
   
    
  //MARK:- Initlizaers
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        self.clipsToBounds = true
        
        addSubview(HeaderImageView)
        addSubview(collectionView)
        
        
        getCategories ()
        collectionView.delegate = self
        collectionView.dataSource = self
    
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //let imageSize: CGFloat = bounds.height
        HeaderImageView.frame = CGRect(
            x: 0,
            y: 0,
            width: bounds.width,
            height: bounds.height
        )
        collectionView.frame = CGRect(x: 0, y: bounds.height/2 - 10, width: bounds.width, height: bounds.height/2)
 
    }
    
    //MARK:- Get Categories
    func getCategories () {
        categoryViewModel.getCat { [weak self](isSuccess) in
            if isSuccess
            {DispatchQueue.main.async { [weak self] in
                
                self?.HeaderImageView.sd_setImage(with: URL(string: (self?.categoryViewModel.imageUrl)! ), completed: nil)
                self?.collectionView.reloadData()
            }
               
            }
        }
    }
    
}

//MARK:- Extension for CollectionView Functions
extension HeaderView :  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryViewModel.catgory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell
        else {
            print("can't get category cell")
            return UICollectionViewCell()
        }
        
        cell.configureCell(model: categoryViewModel.catgory[indexPath.row])
        return cell
                
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: 150, height: 150)
      }
    
    }
    
    


