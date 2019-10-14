//
//  TryAgain.swift
//  CryptoLevels
//
//  Created by Lorenzo Zanotto on 15/10/2019.
//  Copyright © 2019 Lorenzo Zanotto. All rights reserved.
//

import SwiftUI

struct TryAgain: View {
    var error: NetworkError
    var action: () -> Void
    
    init (error: NetworkError, action: @escaping () -> Void) {
        self.error = error
        self.action = action
    }
    
    var body: some View {
        VStack {
            Text(error.localizedDescription)
            Button(action: action) {
                Text("Try again")
            }
        }
    }
}
