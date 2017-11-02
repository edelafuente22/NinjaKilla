//
//  GameViewController.swift
//  newGame
//
//  Created by Estefania  Yepez on 11/2/17.
//  Copyright © 2017 Estefania  Yepez. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene( size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
        
        
            }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

