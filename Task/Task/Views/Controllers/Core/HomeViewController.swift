//
//  HomeViewController.swift
//  Task
//
//  Created by Eslam Ali  on 16/05/2022.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController {
    
    
    //MARK:- Vars
    
    var productViewModel = ProductsViewModel()
    
    
    
    private let searchBar : UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "هل تبحث عن منتج؟"
        search.tintColor = .white
        
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
        configureHeroHeaderView()
        
        view.addSubview(tableView)
        
        getData()
        
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
        
        
        //TODO:- Logo
        
    }
    
    //MARK:- Header View with Category
    func configureHeroHeaderView()  {
        let  headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 3))
        tableView.tableHeaderView = headerView
        
    }
    
    func getData () {
        productViewModel.getData { [weak self](isSuccess) in
            if isSuccess {
                DispatchQueue.main.async { [weak self ] in
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            print("can't get category cell")
            return UITableViewCell()
        }
        
        cell.configure(model : productViewModel.content[indexPath.section].products ?? [])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return productViewModel.numberOfBanners
        
    }
    
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return productViewModel.content[section].heading ?? "defsult"
    //    }
    
    // set the height for section
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }else if productViewModel.content[section].backgroundImage != nil {
            return 300
        }else {
            return 30
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 0
        }
        return 300
    }
    
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return UIView()
        }else {
            
            if productViewModel.content[section].backgroundImage != nil {
                
                let headerView = SectionView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 2.2), image: productViewModel.content[section].backgroundImage ?? "", text: productViewModel.content[section].heading ?? "")
                return headerView
                
            }else {
                let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 18))
                let label = UILabel(frame: CGRect(x: -10, y: 0, width: view.frame.width, height: view.frame.height))
                label.text = productViewModel.content[section].heading
                label.textAlignment = .right
                label.font = .systemFont(ofSize: 15, weight: .bold)
                
                view.addSubview(label)
                
                return view
          
            }
        }
        
        
        
    }
}
