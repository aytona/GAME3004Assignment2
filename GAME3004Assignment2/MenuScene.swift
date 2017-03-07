//
//  MenuScene.swift
//  GAME3004Assignment2
//
//  Created by Christopher Aytona on 2017-03-06.
//  Copyright © 2017 Christopher Aytona. All rights reserved.
//

import Foundation
import UIKit

enum gameType {
    case player1
    case player2
}

class MenuScene : UIViewController {
    
    @IBAction func Player1(_ sender: Any) {
        PlayGame(game : .player1)
    }
    
    @IBAction func Player2(_ sender: Any) {
        PlayGame(game: .player2)
    }
    
    func PlayGame(game : gameType) {
        let gameScene = self.storyboard?.instantiateViewController(withIdentifier: "GameScene") as! GameViewController
        currentType = game
        self.navigationController?.pushViewController(gameScene, animated: true)
    }
}
