//
//  DailyWeatherCell.swift
//  iOS_Final
//
//  Created by 王泽宇 on 16/6/24.
//  Copyright © 2016年 iOSCourse. All rights reserved.
//

import UIKit

class DailyWeatherCell: UITableViewCell {
    
    @IBOutlet weak var dayImage: UIImageView!
    
    @IBOutlet weak var nightImage: UIImageView!
    @IBOutlet weak var dayTemp: UILabel!
    @IBOutlet weak var dayWeather: UILabel!
    @IBOutlet weak var nightWeather: UILabel!
    @IBOutlet weak var wind: UILabel!
    @IBOutlet weak var rain: UILabel!
    
    @IBOutlet weak var date: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.userInteractionEnabled = false
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
