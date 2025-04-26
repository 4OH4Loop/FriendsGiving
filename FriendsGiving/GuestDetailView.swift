//
//  GuestDetailView.swift
//  FriendsGiving
//
//  Created by Carolyn Ballinger on 3/31/25.
//

import SwiftUI
import SwiftData

struct GuestDetailView: View {
    @State var guest: Guest
    @State private var name = ""
    @State private var item = ""
    @State private var notes = ""
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack (alignment: .leading) {
            TextField("name", text: $name)
                .textFieldStyle(.roundedBorder)
                .font(.title)
                .padding(.bottom)
            
            Text("is bringing:")
                .bold()
            
            TextField("bringing item", text: $item)
                .textFieldStyle(.roundedBorder)
            
            Text("notes:")
                .bold()
            
            TextField("notes", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
            
            Spacer()
            
        }
        .padding(.horizontal)
        .onAppear {
            name = guest.name
            item = guest.item
            notes = guest.notes
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    guest.name = name
                    guest.item = item
                    guest.notes = notes
                    modelContext.insert(guest)
                    guard let _ = try? modelContext.save() else {
                        print("😡 ERROR: Save on GuestDetailView did not work.")
                        return
                    }
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        GuestDetailView(guest: Guest(name: "Lady Gaga", item: "Pokerface Punch", notes: "Ask her to sing!"))
            .modelContainer(for: Guest.self, inMemory: true)
    }
}
