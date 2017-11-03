//
//  mainMenuScene.swift
//  GameTest
//
//  Created by Anna on 11/2/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import SpriteKit

class mainMenuScene: SKScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in:self);
            if atPoint(location).name == "start" {
                if let scene = GameScene(fileNamed: "GameScene"){
                    scene.scaleMode = .aspectFill
                    view!.presentScene(scene, transition:SKTransition.doorsOpenHorizontal(withDuration: 2));
                }
                
                
            }
        }
        
    }
    
}
