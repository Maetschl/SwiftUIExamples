//
//  ContentView.swift
//  ListExample
//
//  Created by Julian Arias Maetschl on 30-05-22.
//

import SwiftUI

struct ContentView: View {
@State var text: String = ""
@State var title: String = ""
var body: some View {
    VStack{
        TextField("Titulo...", text: $title)
        Divider()
        TextEditor(text: $text)
            .border(Color.orange, width: 2)
    }
    .padding()
}
}


//        NavigationView {
//            List {
//                ForEach(1...100, id: \.self) {
//                    Text("\($0) …")
//                }
//            }
//            .navigationTitle("List!")
//        }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
