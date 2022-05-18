//
//  HomeViewController.swift
//  Task
//
//  Created by Eslam Ali  on 16/05/2022.
//

import UIKit
import SDWebImage
import RxSwift
import RxCocoa


class HomeViewController: UIViewController {
    
    
    //MARK:- Vars
    
    var productViewModel = ProductsViewModel()
    var bag = DisposeBag()
    private let logo : UILabel = {
        let label =  UILabel()
        label.textAlignment = .center
        label.text = "مراسي"
        label.textColor = .white
        label.font = UIFont(name: "Cairo-Bold", size: 30)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let searchBar : UISearchBar = {
        let search = UISearchBar()
       
        search.tintColor = .white
        search.barTintColor = .white
        
        
        return search
    }()
    
    
    private let tableView : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.backgroundColor = .clear
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    
    
    
    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        cinfigureNavBar()
    
        view.addSubview(tableView)
        
        getData()
     //   bindTableView()
        
        
       tableView.delegate = self
      tableView.dataSource = self

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
    }
    
    
    //MARK:- NavBar
    private func cinfigureNavBar(){
        navigationController?.navigationBar.barTintColor = UIColor(red: 66/255.0, green: 41/255.0, blue: 24/255.0, alpha: 1.0)
        navigationItem.titleView = searchBar
        
        
        //TODO:- Logo in NavBar
        let containerView = UIControl(frame: CGRect.init(x: 0, y: 0, width: 90, height: 35))
        containerView.layer.borderWidth = 4
        containerView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
       
        let label = UILabel(frame: CGRect.init(x: 0, y: 0, width: 90, height:25))
        label.text = "مراسي"
        label.font = UIFont(name: "Cairo-Black", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        containerView.addSubview(label)
       
        let logo = UIBarButtonItem(customView: containerView)
        logo.width = 20
        navigationItem.rightBarButtonItem = logo
        
    }
    
    //MARK:- Customize Header  for the TableView
    func configureHeaderView(blocks : [Block], image: String)  {
        let  headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 3), blocks: blocks, image: image)
        tableView.tableHeaderView = headerView
        
    }
    
    //MARK:- Customize Footer  for the TableView
    func configureFooter(brands : [Brand], text : String){
        let footerView = FooterView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 150), brands: brands, text: text)
        tableView.tableFooterView = footerView
    
    }

    func  bindTableView() {
       
        productViewModel.contents.bind(to: tableView.rx.items(cellIdentifier: CollectionViewTableViewCell.identifier, cellType: CollectionViewTableViewCell.self)) { row , item , cell in
          
            if let products = item.products,
                item.backgroundImage == nil {
                    cell.configure(model : products, title: item.heading ?? "")
            }
        }.disposed(by: bag)
        
    }
    
  
    
    
    //MARK:- Get All Data
    func getData () {
        productViewModel.getData { [weak self](isSuccess) in
            if isSuccess {
                
                self?.configureHeaderView(blocks: self?.productViewModel.content[0].blocks ?? [], image: self?.productViewModel.content[0].backgroundImage ?? "")
                
                self?.configureFooter(brands: self?.productViewModel.content.last?.brands ?? [], text: self?.productViewModel.content.last?.heading ?? "")
                
                DispatchQueue.main.async { [weak self ] in
                    self?.tableView.reloadData()
              
                }
                
              
            }
        }
    }
    
}


//MARK:- Extension for table View Functions
extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            print("can't get category cell")
            return UITableViewCell()
        }
       
        if let products = productViewModel.content[indexPath.section].products,
            productViewModel.content[indexPath.section].backgroundImage == nil {
            cell.configure(model : products, title: productViewModel.content[indexPath.section].heading ?? "")
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return productViewModel.numberOfBanners - 1
        
    }
    

    // set the height for section
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0  {
            return 0
        }else if productViewModel.content[section].backgroundImage != nil {
            return 400
        }else {
            return 0
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 || indexPath.section == productViewModel.numberOfBanners - 1 {
            return 0
        }else  {
            return 300

        }
        
    }
    

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if productViewModel.content[section].backgroundImage != nil {
            
            let headerView = SectionView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: view.bounds.height), image: productViewModel.content[section].backgroundImage ?? "", title: productViewModel.content[section].heading ?? "", products: productViewModel.content[section].products ?? [])
            
           
            return headerView
            
        }else {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 0))
            
            return view
            
        }
        
    }
    
   
}
