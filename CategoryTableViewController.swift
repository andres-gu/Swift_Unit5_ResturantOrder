//
//  CategoryTableViewController.swift
//  RestaurantOrder
//
//  Created by Andres Gutierrez on 1/31/18.
//  Copyright © 2018 Andres Gutierrez. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    var categories = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MenuController.shared.fetchCategories { (categories) in
            if let categories = categories {
                updateUI(with: categories)
            }
        }
        
        func updateUI(with categories: [String]) {
            DispatchQueue.main.async {
                self.categories = categories
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return categories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCellIdentifier", for: indexPath)

        configure(cell: cell, forItemAt: indexPath)
        return cell
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let categoryString = categories[indexPath.row]
        cell.textLabel?.text = categoryString.capitalized
    }

    


    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MenuSegue" {
            let menuTableViewController = segue.destination as! MenuTableViewController
            let index = tableView.indexPathForSelectedRow!.row
            menuTableViewController.category = categories[index]
        }
    }


}
