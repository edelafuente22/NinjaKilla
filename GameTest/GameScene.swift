//
//  GameScene.swift
//  GameTest
//
//  Created by Anna on 11/2/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    let manager = CMMotionManager()
    var livesleft = 5
    var myLives: SKLabelNode = SKLabelNode(fontNamed: "Arial")

    
    var player = SKSpriteNode(imageNamed: "player")
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        myLives.text = "Lives: 5"
        myLives.fontSize = 30
        myLives.zPosition = 1.0
        myLives.position = CGPoint(x: (-(self.scene?.size.width)!/2)+60   ,y: ((self.scene?.size.height)!/2)-50)
        self.addChild(myLives)
        
        let sequence = SKAction.sequence([SKAction.run(addMonster),SKAction.wait(forDuration:1.0)])
        
        run(
            SKAction.sequence([SKAction.repeat(sequence,count: 20)]))

    
        
        if manager.isAccelerometerAvailable == true {
            manager.startAccelerometerUpdates(to: OperationQueue(), withHandler:{
                data, error in
            
                self.physicsWorld.gravity = CGVector(dx: CGFloat((data?.acceleration.x)!)*80, dy: CGFloat((data?.acceleration.y)!)*80)
                
            })
            
        }
        
        
        
        
    }
    
    
    
    func gameOver(){
        
            if let scene = GameOver(fileNamed: "GameOver") {

                scene.scaleMode = .aspectFill
                

                view?.presentScene(scene)
            }
        }
    
    
        



    func didBegin(_ contact: SKPhysicsContact){
        let contactA:SKPhysicsBody = contact.bodyA
        let contactB:SKPhysicsBody = contact.bodyB
        if ((contactA.categoryBitMask == 2) && (contactB.categoryBitMask != 10)){
            
            contactB.node?.xScale = 0
            contactB.node?.yScale = 0
            
        }else if( (contactB.categoryBitMask == 2) && (contactB.categoryBitMask != 10)){
            
            contactA.node?.xScale = 0
            contactA.node?.yScale = 0
            
        }
        else{
        
        }
        
    }
    
    
    
    
    
    func addMonster(){
        //        here we create a sprite again with the name of the image
        let monster = SKSpriteNode(imageNamed: "monster")
        let randomnum = arc4random_uniform(UInt32(2))+2
        monster.xScale = CGFloat(randomnum)
        monster.yScale = CGFloat(randomnum)
        //        determine where to spawn the monster along the Y axis
        monster.physicsBody = SKPhysicsBody(circleOfRadius: max(monster.size.width/2, monster.size.height/2))

        monster.physicsBody?.affectedByGravity = false
        monster.physicsBody?.collisionBitMask = 100
    
        addChild(monster)
        let toprowY = (self.scene?.size.height)!/2
        let toprowX = CGFloat(arc4random_uniform(UInt32((self.scene?.size.width)!)))-((self.scene?.size.width)!/2)
        monster.position = CGPoint(x:toprowX, y:toprowY)
        monster.zPosition = 1.0
        
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))

        let actionMove = SKAction.move(to: CGPoint(x: toprowX, y: -toprowY), duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        
        
        monster.run(SKAction.sequence([actionMove, actionMoveDone,SKAction.run {
            if monster.xScale != 0{
                self.livesleft -= 1
                self.myLives.text = "Lives: "+String(self.livesleft)
                
            }
            if  self.livesleft<1 {
                self.gameOver()
            }
            else{
            }
            }
            ]))
    }

    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }

    
    
    override func update(_ currentTime: TimeInterval) {
    }


    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
   }
