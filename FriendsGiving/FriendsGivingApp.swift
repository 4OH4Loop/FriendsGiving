//
//  FriendsGivingApp.swift
//  FriendsGiving
//
//  Created by Carolyn Ballinger on 3/24/25.
//

import SwiftUI
import SwiftData

@main
struct FriendsGivingApp: App {
    var body: some Scene {
        WindowGroup {
            GuestListView()
                .modelContainer(for: Guest.self)
        }
    }
    // Will allow us to find where our simulator data is saved:
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
