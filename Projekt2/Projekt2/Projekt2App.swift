//
//  Projekt2App.swift
//  Projekt2
//
//  Created by Mateusz Bartoszek on 13/06/2023.
//

import SwiftUI

@main
struct Projekt2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
