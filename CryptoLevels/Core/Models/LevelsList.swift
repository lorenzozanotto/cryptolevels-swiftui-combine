//
//  LevelsList.swift
//  CryptoLevels
//
//  Created by Lorenzo Zanotto on 15/10/2019.
//  Copyright © 2019 Lorenzo Zanotto. All rights reserved.
//

import Foundation

struct LevelsList: JSONDecodable {
    let levels: [Level]
    
    static var empty: LevelsList {
        return LevelsList(levels: [])
    }
    
    init(levels: [Level]) {
        self.levels = levels
    }
    
    init(json: JSON) {
        self.levels = json.arrayValue.map { jsonLevel in
            let number = jsonLevel["level"]["level"].intValue
            let title = jsonLevel["level"]["title"].stringValue
            let reward = jsonLevel["level"]["reward"].stringValue
            
            let tasks: [Task] = jsonLevel["tasks"].arrayValue.map { jsonTask in
                let title = jsonTask["task"]["title"].stringValue
                let completed = jsonTask["status"].stringValue == "completed"
                return Task(title: title, completed: completed)
            }
            
            return Level(title: title, number: number, reward: reward, tasks: tasks)
        }
    }
}
