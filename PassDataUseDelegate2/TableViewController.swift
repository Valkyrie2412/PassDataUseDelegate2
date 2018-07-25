//
//  TableViewController.swift
//  PassDataUseDelegate2
//
//  Created by Hiếu Nguyễn on 7/18/18.
//  Copyright © 2018 Hiếu Nguyễn. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, DataDelegate {
    func didFindDaTa(data: String) {
        if let textIndex = tableView.indexPathForSelectedRow {
            arrayCity[textIndex.row] = data
        } else {
            arrayCity.append(data)
        }
        tableView.reloadData()
    }
    
    var arrayCity = ["Ha Noi", "Ho Chi Minh", "Da Nang"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewDidAppear(animated)
    //        tableView.reloadData()
    //    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewDidAppear(animated)
    //        tableView.reloadData()
    //    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayCity.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrayCity[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? ViewController {
            detailViewController.delegate = self
            guard let  indexPath = tableView.indexPathForSelectedRow else {return}
            detailViewController.data = arrayCity[indexPath.row]
        }
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            arrayCity.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
}

