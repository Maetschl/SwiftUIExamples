//
//  ContentView.swift
//  BelugaApp
//
//  Created by Julian Arias Maetschl on 28-09-21.
//

import SwiftUI
import SpriteKit

struct ContentView: View {

    @ObservedObject var scene: GameScene = {
        let scene = GameScene()
        scene.size = UIScreen.main.bounds.size
        scene.scaleMode = .fill
        return scene
    }()

    var body: some View {
        ZStack {
            SpriteView(scene: scene)
                .ignoresSafeArea()
            if scene.isReadyForSale {
                TopMenuView(isPresented: $scene.isReadyForSale, cubeColors: $scene.cubeColor)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
