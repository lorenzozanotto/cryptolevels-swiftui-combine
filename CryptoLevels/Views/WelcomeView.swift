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
    
    var body: some View {
        VStack {
            Text("Welcome to CryptoLevels!")
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
