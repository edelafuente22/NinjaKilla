//
//  VictoryScene.swift
//  GameTest
//
//  Created by Anna on 11/3/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//


import SpriteKit

class VictoryScene: SKScene {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in:self);
            if atPoint(location).name == "Congrats" {
                if let scene = mainMenuScene(fileNamed: "MainMenu"){
                    scene.scaleMode = .aspectFill
                    view!.presentScene(scene, transition:SKTransition.doorsOpenHorizontal(withDuration: 2));
                }
                
                
            }
        }
        
    }
    
}
