//
//  GameScene.swift
//  DeeperSwift
//
//  Created by Vladimir Nybozhinsky on 10.07.15.
//  Copyright (c) 2015 Vladimir Nybozhinsky. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let playButton = SKSpriteNode(imageNamed: "play")
    
    override func didMoveToView(view: SKView) {
        
        playButton.position = CGPointMake(CGRectGetMidX(self.frame),
            CGRectGetMidY(self.frame))
        playButton.setScale(0.5)
        
        self.addChild(playButton)
        self.backgroundColor = UIColor.greenColor()
        
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            if  self.nodeAtPoint(location) == playButton {
                
                var scene = PlayScene(size: self.size)
                let skView = self.view as SKView!
                skView.ignoresSiblingOrder = true
                scene.scaleMode = SKSceneScaleMode.ResizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
            }
            
            
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}

