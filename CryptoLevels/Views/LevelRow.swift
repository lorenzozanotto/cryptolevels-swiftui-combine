//
//  LevelRow.swift
//  CryptoLevels
//
//  Created by Lorenzo Zanotto on 13/10/2019.
//  Copyright © 2019 Lorenzo Zanotto. All rights reserved.
//

import SwiftUI

struct LevelRow: View {
    var viewModel: LevelRowViewModel
    
    init (_ viewModel: LevelRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            HStack {
                if viewModel.completion == .completed {
                    Image("checkbox.completed")
                        .resizable()
                        .frame(width: 20.0, height: 20.0)
                }
                if viewModel.completion == .pending {
                    Image("checkbox.empty")
                        .resizable()
                        .frame(width: 20.0, height: 20.0)
                }
                Text(viewModel.title)
            }
            Spacer()
            HStack {
                Text(viewModel.rightContent)
                    .foregroundColor(.gray)
                if viewModel.displayArrow {
                    Image("arrow.next")
                }
            }
        }
    }
}

struct LevelRow_Previews: PreviewProvider {
    static var previews: some View {
        let preview = LevelRowViewModel(
            title: "Current Level",
            rightContent: "Coiner - 1",
            completion: .completed,
            displayArrow: true
        )
        return LevelRow(preview)
    }
}
