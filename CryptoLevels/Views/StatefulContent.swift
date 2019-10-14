//
//  CustomJab.swift
//  CryptoLevels
//
//  Created by Lorenzo Zanotto on 14/10/2019.
//  Copyright © 2019 Lorenzo Zanotto. All rights reserved.
//

import SwiftUI
import Foundation
import UIKit

// swiftlint:disable all
struct StatefulContent<Content: View, LoadingContent: View>: View {
    
    private var loading = false
    private let viewBuilder: () -> Content
    private let loadingBuilder: () -> LoadingContent
    
    init(
        loading: Bool,
        @ViewBuilder whenLoaded: @escaping () -> Content,
        @ViewBuilder whenLoading: @escaping () -> LoadingContent
    ) {
        self.loading = loading
        self.viewBuilder = whenLoaded
        self.loadingBuilder = whenLoading
    }

    var body: some View {
        VStack {
            if loading {
                loadingBuilder()
            } else {
                viewBuilder()
            }
        }
    }
}
