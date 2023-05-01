//
//  KOKO_CloneApp.swift
//  KOKO_Clone
//
//  Created by Ben Stark on 2023/4/30.
//

import SwiftUI

@main
struct KOKO_CloneApp: App {
    @StateObject var kokoVM: KOKOViewModel = KOKOViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(kokoVM)
        }
    }
}
