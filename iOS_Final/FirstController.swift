//
//  FirstController.swift
//  iOS_Final
//
//  Created by 王泽宇 on 16/6/24.
//  Copyright © 2016年 iOSCourse. All rights reserved.
//

import UIKit
import SwiftyJSON

class FirstController: UIViewController,WeatherQueryCallback {
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var windDirectionLabel: UILabel!
    @IBOutlet weak var windPowerLabel: UILabel!
    @IBOutlet weak var realFeelTemperatureLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var cloudLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var dewPointLabel: UILabel!
    @IBOutlet weak var weatherTextLabel: UILabel!

    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var markButton1: UIButton!
    @IBOutlet weak var markButton2: UIButton!
    //"°C"
    var querier = WeatherQuerier()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setToolbarHidden(true, animated: false)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController
        reload()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doGetWeatherJSON(info: JSON) {
//        print(info)
//        self.scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: 3000)
        markButton1.enabled = true
        markButton2.enabled = true
        loadingIndicator.stopAnimating()
        
        let data = info["results"][0]
        cityNameLabel.text = data["location"]["name"].string
        NSUserDefaults.standardUserDefaults().setObject(data["location"]["name"].string, forKey: "DontGetColdCity")
        weatherImageView.image = UIImage(named: data["now"]["code"].string!)
        weatherTextLabel.text = data["now"]["text"].string
        temperatureLabel.text = data["now"]["temperature"].string! + "°C"
        realFeelTemperatureLabel.text = "体感:"+data["now"]["feels_like"].string! + "°C"
        windDirectionLabel.text = "风向:\(data["now"]["wind_direction"].string!)风 风向角度:\(data["now"]["wind_direction_degree"].string!)°"
        windPowerLabel.text = "风速:\(data["now"]["wind_speed"].string!)km/h 风力等级:\(data["now"]["wind_scale"].string!)"
        visibilityLabel.text = "能见度:\(data["now"]["visibility"].string!)km"
        pressureLabel.text = "气压:\(data["now"]["pressure"].string!)百帕"
        cloudLabel.text = "云量:\(data["now"]["clouds"].string!=="" ? "0":data["now"]["clouds"].string!)%"
        humidityLabel.text = "湿度:\(data["now"]["humidity"].string!)%"
        dewPointLabel.text = "露点温度:\(data["now"]["dew_point"].string!)°C"
        
        self.scrollView.hidden = false
    }
    
    @IBAction func reloadButtonClicked(sender: AnyObject) {
        print("reload")
        reload()
    }
    
    @IBAction func markButtonClicked(sender: AnyObject) {
        print("mark")
    }
    
    @IBAction func moreButtonClicked(sender: AnyObject) {
        print("more")
        let moreVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MoreFunctionController") as! MoreFunctionController
        self.navigationController?.pushViewController(moreVC, animated: true)
    }
    
    func reload() {
        markButton1.enabled = false
        markButton2.enabled = false
        self.scrollView.hidden = true
        loadingIndicator.hidden = false
        loadingIndicator.startAnimating()
        querier.getCurrentWeather(self)
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
