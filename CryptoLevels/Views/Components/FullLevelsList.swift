//
//  FullLevelsList.swift
//  CryptoLevels
//
//  Created by Lorenzo Zanotto on 15/10/2019.
//  Copyright © 2019 Lorenzo Zanotto. All rights reserved.
//

import SwiftUI

struct FullLevelsList: View {
    private let list: LevelsList
    
    init(_ list: LevelsList) {
        self.list = list
    }
    
    var body: some View {
        List {
            ForEach(list.levels, id: \.title) { level in
                Section(
                    header: Text("LEVEL \(level.number) - \(level.title.uppercased())").padding(.top),
                    footer: Text("\(level.reward)")) {
                    ForEach(level.tasks, id: \.title) { task in
                        LevelRow(
                            LevelRowViewModel(
                                title: task.title,
                                rightContent: "",
                                completion: task.completed ? .completed : .pending
                            )
                        )
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
}
