//
//  ViewController.swift
//  XOm
//
//  Created by Omkar Bahiwal on 22/11/17.
//  Copyright © 2017 Omkar Bahiwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = 1   // Cross
    var gameState = [0,0,0,0,0,0,0,0,0]
    var gameIsActive = true
    let winComb = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
   
    @IBOutlet weak var label: UILabel!
    @IBAction func action(_ sender: AnyObject) {
        if(gameState[sender.tag-1] == 0 && gameIsActive == true)
        {
            gameState[sender.tag-1] = activePlayer
        if(activePlayer == 1){ 

            sender.setImage(UIImage(named:"Cross.png"), for: UIControlState())
            activePlayer = 2
        
        }else{
        
            sender.setImage(UIImage(named: "Nought.png"),for : UIControlState())
  
            activePlayer  = 1
        } }
        for combination in winComb{
            if(gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]){
                gameIsActive = false
                
                if(gameState[combination[0]] == 1){
                    //cross wins
                    label.text = "X WINS !!"
                    gameState = [0,0,0,0,0,0,0,0,0]
                }else{
                    label.text = "O WINS !! "
                    //O wins
                    gameState = [0,0,0,0,0,0,0,0,0]
                }
                
                playAgainButton.isHidden = false
                label.isHidden = false
                
                
            }
        }
        gameIsActive = false
        for i in gameState
        {
            if i == 0
            {
             gameIsActive = true
                break;
            }
        }
        if gameIsActive == false
        {           gameState = [0,0,0,0,0,0,0,0,0]
            label.text = "DRAW !!"
            label.isHidden = false
            playAgainButton.isHidden = false
            
        }
    }
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: Any) {
        
        gameState = [0,0,0,0,0,0,0,0,0]
        playAgainButton.isHidden = true
        label.isHidden = true
        gameIsActive = true
        activePlayer = 1
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as!UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playAgainButton.isHidden = true
        label.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
