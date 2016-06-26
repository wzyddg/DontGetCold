//
//  AirController.swift
//  iOS_Final
//
//  Created by 王泽宇 on 16/6/24.
//  Copyright © 2016年 iOSCourse. All rights reserved.
//

import UIKit
import SwiftyJSON

class AirController: UIViewController {
    @IBOutlet weak var pm25: UILabel!
    @IBOutlet weak var pm10: UILabel!
    @IBOutlet weak var so2: UILabel!
    @IBOutlet weak var no2: UILabel!
    @IBOutlet weak var co: UILabel!
    @IBOutlet weak var o3: UILabel!
    @IBOutlet weak var aqi: UILabel!
    @IBOutlet weak var quality: UILabel!
    
    var data : JSON?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        let subJSON = data!["results"][0]["air"]["city"]
        pm10.text = "PM10:\(subJSON["pm25"])μg/m³"
        pm25.text = "\(subJSON["pm10"])μg/m³"
        so2.text = "二氧化硫:\(subJSON["so2"])μg/m³"
        no2.text = "二氧化氮:\(subJSON["no2"])μg/m³"
        co.text = "一氧化碳:\(subJSON["co"])μg/m³"
        quality.text = "\(subJSON["quality"])"
        o3.text = "臭氧:\(subJSON["o3"])μg/m³"
        aqi.text = "空气质量指数:\(subJSON["aqi"])"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonClicked(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(false)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
