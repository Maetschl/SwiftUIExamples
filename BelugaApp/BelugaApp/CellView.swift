//
//  CellView.swift
//  BelugaApp
//
//  Created by Julian Arias Maetschl on 28-09-21.
//

import SwiftUI

struct CellView: View {
    let book: String
    var body: some View {
        Text(book)
            .padding()
    }
}



//struct CellView_Previews: PreviewProvider {
//    static var previews: some View {
//        CellView(book: "Some test Book!")
//    }
//}
//

struct Box {
    var id: Int
    let title, imageUrl: String
}

struct ContentView2: View {
    
    var body: some View {
        NavigationView {
            ScrollView(.horizontal) {
                HStack {
                    BoxView()
                    BoxView()
                    BoxView()
                    BoxView()
                    BoxView()
                    BoxView()
                }

            }
        }.navigationBarTitle(Text("Books"))
    }
}

struct BoxView: View {
    
    var body: some View{
        VStack{
            Image("0")
                .resizable()
                .frame(width: 125, height: 170)
            Text("Good Stuff")
                .font(.subheadline)
                .fontWeight(.bold)
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
