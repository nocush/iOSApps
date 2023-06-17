//
//  Lab11App.swift
//  Lab11
//
//  Created by Mateusz Bartoszek on 23/05/2023.
//

import SwiftUI

@main
struct Lab11App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
