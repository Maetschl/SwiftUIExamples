//
//  ContentView.swift
//  CoreDataSwitUI
//
//  Created by Julian Arias Maetschl on 17-06-20.
//  Copyright © 2020 Maetschl. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: User.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \User.name, ascending: true)],
                  predicate: nil)
    var users: FetchedResults<User>

    var body: some View {
        NavigationView {
            Group {
                if !users.isEmpty {
                    List {
                        ForEach(users, id: \.name) { user in
                            VStack {
                                Text(user.wrappedName)
                            }
                        }
                    }
                } else {
                    Image(systemName: "tray.and.arrow.down.fill")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .foregroundColor(.purple)
                }
            }.navigationBarItems(trailing:
                Group {
                    Button(action: { self.newUser() }, label: { Text("Add") } )
                    Button(action: { self.removeAllUsers() }, label: { Text("Remove all") } )
                }
            )
        }
    }

    func newUser() {
        let newUser = User(context: moc)
        newUser.id = UUID()
        newUser.image = Data()
        newUser.name = "Test User"

        do {
            try self.moc.save()
        } catch {
            print(error)
        }
    }

    func removeAllUsers() {
        print("")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
