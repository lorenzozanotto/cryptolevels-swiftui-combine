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

struct StatefulContent<T, Content: View, LoadingContent: View, ErrorContent: View, EmptyContent: View>: View {
    
    private var state: ContentState<T>
    private let viewBuilder: () -> Content
    private var loadingBuilder: () -> LoadingContent
    private let emptyBuilder: () -> EmptyContent
    private let errorBuilder: (NetworkError) -> ErrorContent
    
    init(
        state: ContentState<T>,
        @ViewBuilder whenLoaded: @escaping () -> Content,
        @ViewBuilder whenLoading: @escaping () -> LoadingContent,
        @ViewBuilder onEmptyData: @escaping () -> EmptyContent,
        @ViewBuilder onError: @escaping (NetworkError) -> ErrorContent
    ) {
        self.state = state
        self.viewBuilder = whenLoaded
        self.loadingBuilder = whenLoading
        self.emptyBuilder = onEmptyData
        self.errorBuilder = onError
    }

    var body: some View {
        VStack {
            if state.loading && state.error == nil {
                loadingBuilder()
            } else if state.error != nil {
                errorBuilder(state.error ?? NetworkError.errorFetchingData)
            } else if state.emptyData && state.error == nil {
                emptyBuilder()
            } else {
                viewBuilder()
            }
        }
    }
}
