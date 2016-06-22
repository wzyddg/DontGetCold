//
//  ViewController.swift
//  iOS_Final
//
//  Created by 王泽宇 on 16/6/15.
//  Copyright © 2016年 iOSCourse. All rights reserved.
//

import UIKit
import SwiftyJSON
import WKProgressHUD

class ViewController: UIViewController,WeatherQueryCallback {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("上海".stringByAddingPercentEscapesUsingEncoding(CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(CFStringEncodings.GB_18030_2000.rawValue))))
//        print("上海".stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet()))
        
        
//        let progressHUD = WKProgressHUD.showInView(self.view, withText: "正在获取天气信息", animated: false)
//        progressHUD.dismiss(true)
        
//        Alamofire.request(.GET, "https://api.thinkpage.cn/v3/weather/hourly.json", parameters: ["key":"2hhkacgmhyr8wu6a","location":"beijing","start":"0","hours":"24"], encoding: .URL, headers: nil).responseJSON{res in
//            let data = JSON(data: res.data!)
//            print(data)
//        }
        
        var a = WeatherQuerier()
        a.getSinaWeatherDetail(self)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func doGetWeatherJSON(info: JSON) {
        print(info)
        print(info["results"][0]["now"]["wind_direction"])
    }

}

