//
//  ContentView.swift
//  TestAppSwiftUI
//
//  Created by Julian Arias Maetschl on 24-05-22.
//

import SwiftUI

struct ContentView: View {
    let some = "Some"
    var numeroDeLista:Int = 1
    var body: some View {

        VStack{
            Text("Hola Usuario")
                .font(.system(size: 40.0))
                .padding(.bottom, 7)
                .padding(.top, 100)
            Spacer()

            ZStack {
                Text("")
                    .frame(width: 400, height: 650)
                    .background(Color("Gris-Claro"))
                    .padding(.bottom)

                Text("Listas")
                    .font(.system(size: 40))
                Spacer()
            }
        }
    }
}

struct ContentView2: View {
    var body: some View {
        Text("Hello, world!")
            .font(.system(size: 90.0))
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
