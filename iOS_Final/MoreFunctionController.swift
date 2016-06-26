//
//  MoreFunctionController.swift
//  iOS_Final
//
//  Created by 王泽宇 on 16/6/24.
//  Copyright © 2016年 iOSCourse. All rights reserved.
//

import UIKit
import SwiftyJSON
import WKProgressHUD

enum QueryType {
    case Weather24
    case Disaster
    case Weather7
    case Air
    case AirD
    case Sina
    case Life
}

class MoreFunctionController: UIViewController,WeatherQueryCallback {

    var querier = WeatherQuerier()
    var hud : WKProgressHUD?
    var type = QueryType.Air
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.navigationController?.setToolbarHidden(true, animated: false)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonClicked(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(false)
    }

    @IBAction func prediction7Days(sender: AnyObject) {
        print("7day")
        hud = WKProgressHUD.showInView(self.view, withText: "加载中", animated: true)
        
        type = .Weather7
        querier.getDailyWeather(self)
    }
    
    @IBAction func prediction24Hours(sender: AnyObject) {
        print("24hour")
        hud = WKProgressHUD.showInView(self.view, withText: "加载中", animated: true)
        type = .Weather24
        querier.getHourlyWeather(self)
    }
    
    @IBAction func naturalDisaster(sender: AnyObject) {
        print("disaster")
        hud = WKProgressHUD.showInView(self.view, withText: "加载中", animated: true)
        type = .Disaster
        querier.getNaturalDisaster(self)
    }
    
    @IBAction func lifeThinkPage(sender: AnyObject) {
        print("lifethink")
        hud = WKProgressHUD.showInView(self.view, withText: "加载中", animated: true)
        type = .Life
        querier.getLifeSuggestion(self)
    }
    
    @IBAction func airQualityDaily(sender: AnyObject) {
        print("airQDaily")
        hud = WKProgressHUD.showInView(self.view, withText: "加载中", animated: true)
        type = .AirD
        querier.getDailyAirQuality(self)
    }
    
    @IBAction func airQuality(sender: AnyObject) {
        print("airQ")
        hud = WKProgressHUD.showInView(self.view, withText: "加载中", animated: true)
        type = .Air
        querier.getCurrentAirQuality(self)
    }
    
    @IBAction func moreWeatherInfo(sender: AnyObject) {
        print("more info")
        hud = WKProgressHUD.showInView(self.view, withText: "加载中", animated: true)
        type = .Sina
        querier.getSinaWeatherDetail(self)
    }
    
    func doGetWeatherJSON(info: JSON) {
        print(info)
        hud?.dismiss(true)
        switch type {
        case .Weather7:
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ResultTableController") as! ResultTableController
            print(info)
            vc.type = type
            vc.data = info
            self.navigationController?.pushViewController(vc, animated: false)
            break
        case .Air:
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("AirController") as! AirController
            vc.data = info
            self.navigationController?.pushViewController(vc, animated: false)
            break
        default:
            break
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
