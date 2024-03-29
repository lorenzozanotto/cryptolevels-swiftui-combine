//
//  PulseLoader.swift
//  CryptoLevels
//
//  Created by Lorenzo Zanotto on 14/10/2019.
//  Copyright © 2019 Lorenzo Zanotto. All rights reserved.
//

import SwiftUI

struct PulseLoader: View {
    @State var pulsate = false
    private let loading: Bool
    
    init(_ loading: Bool) {
        self.loading = loading
    }
    
    var body: some View {
        VStack {
            if loading {
                Image(systemName: "circle")
                    .scaleEffect(self.pulsate ? 3 : 0)
                    .opacity(self.pulsate ? 0 : 1 )
                    .animation(Animation.easeInOut(duration: 2)
                        .repeatForever(autoreverses: false))
                    .onAppear {
                        self.pulsate.toggle()
                }
            }
            
        }
    }
}

struct PulseLoader_Previews: PreviewProvider {
    static var previews: some View {
        PulseLoader(true)
    }
}
