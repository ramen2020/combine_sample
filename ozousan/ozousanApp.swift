//
//  ozousanApp.swift
//  ozousan
//
//  Created by 宮本光直 on 2021/06/18.
//

import SwiftUI
import PartialSheet


@main
struct ozousanApp: App {
    
    let sheetManager: PartialSheetManager = PartialSheetManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sheetManager)
        }
    }
}
