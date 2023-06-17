//
//  ProjektApp.swift
//  Projekt
//
//  Created by Mateusz Bartoszek on 13/06/2023.
//

import SwiftUI

@main
struct ProjektApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
