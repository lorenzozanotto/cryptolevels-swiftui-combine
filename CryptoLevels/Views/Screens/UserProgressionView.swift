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
                LevelProgressList(self.store.level)
            }, whenLoading: {
                PulseLoader(self.store.loading)
            }, onEmptyData: {
                Text("No data to fetch. Try again later.")
            }, onError: { error in
                
                // The fetchCurrentLevel queries the Orchestrator that
                // will update the Store, so it will render this view
                // again when the data gets fetched. Or not.
                //
                // Retry mechanism is as easy as that
                //
                TryAgain(error: error, action: self.fetchCurrentLevel)
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
