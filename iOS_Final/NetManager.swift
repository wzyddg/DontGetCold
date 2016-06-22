//
//  NetManager.swift
//  iOS_Final
//
//  Created by 王泽宇 on 16/6/21.
//  Copyright © 2016年 iOSCourse. All rights reserved.
//

import Foundation

protocol WeatherQueryCallback {
    func doGetWeatherDictionary(info : NSDictionary)
}

class NetManager {
    var dataDelegate: WeatherQueryCallback?
    
    func getCurrentWeather(delegate : WeatherQueryCallback)  {
        self.dataDelegate = delegate
    }
}