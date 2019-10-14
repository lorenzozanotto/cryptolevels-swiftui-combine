//
//  Store.swift
//  CryptoLevels
//
//  Created by Lorenzo Zanotto on 15/10/2019.
//  Copyright © 2019 Lorenzo Zanotto. All rights reserved.
//

import Foundation

extension Store {
    func mapLevelState() -> ContentState<CurrentLevel> {
        return ContentState(
            loading: self.loading,
            data: self.level,
            emptyData: self.level.name.isEmpty,
            error: self.error
        )
    }
}
