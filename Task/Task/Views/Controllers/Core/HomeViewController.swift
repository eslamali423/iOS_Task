//
//  HomeViewController.swift
//  Task
//
//  Created by Eslam Ali  on 16/05/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    //MARK:- Vars
    private let searchBar : UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "هل تبحث عن منتج؟"
        search.tintColor = .white
        
        return search
    }()
    
    
    private let tableView : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    
    
    
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        cinfigureNavBar()
        view.addSubview(tableView)
        
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
    
    
    
    
}



extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UITableViewCell
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
        
    }
    
    // set the height for section
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let   headerView = SectionHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 2))
        return headerView
    }
    
    
    
}
