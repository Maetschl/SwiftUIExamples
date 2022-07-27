//
//  GameScene.swift
//  BelugaApp
//
//  Created by Julian Arias Maetschl on 28-09-21.
//

import SpriteKit

class GameScene: SKScene, ObservableObject {

    @Published var isReadyForSale = true
    @Published var cubeColor: SKColor = .red

    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let box = SKSpriteNode(color: cubeColor, size: CGSize(width: 50, height: 50))
        box.position = location
        box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        addChild(box)
        isReadyForSale.toggle()
    }
}
