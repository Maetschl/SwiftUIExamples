//
//  ContentView.swift
//  MementoExample
//
//  Created by Julian Arias Maetschl on 20-04-21.
//

import SwiftUI

extension Commands {
    static let
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Memento example, try to use")
            Text("Cmd + Z")
        }
        .frame(width: 800, height: 600)
        .onCommand(Selector(, perform: {
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
