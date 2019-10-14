//
//  ContentView.swift
//  CryptoLevels
//
//  Created by Lorenzo Zanotto on 13/10/2019.
//  Copyright © 2019 Lorenzo Zanotto. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    
    @EnvironmentObject var store: Store
    @State private var showModal: Bool = false
    
    var body: some View {
        VStack {
            Text("Welcome to CryptoLevels")
                .font(.title)
                .bold()
                .padding()
            
            Button(action: {
                self.showModal = true
            }) {
                Text("Check my progressions").bold()
            }.sheet(isPresented: self.$showModal) {
                UserProgressionView().environmentObject(self.store)
            }
            .padding(EdgeInsets(top: 14, leading: 32, bottom: 14, trailing: 32))
            .background(Color.init(.trustWalletAccent))
            .foregroundColor(.white)
            .cornerRadius(5)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    @EnvironmentObject var store: Store
    
    static var previews: some View {
        WelcomeView().environmentObject(Store())
    }
}
