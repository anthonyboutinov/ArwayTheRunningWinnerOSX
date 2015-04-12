//
//  IntroScene.swift
//  Arway The Running Winner
//
//  Created by Anthony Boutinov on 4/12/15.
//  Copyright (c) 2015 Anthony Boutinov. All rights reserved.
//

import Foundation

class IntroScene: SKScene {
    
    private var video: SKVideoNode!
    
    private static let maxDelta = 0.2
    private var previousUpdateTime: NSTimeInterval = 0.0
    private var timer: NSTimeInterval = 18.0
    
    override func didMoveToView(view: SKView) {
        
        video = SKVideoNode(videoFileNamed: "Intro.m4v")
        video.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        video.size = CGSize(width: 1280.0/1.6, height: 720.0/1.6)
        addChild(video)
        video.play()
        
        if Sound.music {
            Sound.backgroundMusic.pause()
        }
        
    }
    
    override func mouseDown(theEvent: NSEvent) {
        playNewGame()
    }
    
    override func update(currentTime: NSTimeInterval) {
        
        var delta = currentTime - previousUpdateTime
        if delta > IntroScene.maxDelta {
            delta = IntroScene.maxDelta
        }
        
        previousUpdateTime = currentTime
        
        timer -= delta
        
        if timer < 0.0 {
            playNewGame()
        }
    }
    
    func playNewGame() {
        
        video.pause()
        
        if Sound.music {
            Sound.backgroundMusic.play()
        }
        
        let scene = GameLevelScene()
        scene.worldState = WorldStateWithUI()
        presentScene(scene, view!)//, transition: SKTransition.crossFadeWithDuration(1.0))
    }
    
}