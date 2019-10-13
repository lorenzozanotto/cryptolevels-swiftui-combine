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
                Text("List item")
            }
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct UserProgressionView_Previews: PreviewProvider {
    @EnvironmentObject var store: Store
    
    static var previews: some View {
        UserProgressionView().environmentObject(Store())
    }
}
