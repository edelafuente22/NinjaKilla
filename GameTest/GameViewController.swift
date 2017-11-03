//
//  GameViewController.swift
//  GameTest
//
//  Created by Anna on 11/2/17.
//  Copyright © 2017 M a t t h e w. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import CoreMotion

class GameViewController: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
            if let view = self.view as! SKView? {
                if let scene = mainMenuScene(fileNamed: "MainMenu"){
                    scene.scaleMode = .aspectFill
                    view.presentScene(scene)
                }

            view.ignoresSiblingOrder = true
        
        }

    }
    

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
