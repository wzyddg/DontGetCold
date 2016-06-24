//
//  MoreFunctionController.swift
//  iOS_Final
//
//  Created by 王泽宇 on 16/6/24.
//  Copyright © 2016年 iOSCourse. All rights reserved.
//

import UIKit
import SwiftyJSON

enum QueryType {
    case sasdas
}

class MoreFunctionController: UIViewController,WeatherQueryCallback {

    var querier = WeatherQuerier()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonClicked(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func prediction7Days(sender: AnyObject) {
        print("7day")
        querier.getDailyWeather(self)
        
    }
    
    @IBAction func prediction24Hours(sender: AnyObject) {
        print("24hour")
    }
    
    @IBAction func naturalDisaster(sender: AnyObject) {
        print("disaster")
    }
    
    @IBAction func lifeSina(sender: AnyObject) {
        print("lifesina")
    }
    
    @IBAction func lifeThinkPage(sender: AnyObject) {
        print("lifethink")
    }
    
    @IBAction func airQualityDaily(sender: AnyObject) {
        print("airQ")
    }
    
    @IBAction func airQuality(sender: AnyObject) {
        print("airQDaily")
    }
    
    @IBAction func moreWeatherInfo(sender: AnyObject) {
        print("more info")
    }
    
    func doGetWeatherJSON(info: JSON) {
        print(info)
        for (key,subJson):(String, JSON) in info {
            print(key)
        }
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
