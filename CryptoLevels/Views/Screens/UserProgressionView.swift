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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            
            // The StatefulContent is a view managed by a ContentState
            // which is obtained combining the right data from the Store.
            //
            // This approach has the benefit of adapting the UI with a
            // reactive state management provided by an Orchestrator
            // that updates the Store using Combine.
            //
            // This component is capable of handling
            //
            // - Correctly loaded content
            // - Loading state
            // - Empty data
            // - Error message
            //
            StatefulContent(state: store.mapLevelState(), whenLoaded: {
                LevelList(self.store.level)
            }, whenLoading: {
                PulseLoader(self.store.loading)
            }, onEmptyData: {
                Text("No data to fetch. Try again later.")
            }, onError: { error in
                TryAgain(error: error, action: self.fetchLevel)
            })
                
            // Configuring the navigation bar
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Done").foregroundColor(Color.white)
            })
        }
            
        // The fetchLevel action is dispatched at every appear
        .onAppear(perform: fetchLevel)
    }
    
    func fetchLevel() {
        store.orchestrator.fetchCurrentLevel()
    }
}

struct UserProgressionView_Previews: PreviewProvider {
    @EnvironmentObject var store: Store
    
    static var previews: some View {
        UserProgressionView().environmentObject(Store())
    }
}
