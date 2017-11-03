//
//  GameOver.swift
//  GameTest
//
//  Created by Vlad on 11/2/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import Foundation

import SpriteKit

class GameOver: SKScene {
    
    override func didMove(to view: SKView) {
        print("got here")
    }

    
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
    for touch in touches {
        let location=touch.location(in:self);
        if atPoint(location).name == "playagain"{
            if let scene = SKScene(fileNamed: "GameScene"){
                scene.scaleMode = .aspectFill
                view!.presentScene(scene, transition:SKTransition.doorsOpenHorizontal(withDuration: 2));
            }
        }
    }
}
}
