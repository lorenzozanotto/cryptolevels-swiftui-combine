//
//  LevelsView.swift
//  CryptoLevels
//
//  Created by Lorenzo Zanotto on 15/10/2019.
//  Copyright © 2019 Lorenzo Zanotto. All rights reserved.
//

import Foundation
import SwiftUI

struct LevelsView: View {
    @EnvironmentObject var store: Store
    
    var body: some View {
        
        // It's very easy to handle states with the StatefulContent.
        //
        // Here we just use it again, mapping another type of state
        // (the all levels list) and displaying a different type of
        // view when the content has been loaded successfully.
        //
        StatefulContent(state: store.mapLevelListState(), whenLoaded: {
            FullLevelsList(self.store.levelsList)
        }, whenLoading: {
            PulseLoader(self.store.loading)
        }, onEmptyData: {
            Text("No data to fetch. Try again later.")
        }, onError: { error in
            
            // Retry mechanism again.
            TryAgain(error: error, action: self.fetchAllLevels)
        })
            
        // Configuring the navigation bar
        .navigationBarTitle("Levels")
        .onAppear(perform: fetchAllLevels)
    }
    
    func fetchAllLevels() {
        store.orchestrator.fetchAllLevels()
    }
}

struct LevelsView_Previews: PreviewProvider {
    @EnvironmentObject var store: Store
    
    static var previews: some View {
        LevelsView().environmentObject(Store())
    }
}
