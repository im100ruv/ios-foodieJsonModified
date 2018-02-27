//
//  ViewController.swift
//  FoodieJsonModified
//
//  Created by Im100ruv on 27/02/18.
//  Copyright © 2018 Im100ruv. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        tableView.delegate = self
//        tableView.dataSource = self
//
//        tableView.reloadData()
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(PrepareData.instance.foodItems.count)
        return PrepareData.instance.foodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodItemCell", for: indexPath) as! FoodItemCell
        
        cell.foodImg.image = UIImage()
        cell.foodNameLbl.text = PrepareData.instance.foodItems[indexPath.row].name
        cell.foodDescLbl.text = PrepareData.instance.foodItems[indexPath.row].desc
        cell.foodPriceLbl.text = PrepareData.instance.foodItems[indexPath.row].price
        
        return cell
    }
    
    
 
}

