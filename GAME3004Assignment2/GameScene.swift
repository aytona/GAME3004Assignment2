//
//  GameScene.swift
//  GAME3004Assignment2
//
//  Created by Christopher Aytona on 2017-03-06.
//  Copyright © 2017 Christopher Aytona. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var player1 = SKSpriteNode()
    var player1Label = SKLabelNode()
    var player2 = SKSpriteNode()
    var player2Label = SKLabelNode()
    var ball = SKSpriteNode()
    var score = [Int]()
    
    func start() {
        score = [0, 0]
        
        player1Label.text = "\(score[0])"
        player2Label.text = "\(score[1])"
        
        ball.physicsBody?.applyImpulse(CGVector(dx: -5, dy: -5))
    }
    
    override func didMove(to view: SKView) {
        player1Label = self.childNode(withName: "player1Label") as! SKLabelNode
        player2Label = self.childNode(withName: "player2Label") as! SKLabelNode
        
        player1 = self.childNode(withName: "player1") as! SKSpriteNode
        player1.position.y = (-self.frame.height / 2) + 50
        player2 = self.childNode(withName: "player2") as! SKSpriteNode
        player2.position.y = (self.frame.height / 2) - 50
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
        
        start()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if currentType == .player2 {
                if location.y > 0 {
                    player2.run(SKAction.moveTo(x: location.x, duration: 0.1))
                }
                if location.y < 0 {
                    player1.run(SKAction.moveTo(x: location.x, duration: 0.1))
                }
            } else {
                player1.run(SKAction.moveTo(x: location.x, duration: 0.1))
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if currentType == .player2 {
                if location.y > 0 {
                    player2.run(SKAction.moveTo(x: location.x, duration: 0.1))
                }
                if location.y < 0 {
                    player1.run(SKAction.moveTo(x: location.x, duration: 0.1))
                }
            } else {
                player1.run(SKAction.moveTo(x: location.x, duration: 0.1))
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        switch currentType {
        case .player1:
            player2.run(SKAction.moveTo(x: ball.position.x, duration: 0.25))
            break
        case .player2:
            
            break
        }
        
        if ball.position.y <= player1.position.y - 30 {
            addScore(player: player1)
        } else if ball.position.y >= player2.position.y + 30 {
            addScore(player: player2)
        }
    }
    
    func addScore(player : SKSpriteNode) {
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        if player == player1 {
            score[0] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: 5, dy: 5))
        } else if player == player2 {
            score[1] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: -5, dy: -5))
        }
        
        player1Label.text = "\(score[0])"
        player2Label.text = "\(score[1])"
    }
}
