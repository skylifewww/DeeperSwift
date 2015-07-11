//
//  PlayScene.swift
//  DeeperSwift
//
//  Created by Vladimir Nybozhinsky on 10.07.15.
//  Copyright (c) 2015 Vladimir Nybozhinsky. All rights reserved.
//

import SpriteKit

class PlayScene: SKScene {
    
    let upButton = SKSpriteNode(imageNamed: "up")
    let downButton = SKSpriteNode(imageNamed: "down")
    let leftButton = SKSpriteNode(imageNamed: "left")
    let rightButton = SKSpriteNode(imageNamed: "right")
    
    var ship:SKSpriteNode = SKSpriteNode()
    var deeper:SKSpriteNode = SKSpriteNode()
    var back = SKSpriteNode()
    var front = SKSpriteNode()
    
    
    override func didMoveToView(view: SKView) {
        
        //MARK: - Buttons
        
        upButton.position = CGPointMake(CGRectGetMaxX(self.frame) - CGRectGetWidth(upButton.frame) * 1.5, CGRectGetMinY(self.frame) + CGRectGetHeight(upButton.frame) * 2)
        upButton.setScale(0.8)
        upButton.zPosition = 25
        
        self.addChild(upButton)
        
        downButton.position = CGPointMake(CGRectGetMaxX(self.frame) - CGRectGetWidth(downButton.frame) * 1.5, CGRectGetMinY(self.frame) + CGRectGetHeight(downButton.frame))
        downButton.setScale(0.8)
        downButton.zPosition = 25
        
        self.addChild(downButton)
        
        leftButton.position = CGPointMake(CGRectGetMaxX(self.frame) - CGRectGetWidth(leftButton.frame) * 2.14, CGRectGetMinY(self.frame) + CGRectGetHeight(leftButton.frame) * 1.5)
        leftButton.setScale(0.8)
        leftButton.zPosition = 25
        
        self.addChild(leftButton)
        
        rightButton.position = CGPointMake(CGRectGetMaxX(self.frame) - CGRectGetWidth(rightButton.frame) * 0.88, CGRectGetMinY(self.frame) + CGRectGetHeight(rightButton.frame) * 1.5)
        rightButton.setScale(0.8)
        rightButton.zPosition = 25
        
        self.addChild(rightButton)

        
        //MARK: - Phisics
        
        self.physicsWorld.gravity = CGVectorMake(0.0, 0.0)
        
        //MARK: - Ship
        
        var shipTexture = SKTexture(imageNamed: "ship")
        shipTexture.filteringMode = SKTextureFilteringMode.Nearest
        
        ship  = SKSpriteNode(texture: shipTexture)
        ship.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) * 1.43)
        ship.zPosition = -5
        ship.setScale(0.6)
        
        ship.physicsBody = SKPhysicsBody(circleOfRadius: CGRectGetHeight(ship.frame) / 2.5)
        ship.physicsBody?.dynamic = true
        ship.physicsBody?.allowsRotation = false
        
        self.addChild(ship)
        
        //MARK: - Deeper
        
        var deeperTexture = SKTexture(imageNamed: "deeper")
        deeperTexture.filteringMode = SKTextureFilteringMode.Nearest
        
        deeper  = SKSpriteNode(texture: deeperTexture)
        deeper.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
//        deeper.zPosition = 10
        deeper.setScale(0.5)
        
        deeper.physicsBody = SKPhysicsBody(circleOfRadius: CGRectGetHeight(deeper.frame) / 2.5)
        deeper.physicsBody?.dynamic = true
        deeper.physicsBody?.allowsRotation = false
       
        self.addChild(deeper)

        
        
        //MARK: - back
        
        var backTexture = SKTexture(imageNamed: "back")
        back = SKSpriteNode(texture: backTexture)
        back.setScale(1.0)
        back.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        back.zPosition = -20
        
        self.addChild(back)
        
        var frontTexture = SKTexture(imageNamed: "front")
        front = SKSpriteNode(texture: frontTexture)
        front.setScale(1.0)
        front.position = CGPointMake(CGRectGetMidX(self.frame),
            CGRectGetMidY(self.frame))
        front.zPosition = 20
        
        self.addChild(front)
    }
    
    //MARK: - Touches
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            if self.nodeAtPoint(location) == upButton {
                var currentPosition = deeper.position
                
                deeper.physicsBody?.velocity = CGVectorMake(0, 0)
                deeper.physicsBody?.applyImpulse(CGVectorMake(0, 2))
                let actionDeeper = SKAction.rotateByAngle(CGFloat(M_1_PI),
                    duration: 1)
                let reActionDeeper = SKAction.rotateByAngle(CGFloat(M_1_PI) * -1,
                    duration: 0.5)
                deeper.runAction(actionDeeper, completion: { () -> Void in
                    var newPosition = CGPointMake(CGRectGetMidX(self.deeper.frame), CGRectGetMidY(self.deeper.frame))
                    self.deeper.runAction(reActionDeeper)
                    self.deeper.position = newPosition
                    println("Hello!!!")
                })
            }
            
            if self.nodeAtPoint(location) == downButton {
                
                deeper.physicsBody?.velocity = CGVectorMake(0, 0)
                deeper.physicsBody?.applyImpulse(CGVectorMake(0, -2))
                let actionDeeper = SKAction.rotateByAngle(CGFloat(M_1_PI),
                    duration: 0.5)
                let reActionDeeper = SKAction.rotateByAngle(CGFloat(M_1_PI) * -1,
                    duration: 1)
                deeper.runAction(reActionDeeper, completion: { () -> Void in
                    var newPosition = CGPointMake(CGRectGetMidX(self.deeper.frame), CGRectGetMidY(self.deeper.frame))
                    self.deeper.runAction(actionDeeper)
                    self.deeper.position = newPosition
                })
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }

}
