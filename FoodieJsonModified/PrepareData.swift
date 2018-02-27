//
//  PrepareData.swift
//  FoodieJsonModified
//
//  Created by Im100ruv on 27/02/18.
//  Copyright © 2018 Im100ruv. All rights reserved.
//

import Foundation

struct FoodItem {
    var name : String!
    var desc : String!
    var price : String!
    var img : String!
}

class PrepareData {
    static let instance = PrepareData()
    
    var foodItems = [FoodItem]()
  
    
    func post_request(_ appendString:String, parameterStr:String, completion: @escaping (_ result: [[String:AnyObject]]) -> Void) {//completionHandler: ((NSDictionary!) -> Void)?) {
        var responseDict : [[String:AnyObject]] = []
        ////print("parameters are \(parameterStr)")
        
        let url:URL = URL(string: NSString(format: "http://emenu.foodiemenu.in/android_sms/emenu_data/jsonData.php") as String)!
        _ = URLSession.shared
        //print(session)
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        
        let paramString = parameterStr
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {(returnData, response, error) in
            
            guard let _:Data = returnData, let _:URLResponse = response  , error == nil else {
                print("error")
                return
            }
            let dataString = NSString(data: returnData!, encoding: String.Encoding.utf8.rawValue)
            //            print(dataString!)
            do {
                if let json = try JSONSerialization.jsonObject(with: returnData!, options: []) as? [[String:AnyObject]] {
                    
                    responseDict = json
                    //                    print("The Requested API is \(responseDict)")
                    
                    for item in responseDict {
                        var temp = FoodItem()
                        temp.name = item["item_name"] as! String
                        temp.desc = item["item_description"] as! String
                        temp.price = item["item_price"] as! String
                        temp.img = item["item_image"] as! String
                        
                        self.foodItems.append(temp)
                    }
                    print("-----------=======" + "\(self.foodItems[1])" + "-----------=======")
                    
                } else {
                    let jsonStr = NSString(data: returnData!, encoding: String.Encoding.utf8.rawValue)
                    print("Error could not parse JSON: \(jsonStr!)")
                }
            } catch let parseError {
                print(parseError)
                let jsonStr = NSString(data: returnData!, encoding: String.Encoding.utf8.rawValue)
                print("Error could not parse JSON: '\(jsonStr!)'")
            }
            completion(responseDict)
        }
        task.resume()
    }
}
