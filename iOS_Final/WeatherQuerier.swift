//
//  NetManager.swift
//  iOS_Final
//
//  Created by 王泽宇 on 16/6/21.
//  Copyright © 2016年 iOSCourse. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import XMLDictionary

protocol WeatherQueryCallback {
    func doGetWeatherJSON(info : JSON)
}

class WeatherQuerier {
    let thinkPageKey = "2hhkacgmhyr8wu6a"
    let currentWeatherURL = "https://api.thinkpage.cn/v3/weather/now.json"
    let dailyWeatherURL = "https://api.thinkpage.cn/v3/weather/daily.json"
    let hourlyWeatherURL = "https://api.thinkpage.cn/v3/weather/hourly.json"
    let naturalDisasterURL = "https://api.thinkpage.cn/v3/weather/alarm.json"
    let currentAirQualityURL = "https://api.thinkpage.cn/v3/air/now.json"
    let dailyAirQualityURL = "https://api.thinkpage.cn/v3/air/daily.json"
    let lifeSuggestionURL = "https://api.thinkpage.cn/v3/life/suggestion.json"
    let siniaWeatherURL = "http://php.weather.sina.com.cn/xml.php"
    let thinkPageParameters = ["key":"2hhkacgmhyr8wu6a","location":"ip"]
    let GB180302000StringEncoding =  CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(CFStringEncodings.GB_18030_2000.rawValue))
    var dataDelegate: WeatherQueryCallback?
    
    let sinaKeyDictionary = ["chy_shuoming":"穿衣说明","tgd1":"日间体感温度","power1":"日间风级","zwx":"紫外线","gm":"感冒","direction1":"日间风向","status2":"夜间天气状况","ktk":"空调","ssd":"体感指数","temperature1":"日间温度","power2":"夜间风级","udatetime":"数据更新时间","direction2":"夜间风向","temperature2":"夜间温度","xcz":"洗车","pollution":"污染指数","yd":"运动","tgd2":"夜间体感温度","status1":"雷阵雨","chy":"穿衣指南"]
    
    func getCurrentWeather(delegate : WeatherQueryCallback) {
        self.dataDelegate = delegate
//        Alamofire.request(.GET, currentWeatherURL, parameters: thinkPageParameters, encoding: .URL , headers: nil).response{response in
//            let resJSON = JSON(data: response.2!)
//            self.dataDelegate?.doGetWeatherJSON(resJSON)
//        }
        
        let res = JSON(data: "{\"results\":[{\"now\":{\"temperature\":\"26\",\"humidity\":\"88\",\"wind_direction_degree\":\"0\",\"code\":\"9\",\"wind_direction\":\"北\",\"text\":\"阴\",\"feels_like\":\"26\",\"visibility\":\"13.6\",\"wind_speed\":\"0.0\",\"pressure\":\"1003\",\"wind_scale\":\"0\",\"clouds\":\"\",\"dew_point\":\"-4\"},\"location\":{\"path\":\"上海,上海,中国\",\"id\":\"WTW3SJ5ZBJUY\",\"country\":\"CN\",\"timezone\":\"Asia/Shanghai\",\"name\":\"上海\",\"timezone_offset\":\"+08:00\"},\"last_update\":\"2016-06-22T20:25:00+08:00\"}]}".dataUsingEncoding(NSUTF8StringEncoding)!)
        self.dataDelegate?.doGetWeatherJSON(res)
    }
    
    //future 7 days
    func getDailyWeather(delegate : WeatherQueryCallback) {
        self.dataDelegate = delegate
//        Alamofire.request(.GET, dailyWeatherURL, parameters: thinkPageParameters, encoding: .URL , headers: nil).response{response in
//            let resJSON = JSON(data: response.2!)
//            self.dataDelegate?.doGetWeatherJSON(resJSON)
//        }
        
        let res = JSON(data: "{\"results\":[{\"location\":{\"id\":\"WTW3SJ5ZBJUY\",\"name\":\"上海\",\"country\":\"CN\",\"path\":\"上海,上海,中国\",\"timezone\":\"Asia/Shanghai\",\"timezone_offset\":\"+08:00\"},\"daily\":[{\"date\":\"2016-06-23\",\"text_day\":\"多云\",\"code_day\":\"4\",\"text_night\":\"多云\",\"code_night\":\"4\",\"high\":\"34\",\"low\":\"25\",\"precip\":\"80\",\"wind_direction\":\"南\",\"wind_direction_degree\":\"180\",\"wind_speed\":\"10\",\"wind_scale\":\"2\"},{\"date\":\"2016-06-24\",\"text_day\":\"雷阵雨\",\"code_day\":\"11\",\"text_night\":\"雷阵雨\",\"code_night\":\"11\",\"high\":\"33\",\"low\":\"23\",\"precip\":\"50\",\"wind_direction\":\"西\",\"wind_direction_degree\":\"270\",\"wind_speed\":\"10\",\"wind_scale\":\"2\"},{\"date\":\"2016-06-25\",\"text_day\":\"阵雨\",\"code_day\":\"10\",\"text_night\":\"阴\",\"code_night\":\"9\",\"high\":\"28\",\"low\":\"24\",\"precip\":\"60\",\"wind_direction\":\"南\",\"wind_direction_degree\":\"180\",\"wind_speed\":\"10\",\"wind_scale\":\"2\"},{\"date\":\"2016-06-26\",\"text_day\":\"雷阵雨\",\"code_day\":\"11\",\"text_night\":\"阴\",\"code_night\":\"9\",\"high\":\"28\",\"low\":\"25\",\"precip\":\"90\",\"wind_direction\":\"南\",\"wind_direction_degree\":\"180\",\"wind_speed\":\"10\",\"wind_scale\":\"2\"},{\"date\":\"2016-06-27\",\"text_day\":\"雷阵雨\",\"code_day\":\"11\",\"text_night\":\"雷阵雨\",\"code_night\":\"11\",\"high\":\"30\",\"low\":\"24\",\"precip\":\"90\",\"wind_direction\":\"东南\",\"wind_direction_degree\":\"135\",\"wind_speed\":\"15\",\"wind_scale\":\"3\"},{\"date\":\"2016-06-28\",\"text_day\":\"雷阵雨\",\"code_day\":\"11\",\"text_night\":\"雷阵雨\",\"code_night\":\"11\",\"high\":\"27\",\"low\":\"23\",\"precip\":\"80\",\"wind_direction\":\"东北\",\"wind_direction_degree\":\"45\",\"wind_speed\":\"10\",\"wind_scale\":\"2\"},{\"date\":\"2016-06-29\",\"text_day\":\"小雨\",\"code_day\":\"13\",\"text_night\":\"小雨\",\"code_night\":\"13\",\"high\":\"26\",\"low\":\"23\",\"precip\":\"80\",\"wind_direction\":\"南\",\"wind_direction_degree\":\"180\",\"wind_speed\":\"10\",\"wind_scale\":\"2\"}],\"last_update\":\"2016-06-22T18:00:00+08:00\"}]}".dataUsingEncoding(NSUTF8StringEncoding)!)
        self.dataDelegate?.doGetWeatherJSON(res)
    }
    
    //future hours
    func getHourlyWeather(delegate : WeatherQueryCallback) {
        self.dataDelegate = delegate
//        Alamofire.request(.GET, hourlyWeatherURL, parameters: thinkPageParameters, encoding: .URL , headers: nil).response{response in
//            let resJSON = JSON(data: response.2!)
//            self.dataDelegate?.doGetWeatherJSON(resJSON)
//        }
        
        let res = JSON(data: "{\"results\":[{\"location\":{\"id\":\"WTW3SJ5ZBJUY\",\"name\":\"上海\",\"country\":\"CN\",\"path\":\"上海,上海,中国\",\"timezone\":\"Asia/Shanghai\",\"timezone_offset\":\"+08:00\"},\"hourly\":[{\"time\":\"2016-06-22T22:00:00+08:00\",\"text\":\"阴\",\"code\":\"9\",\"temperature\":\"27\",\"humidity\":\"91\",\"wind_direction\":\"南\",\"wind_speed\":\"3.6\"},{\"time\":\"2016-06-22T23:00:00+08:00\",\"text\":\"阴\",\"code\":\"9\",\"temperature\":\"27\",\"humidity\":\"92\",\"wind_direction\":\"南\",\"wind_speed\":\"3.6\"},{\"time\":\"2016-06-23T00:00:00+08:00\",\"text\":\"阴\",\"code\":\"9\",\"temperature\":\"27\",\"humidity\":\"92\",\"wind_direction\":\"南\",\"wind_speed\":\"3.6\"},{\"time\":\"2016-06-23T01:00:00+08:00\",\"text\":\"阴\",\"code\":\"9\",\"temperature\":\"26\",\"humidity\":\"93\",\"wind_direction\":\"南\",\"wind_speed\":\"3.6\"},{\"time\":\"2016-06-23T02:00:00+08:00\",\"text\":\"阴\",\"code\":\"9\",\"temperature\":\"26\",\"humidity\":\"93\",\"wind_direction\":\"南\",\"wind_speed\":\"3.6\"},{\"time\":\"2016-06-23T03:00:00+08:00\",\"text\":\"阴\",\"code\":\"9\",\"temperature\":\"26\",\"humidity\":\"93\",\"wind_direction\":\"南\",\"wind_speed\":\"3.6\"},{\"time\":\"2016-06-23T04:00:00+08:00\",\"text\":\"阴\",\"code\":\"9\",\"temperature\":\"25\",\"humidity\":\"93\",\"wind_direction\":\"南\",\"wind_speed\":\"0.0\"},{\"time\":\"2016-06-23T05:00:00+08:00\",\"text\":\"阴\",\"code\":\"9\",\"temperature\":\"25\",\"humidity\":\"93\",\"wind_direction\":\"南\",\"wind_speed\":\"0.0\"},{\"time\":\"2016-06-23T06:00:00+08:00\",\"text\":\"阴\",\"code\":\"9\",\"temperature\":\"26\",\"humidity\":\"93\",\"wind_direction\":\"南\",\"wind_speed\":\"0.0\"},{\"time\":\"2016-06-23T07:00:00+08:00\",\"text\":\"阴\",\"code\":\"9\",\"temperature\":\"28\",\"humidity\":\"94\",\"wind_direction\":\"南\",\"wind_speed\":\"3.6\"},{\"time\":\"2016-06-23T08:00:00+08:00\",\"text\":\"多云\",\"code\":\"4\",\"temperature\":\"29\",\"humidity\":\"94\",\"wind_direction\":\"南\",\"wind_speed\":\"3.6\"},{\"time\":\"2016-06-23T09:00:00+08:00\",\"text\":\"多云\",\"code\":\"4\",\"temperature\":\"28\",\"humidity\":\"94\",\"wind_direction\":\"南\",\"wind_speed\":\"3.6\"},{\"time\":\"2016-06-23T10:00:00+08:00\",\"text\":\"多云\",\"code\":\"4\",\"temperature\":\"27\",\"humidity\":\"93\",\"wind_direction\":\"南\",\"wind_speed\":\"3.6\"},{\"time\":\"2016-06-23T11:00:00+08:00\",\"text\":\"多云\",\"code\":\"4\",\"temperature\":\"27\",\"humidity\":\"92\",\"wind_direction\":\"南\",\"wind_speed\":\"3.6\"},{\"time\":\"2016-06-23T12:00:00+08:00\",\"text\":\"多云\",\"code\":\"4\",\"temperature\":\"27\",\"humidity\":\"92\",\"wind_direction\":\"南\",\"wind_speed\":\"3.6\"},{\"time\":\"2016-06-23T13:00:00+08:00\",\"text\":\"多云\",\"code\":\"4\",\"temperature\":\"27\",\"humidity\":\"92\",\"wind_direction\":\"南\",\"wind_speed\":\"7.2\"},{\"time\":\"2016-06-23T14:00:00+08:00\",\"text\":\"多云\",\"code\":\"4\",\"temperature\":\"27\",\"humidity\":\"92\",\"wind_direction\":\"南\",\"wind_speed\":\"7.2\"},{\"time\":\"2016-06-23T15:00:00+08:00\",\"text\":\"多云\",\"code\":\"4\",\"temperature\":\"27\",\"humidity\":\"92\",\"wind_direction\":\"南\",\"wind_speed\":\"7.2\"},{\"time\":\"2016-06-23T16:00:00+08:00\",\"text\":\"多云\",\"code\":\"4\",\"temperature\":\"27\",\"humidity\":\"91\",\"wind_direction\":\"南\",\"wind_speed\":\"7.2\"},{\"time\":\"2016-06-23T17:00:00+08:00\",\"text\":\"多云\",\"code\":\"4\",\"temperature\":\"27\",\"humidity\":\"91\",\"wind_direction\":\"南\",\"wind_speed\":\"7.2\"},{\"time\":\"2016-06-23T18:00:00+08:00\",\"text\":\"多云\",\"code\":\"4\",\"temperature\":\"29\",\"humidity\":\"91\",\"wind_direction\":\"南\",\"wind_speed\":\"7.2\"},{\"time\":\"2016-06-23T19:00:00+08:00\",\"text\":\"多云\",\"code\":\"4\",\"temperature\":\"32\",\"humidity\":\"90\",\"wind_direction\":\"南\",\"wind_speed\":\"10.8\"},{\"time\":\"2016-06-23T20:00:00+08:00\",\"text\":\"多云\",\"code\":\"4\",\"temperature\":\"33\",\"humidity\":\"90\",\"wind_direction\":\"西南\",\"wind_speed\":\"10.8\"},{\"time\":\"2016-06-23T21:00:00+08:00\",\"text\":\"多云\",\"code\":\"4\",\"temperature\":\"32\",\"humidity\":\"87\",\"wind_direction\":\"西南\",\"wind_speed\":\"10.8\"}]}]}".dataUsingEncoding(NSUTF8StringEncoding)!)
        self.dataDelegate?.doGetWeatherJSON(res)
    }
    
    //natual disaster
    func getNaturalDisaster(delegate : WeatherQueryCallback) {
        self.dataDelegate = delegate
//        Alamofire.request(.GET, naturalDisasterURL, parameters: thinkPageParameters, encoding: .URL , headers: nil).response{response in
//            let resJSON = JSON(data: response.2!)
//            self.dataDelegate?.doGetWeatherJSON(resJSON)
//        }
        
        //not empty
        let res = JSON(data: "{\"results\":[{\"location\":{\"id\":\"WRPJ1FYVCB0D\",\"name\":\"托县\",\"country\":\"CN\",\"path\":\"托县,呼和浩特,内蒙古,中国\",\"timezone\":\"Asia/Shanghai\",\"timezone_offset\":\"+08:00\"},\"alarms\":[{\"title\":\"内蒙古自治区呼和浩特市气象台发布霾黄色预警\",\"type\":\"霾\",\"level\":\"黄色\",\"status\":\"\",\"description\":\"24小时内呼市市区北部及沿山一带可能出现能见度小于3000米且相对湿度小于80的中度霾，易形成中度空气污染。\",\"pub_date\":\"2016-06-20T20:30:00+08:00\"},{\"title\":\"内蒙古自治区呼和浩特市气象台发布霾黄sadasd色预警\",\"type\":\"霾\",\"level\":\"黄色\",\"status\":\"\",\"description\":\"24小时内呼市市区北部及沿山一带可能出现能见度小于3000米且相对湿度小于80的中度霾，易形成中度空气污染。\",\"pub_date\":\"2016-06-20T20:30:00+08:00\"},{\"title\":\"内蒙古自治区呼和浩特市气awdawdaw象台发布霾黄色预警\",\"type\":\"霾\",\"level\":\"黄色\",\"status\":\"\",\"description\":\"24小时内呼市市区北部及沿山一带可能出现能见度小于3000米且相对湿度小于80的中度霾，易形成中度空气污染。\",\"pub_date\":\"2016-06-20T20:30:00+08:00\"}]}]}".dataUsingEncoding(NSUTF8StringEncoding)!)
        
        //empty
//        let res = JSON(data: "{\"results\":[{\"location\":{\"id\":\"WRPJ1FYVCB0D\",\"name\":\"托县\",\"country\":\"CN\",\"path\":\"托县,呼和浩特,内蒙古,中国\",\"timezone\":\"Asia/Shanghai\",\"timezone_offset\":\"+08:00\"},\"alarms\":[]}]}".dataUsingEncoding(NSUTF8StringEncoding)!)
        self.dataDelegate?.doGetWeatherJSON(res)
    }
    
    func getCurrentAirQuality(delegate : WeatherQueryCallback) {
        self.dataDelegate = delegate
//        Alamofire.request(.GET, currentAirQualityURL, parameters: thinkPageParameters, encoding: .URL , headers: nil).response{response in
//            let resJSON = JSON(data: response.2!)
//            self.dataDelegate?.doGetWeatherJSON(resJSON)
//        }
        
        let res = JSON(data: "{\"results\":[{\"location\":{\"id\":\"WTW3SJ5ZBJUY\",\"name\":\"上海\",\"country\":\"CN\",\"path\":\"上海,上海,中国\",\"timezone\":\"Asia/Shanghai\",\"timezone_offset\":\"+08:00\"},\"air\":{\"city\":{\"aqi\":\"52\",\"pm25\":\"34\",\"pm10\":\"53\",\"so2\":\"9\",\"no2\":\"62\",\"co\":\"0.831\",\"o3\":\"15\",\"last_update\":\"2016-06-22T22:00:00+08:00\",\"quality\":\"良\"},\"stations\":null},\"last_update\":\"2016-06-22T22:00:00+08:00\"}]}".dataUsingEncoding(NSUTF8StringEncoding)!)
        self.dataDelegate?.doGetWeatherJSON(res)
    }
    
    func getLifeSuggestion(delegate : WeatherQueryCallback) {
        self.dataDelegate = delegate
//        Alamofire.request(.GET, lifeSuggestionURL, parameters: thinkPageParameters, encoding: .URL , headers: nil).response{response in
//            let resJSON = JSON(data: response.2!)
//            self.dataDelegate?.doGetWeatherJSON(resJSON)
//        }
        
        let res = JSON(data: "{\"results\":[{\"location\":{\"id\":\"WTW3SJ5ZBJUY\",\"name\":\"上海\",\"country\":\"CN\",\"path\":\"上海,上海,中国\",\"timezone\":\"Asia/Shanghai\",\"timezone_offset\":\"+08:00\"},\"suggestion\":{\"ac\":{\"brief\":\"部分时间开启\",\"details\":\"您将感到些燥热，建议您在适当的时候开启制冷空调来降低温度，以免中暑。\"},\"air_pollution\":{\"brief\":\"较差\",\"details\":\"气象条件较不利于空气污染物稀释、扩散和清除，请适当减少室外活动时间。\"},\"airing\":{\"brief\":\"适宜\",\"details\":\"天气不错，适宜晾晒。赶紧把久未见阳光的衣物搬出来吸收一下太阳的味道吧！\"},\"allergy\":{\"brief\":\"极不易发\",\"details\":\"天气条件极不易诱发过敏，可放心外出，享受生活。\"},\"beer\":{\"brief\":\"适宜\",\"details\":\"炎热干燥，一杯清凉的啤酒可有助于缓解燥热之苦，并带来舒爽的感觉。但注意不要贪杯呦！\"},\"boating\":{\"brief\":\"适宜\",\"details\":\"白天天气较好，适宜划船或嬉玩各种水上运动。\"},\"car_washing\":{\"brief\":\"较适宜\",\"details\":\"较适宜洗车，未来一天无雨，风力较小，擦洗一新的汽车至少能保持一天。\"},\"chill\":{\"brief\":\"无\",\"details\":\"温度未达到风寒所需的低温，稍作防寒准备即可。\"},\"comfort\":{\"brief\":\"很不舒适\",\"details\":\"白天天气晴好，但烈日炎炎和较大的空气湿度会使您感到很闷热，很不舒适。\"},\"dating\":{\"brief\":\"较不适宜\",\"details\":\"天气较好，但天气较热，建议尽量不要去室外约会，如果外出，请您挑选荫凉地点。\"},\"dressing\":{\"brief\":\"炎热\",\"details\":\"天气炎热，建议着短衫、短裙、短裤、薄型T恤衫等清凉夏季服装。\"},\"fishing\":{\"brief\":\"不宜\",\"details\":\"天气太热，不适合垂钓。\"},\"flu\":{\"brief\":\"少发\",\"details\":\"各项气象条件适宜，发生感冒机率较低。但请避免长期处于空调房间中，以防感冒。\"},\"hair_dressing\":{\"brief\":\"一般\",\"details\":\"头发需要保持清洁，同时要注意防晒，含防晒成分洗发护发品以及遮阳帽、伞是很好的选择。\"},\"kiteflying\":{\"brief\":\"不宜\",\"details\":\"天气酷热，不适宜放风筝。\"},\"makeup\":{\"brief\":\"防脱水\",\"details\":\"天气较热，易出汗，建议使用防脱水化妆品，少用粉底和胭脂，经常补粉。\"},\"mood\":{\"brief\":\"较差\",\"details\":\"天气较好，气温较高，会让人觉得有些烦躁，注意室内通风降温，保持心态平和，给自己的情绪“降降温”。\"},\"morning_sport\":{\"brief\":\"较适宜\",\"details\":\"早晨气象条件较适宜晨练，但晨练时会感觉有点凉，建议晨练着装不要过于单薄，以防感冒。\"},\"night_life\":{\"brief\":\"较适宜\",\"details\":\"虽然是阴天，但仍比较适宜夜生活，只要您稍作准备就可以放心外出。\"},\"road_condition\":{\"brief\":\"干燥\",\"details\":\"天气较好，路面比较干燥，路况较好。\"},\"shopping\":{\"brief\":\"较不宜\",\"details\":\"天气炎热，较不适宜逛街，若坚持出门，请避免长时间在阳光下暴晒，注意防暑降温。\"},\"sport\":{\"brief\":\"较不宜\",\"details\":\"天气较好，但炎热，请适当减少运动时间并降低运动强度，户外运动须注意防晒。\"},\"sunscreen\":{\"brief\":\"中等\",\"details\":\"属中等强度紫外辐射天气，外出时应注意防护，建议涂擦SPF指数高于15，PA+的防晒护肤品。\"},\"traffic\":{\"brief\":\"良好\",\"details\":\"天气较好，路面干燥，交通气象条件良好，车辆可以正常行驶。\"},\"travel\":{\"brief\":\"较适宜\",\"details\":\"天气较好，温度较高，天气较热，但有微风相伴，还是比较适宜旅游的，不过外出时要注意防暑防晒哦！\"},\"umbrella\":{\"brief\":\"不带伞\",\"details\":\"天气较好，不会降水，因此您可放心出门，无须带雨伞。\"},\"uv\":{\"brief\":\"中等\",\"details\":\"属中等强度紫外线辐射天气，外出时建议涂擦SPF高于15、PA+的防晒护肤品，戴帽子、太阳镜。\"}},\"last_update\":\"2016-06-22T22:40:23+08:00\"}]}".dataUsingEncoding(NSUTF8StringEncoding)!)
        self.dataDelegate?.doGetWeatherJSON(res)
    }
    
    //future 5 days
    func getDailyAirQuality(delegate : WeatherQueryCallback) {
        self.dataDelegate = delegate
//        Alamofire.request(.GET, dailyAirQualityURL, parameters: thinkPageParameters, encoding: .URL , headers: nil).response{response in
//            let resJSON = JSON(data: response.2!)
//            self.dataDelegate?.doGetWeatherJSON(resJSON)
//        }
        
        let res = JSON(data: "{\"results\":[{\"location\":{\"id\":\"WTW3SJ5ZBJUY\",\"name\":\"上海\",\"country\":\"CN\",\"path\":\"上海,上海,中国\",\"timezone\":\"Asia/Shanghai\",\"timezone_offset\":\"+08:00\"},\"daily\":[{\"date\":\"2016-06-23\",\"text_day\":\"多云\",\"code_day\":\"4\",\"text_night\":\"多云\",\"code_night\":\"4\",\"high\":\"34\",\"low\":\"25\",\"precip\":\"80\",\"wind_direction\":\"南\",\"wind_direction_degree\":\"180\",\"wind_speed\":\"10\",\"wind_scale\":\"2\"},{\"date\":\"2016-06-24\",\"text_day\":\"雷阵雨\",\"code_day\":\"11\",\"text_night\":\"雷阵雨\",\"code_night\":\"11\",\"high\":\"33\",\"low\":\"23\",\"precip\":\"50\",\"wind_direction\":\"西\",\"wind_direction_degree\":\"270\",\"wind_speed\":\"10\",\"wind_scale\":\"2\"},{\"date\":\"2016-06-25\",\"text_day\":\"阵雨\",\"code_day\":\"10\",\"text_night\":\"阴\",\"code_night\":\"9\",\"high\":\"28\",\"low\":\"24\",\"precip\":\"60\",\"wind_direction\":\"南\",\"wind_direction_degree\":\"180\",\"wind_speed\":\"10\",\"wind_scale\":\"2\"},{\"date\":\"2016-06-26\",\"text_day\":\"雷阵雨\",\"code_day\":\"11\",\"text_night\":\"阴\",\"code_night\":\"9\",\"high\":\"28\",\"low\":\"25\",\"precip\":\"90\",\"wind_direction\":\"南\",\"wind_direction_degree\":\"180\",\"wind_speed\":\"10\",\"wind_scale\":\"2\"},{\"date\":\"2016-06-27\",\"text_day\":\"雷阵雨\",\"code_day\":\"11\",\"text_night\":\"雷阵雨\",\"code_night\":\"11\",\"high\":\"30\",\"low\":\"24\",\"precip\":\"90\",\"wind_direction\":\"东南\",\"wind_direction_degree\":\"135\",\"wind_speed\":\"15\",\"wind_scale\":\"3\"},{\"date\":\"2016-06-28\",\"text_day\":\"雷阵雨\",\"code_day\":\"11\",\"text_night\":\"雷阵雨\",\"code_night\":\"11\",\"high\":\"27\",\"low\":\"23\",\"precip\":\"80\",\"wind_direction\":\"东北\",\"wind_direction_degree\":\"45\",\"wind_speed\":\"10\",\"wind_scale\":\"2\"},{\"date\":\"2016-06-29\",\"text_day\":\"小雨\",\"code_day\":\"13\",\"text_night\":\"小雨\",\"code_night\":\"13\",\"high\":\"26\",\"low\":\"23\",\"precip\":\"80\",\"wind_direction\":\"南\",\"wind_direction_degree\":\"180\",\"wind_speed\":\"10\",\"wind_scale\":\"2\"}],\"last_update\":\"2016-06-22T18:00:00+08:00\"}]}".dataUsingEncoding(NSUTF8StringEncoding)!)
        self.dataDelegate?.doGetWeatherJSON(res)
    }
    
    func getSinaWeatherDetail(delegate : WeatherQueryCallback) {
        self.dataDelegate = delegate
        let xmlParser = XMLDictionaryParser()
        
        Alamofire.request(.GET, getEncodedURL(siniaWeatherURL, parameters: ["city":"上海","password":"DJOYnieT8234jlsK","day":"0"], encoding: GB180302000StringEncoding)).response{response in
            var dic = xmlParser.dictionaryWithData(response.2)
            var content = dic["Weather"] as! [String: AnyObject]
            if let tmp = content["chy_shuoming"]{
                content.removeValueForKey("chy_shuoming")
                content["chy_s"] = tmp
            }
            let res = JSON(dictionaryLiteral: ("Weather",content))
            
            self.dataDelegate?.doGetWeatherJSON(res)
        }
    }
    
    func getSinaLifeSuggestion(delegate : WeatherQueryCallback) {
        self.dataDelegate = delegate
    }
    
    func getEncodedURL(baseURL: String, parameters: [String: AnyObject]?, encoding: NSStringEncoding) -> String {
        var url = baseURL
        if let para = parameters {
            var components: [(String, String)] = []
            
            for key in para.keys {
                let value = para[key]!
                components += queryComponents(key, value)
            }
            url = baseURL+"?"+(components.map { "\($0)=\($1)" } as [String]).joinWithSeparator("&")
        }
        return url.stringByAddingPercentEscapesUsingEncoding(encoding)!
    }
    
    func queryComponents(key: String, _ value: AnyObject) -> [(String, String)] {
        var components: [(String, String)] = []
        
        if let dictionary = value as? [String: AnyObject] {
            for (nestedKey, value) in dictionary {
                components += queryComponents("\(key)[\(nestedKey)]", value)
            }
        } else if let array = value as? [AnyObject] {
            for value in array {
                components += queryComponents("\(key)[]", value)
            }
        } else {
            components.append((key, "\(value)"))
        }
        
        return components
    }
}