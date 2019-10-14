//
//  CurrentLevel.swift
//  CryptoLevels
//
//  Created by Lorenzo Zanotto on 13/10/2019.
//  Copyright © 2019 Lorenzo Zanotto. All rights reserved.
//

import Foundation

struct CurrentLevel: JSONDecodable {
    
    let name: String
    let number: Int
    let reward: String
    let invitedFriends: Int
    let tasks: [LevelTask]
    
    public init(name: String, number: Int, reward: String, invitedFriends: Int, tasks: [LevelTask]) {
        self.name = name
        self.number = number
        self.reward = reward
        self.invitedFriends = invitedFriends
        self.tasks = tasks
    }
    
    static var empty: CurrentLevel {
        return CurrentLevel(name: "", number: 0, reward: "", invitedFriends: 0, tasks: [])
    }
    
    init(json: JSON) {
        self.name = json["level"]["level"]["title"].stringValue
        self.number = json["level"]["level"]["level"].intValue
        self.reward = json["level"]["level"]["reward"].stringValue
        self.invitedFriends = json["status"]["number_of_invitees"].intValue
        
        let jsonTasks: Array<JSON> = json["level"]["tasks"].arrayValue
        var parsedTasks = [LevelTask]()
        
        for jsonTask in jsonTasks {
            let title = jsonTask["task"]["title"].stringValue
            let completed = jsonTask["status"].stringValue.count > 0
            
            parsedTasks.append(LevelTask(
                title: title,
                completed: completed
            ))
        }
        
        self.tasks = parsedTasks
    }
}
