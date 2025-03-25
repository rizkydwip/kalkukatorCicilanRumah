//
//  kalkukatorCicilanRumahApp.swift
//  kalkukatorCicilanRumah
//
//  Created by Rizkydwiputra on 17/03/25.
//

import SwiftUI

@main
struct kalkukatorCicilanRumahApp: App {
    @StateObject private var model=ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView() .environmentObject(ViewModel())
        }
    }
}
