//
//  GuestListView.swift
//  FriendsGiving
//
//  Created by Carolyn Ballinger on 3/24/25.
//

import SwiftUI
import SwiftData

struct GuestListView: View {
    @Query var guests: [Guest]
    @State private var sheetIsPresented = false
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(guests) {guest in
                    NavigationLink {
                        GuestDetailView(guest: guest)
                    } label: {
                        Text(guest.name)
                            .font(.title)
                    }
                    .swipeActions {
                        Button("Delete", role: .destructive) {
                            modelContext.delete(guest)
                            guard let _ = try? modelContext.save() else {
                                print("😡 ERROR: Save after .delete did not work.")
                                return
                            }
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle(Text("Friends:"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    GuestDetailView(guest: Guest())
                }
                
            }
        }

    }
}

#Preview {
    GuestListView()
        .modelContainer(Guest.preview)
}
