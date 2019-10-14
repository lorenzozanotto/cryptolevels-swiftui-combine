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
            StatefulContent(loading: store.loading, whenLoaded: {
                LevelList(self.store.level)
            }, whenLoading: {
                PulseLoader()
            })
            .navigationBarTitle("", displayMode: .inline)
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
