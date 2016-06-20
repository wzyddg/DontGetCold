//
//  ViewController.swift
//  iOS_Final
//
//  Created by 王泽宇 on 16/6/15.
//  Copyright © 2016年 iOSCourse. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("上海".stringByAddingPercentEscapesUsingEncoding(CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(CFStringEncodings.GB_18030_2000.rawValue))))
        
//        Alamofire.request(.GET, "https://github.com/Alamofire/Alamofire").responseJSON{res in
//            let data = JSON(data: res.data!)
//            print(data)
//        }
        
        Alamofire.request(.GET, "https://api.thinkpage.cn/v3/weather/hourly.json", parameters: ["key":"2hhkacgmhyr8wu6a","location":"beijing","start":"0","hours":"24"], encoding: .URL, headers: nil).responseJSON{res in
            let data = JSON(data: res.data!)
            print(data)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

