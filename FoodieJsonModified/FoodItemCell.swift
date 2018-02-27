//
//  FoodItemCell.swift
//  FoodieJsonModified
//
//  Created by Im100ruv on 27/02/18.
//  Copyright © 2018 Im100ruv. All rights reserved.
//

import UIKit

class FoodItemCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var foodImg: UIImageView!
    @IBOutlet weak var foodNameLbl: UILabel!
    @IBOutlet weak var foodDescLbl: UILabel!
    @IBOutlet weak var foodPriceLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
