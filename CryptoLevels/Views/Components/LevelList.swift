//
//  LevelList.swift
//  CryptoLevels
//
//  Created by Lorenzo Zanotto on 14/10/2019.
//  Copyright © 2019 Lorenzo Zanotto. All rights reserved.
//

import SwiftUI

struct LevelList: View {
    private let level: CurrentLevel
    
    init(_ level: CurrentLevel) {
        self.level = level
    }
    
    var body: some View {
        List {
            NavigationLink(destination: WelcomeView()) {
                LevelRow(LevelRowViewModel(
                    title: "Current Level",
                    rightContent: "\(level.name) - \(level.number)",
                    completion: .notCompletable
                ))
            }
            
            Section(header: Text("NEXT LEVEL"), footer: Text("Reward: \(level.reward)")) {
                ForEach(level.tasks, id: \.title) { task in
                    LevelRow(LevelRowViewModel(
                        title: task.title,
                        rightContent: "",
                        completion: task.completed ? .completed : .pending)
                    )
                }
            }
            
            Section(header: Text("REFERRALS"), footer: Text("For each friend you invite both will receive 0.1 BNB")) {
                LevelRow(LevelRowViewModel(
                    title: "Friends Invited",
                    rightContent: "\(level.invitedFriends)",
                    completion: .notCompletable)
                )
            }
        }
        .listStyle(GroupedListStyle())
    }
}
