//
//  UserProgressionView.swift
//  CryptoLevels
//
//  Created by Lorenzo Zanotto on 13/10/2019.
//  Copyright © 2019 Lorenzo Zanotto. All rights reserved.
//

import SwiftUI

struct UserProgressionView: View {
    
    @EnvironmentObject var store: Store
    
    var body: some View {
        NavigationView {
            List {
                LevelRow(LevelRowViewModel(
                    title: store.name,
                    rightContent: "Coiner - 1",
                    completion: .completed,
                    displayArrow: true
                ))
                
                Section(header: Text("Next Level"), footer: Text("Reward")) {
                    Text("Tap me")
                    Text("Tap me")
                    Text("Tap me")
                }
                
                Section(header: Text("Referrals"), footer: Text("For each friend")) {
                    Text("Tap me")
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .listStyle(GroupedListStyle())
        }
        .onAppear(perform: fetchCurrentLevel)
    }
    
    func fetchCurrentLevel() {
        store.orchestrator.fetchCurrentLevel()
    }
}

struct UserProgressionView_Previews: PreviewProvider {
    @EnvironmentObject var store: Store
    
    static var previews: some View {
        UserProgressionView().environmentObject(Store())
    }
}
