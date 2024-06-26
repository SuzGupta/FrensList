//
//  FrensListApp.swift
//  FrensList
//
//  Created by Susannah Skyer Gupta on 3/29/24.
//

import SwiftData
import SwiftUI

@main
struct FrensListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: FrenModel.self)
    }
}
