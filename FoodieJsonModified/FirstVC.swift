//
//  FirstVC.swift
//  FoodieJsonModified
//
//  Created by Im100ruv on 27/02/18.
//  Copyright © 2018 Im100ruv. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        PrepareData.instance.post_request("", parameterStr: "submenu_id=1&item_type=non-veg", completion: { (JSON : [[String:AnyObject]]) in
            //            print(JSON)
        })

        // Do any additional setup after loading the view.
    }

}
