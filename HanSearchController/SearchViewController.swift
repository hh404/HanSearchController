//
//  SearchViewController.swift
//  HanSearchController
//
//  Created by hans on 2018/4/25.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate,UISearchBarDelegate,UISearchControllerDelegate{
    var tableView :UITableView?
    /// Search controller to help us with filtering.
    var searchController: UISearchController!
    
    /// Secondary search results table view.
    var resultsTableController: ResultsTableController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        self.tableView = UITableView(frame: self.view.bounds, style: .plain)
        self.tableView?.dataSource = self
        self.view.addSubview(self.tableView!)
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        resultsTableController = ResultsTableController()
        
        /*
         We want ourselves to be the delegate for this filtered table so
         didSelectRowAtIndexPath(_:) is called for both tables.
         */
        resultsTableController.tableView.delegate = self
        self.tableView?.backgroundColor = UIColor.yellow
        searchController = UISearchController(searchResultsController: resultsTableController)
        //searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        
        if #available(iOS 11.0, *) {
            // For iOS 11 and later, we place the search bar in the navigation bar.
            navigationController?.navigationBar.prefersLargeTitles = true
            
            navigationItem.searchController = searchController
            
            // We want the search bar visible all the time.
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            // For iOS 10 and earlier, we place the search bar in the table view's header.
            tableView?.tableHeaderView = searchController.searchBar
        }
        
        searchController.delegate = self
        searchController.dimsBackgroundDuringPresentation = false // default is YES
        searchController.searchBar.delegate = self    // so we can monitor text changes + others
        
        /*
         Search is now just presenting a view controller. As such, normal view controller
         presentation semanti'cs apply. Namely that presentation will walk up the view controller
         hierarchy until it finds the root view controller or one that defines a presentation context.
         */
        definesPresentationContext = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Hans Demo"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        return cell!
    }
}
