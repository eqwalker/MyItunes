//
//  MyiTunesApp.swift
//  MyiTunes
//
//  Created by Eric Walker on 2/21/21.
//

import SwiftUI

@main
struct MyiTunesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
