//
//  TopMenuView.swift
//  BelugaApp
//
//  Created by Julian Arias Maetschl on 28-09-21.
//

import SwiftUI
import SpriteKit

struct TopMenuView: View {
    @Binding var isPresented: Bool
    @Binding var cubeColors: SKColor

    var body: some View {
        VStack {
            Group {
                ZStack {
                    Rectangle().foregroundColor(.white)
                    buttons
                }
            }
            .frame(height: UIScreen.main.bounds.height/6)
            .cornerRadius(20.0)
            .ignoresSafeArea()
            Spacer()
        }
    }

    var buttons: some View {
        HStack(alignment: .bottom) {
            Button(action: {

            }, label: {
                Image(systemName: "person.crop.circle")
                Text("Profile")
            })
            divider
            Button(action: {

            }, label: {
                Image(systemName: "bag.circle")
                Text("Map")
            })
            divider
            Button(action: {

            }, label: {
                Image(systemName: "map")
                Text("Inventory")
            })
            divider
            Button(action: {
                cubeColors = [SKColor.green, SKColor.red, SKColor.blue].randomElement()!
                isPresented = false
            }, label: {
                Image(systemName: "chevron.up.circle")
                Text("Close")
            })
            Spacer().frame(width: 0, height: 64)
        }
        .accentColor(.primary)
    }

    var divider: some View {
        Divider().frame(height: 32)
    }
}
