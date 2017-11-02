//
//  GameScene.swift
//  newGame
//
//  Created by Estefania  Yepez on 11/2/17.
//  Copyright © 2017 Estefania  Yepez. All rights reserved.
//

import SpriteKit


class GameScene: SKScene {
//    here we declared a private constant for the player the ninja which is an example of a sprite, we simply passed the name of the image we are using
    let player = SKSpriteNode(imageNamed: "player")
    override func didMove(to view: SKView) {
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(addMonster),SKAction.wait(forDuration:1.0)])))
        

        backgroundColor = SKColor.white
//        here the position of the sprite to be 10 % across vertically and centered horizontally 
//      to make the sprite appear on the scene you must add it as a child of the scene
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.05)
        addChild(player)
    }
    func random() -> CGFloat{
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    func random(min: CGFloat, max: CGFloat) -> CGFloat{
        return random() * (max - min) + min
    }
    func addMonster(){
//        here we create a sprite again with the name of the image
        let monster = SKSpriteNode(imageNamed: "monster")
//        determine where to spawn the monster along the Y axis 
        let actualY =  random(min: monster.size.height/2, max: size.height - monster.size.height/2)
//        postiton the monster slightly off screen along the right edge, and along a random position along the Y axis as calculated above
        monster.position = CGPoint(x: size.width + monster.size.width/2, y:actualY)
//        add the monster to the scece by adding it as a child 
        addChild(monster)
//        determine the speed of the monster
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
//        create the actions
        let actionMove = SKAction.move(to: CGPoint(x: -monster.size.width/2, y:actualY), duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        monster.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
   
            
    
        
    }
    


