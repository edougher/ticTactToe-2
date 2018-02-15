//
//  ViewController.swift
//  ticTactToe-2
//
//  Created by Aaron Dougher on 2/14/18.
//  Copyright © 2018 Aaron Dougher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
 
     var player = 1
     var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
     var crossScore = 0
     var circleScore = 0
     var gameIsActive = true
    
  
     
     let winningCombo = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
     
     @IBOutlet weak var cross: UILabel!
     @IBOutlet weak var circle: UILabel!
     @IBOutlet weak var winner: UILabel!
     
     
     
     @IBAction func button(_ sender: UIButton) {
     if (gameState[sender.tag-1] == 0 && gameIsActive == true){
     gameState[sender.tag-1] = player
     
     if (player == 1){
     sender.setImage(#imageLiteral(resourceName: "Cross.png"), for: UIControlState.normal)
     player = 2
     }
     else{
     sender.setImage(#imageLiteral(resourceName: "Nought.png"), for: UIControlState.normal)
     player = 1
     }
     }


     
     for combination in winningCombo
     {
     if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
     
     {
     gameIsActive = false
     
     if gameState[combination[0]] == 1
     {
     crossScore += 1
     cross.text = "\(crossScore)"
     winner.text = "Cross Won!"
        winner.isHidden = false
        gameIsActive = false
     }
     else
     {
     circleScore += 1
     circle.text = "\(circleScore)"
     winner.text = "Circle Won!"
        winner.isHidden = false
        gameIsActive = false
     }
     playAgainButton.isHidden = false
     }
     }
     gameIsActive = false
     
     for i in gameState{
     if i == 0{
     gameIsActive = true
     break
     }
     }
     if gameIsActive == false{
     winner.text = "Draw!"
     winner.isHidden = false
     playAgainButton.isHidden = false
     }
     
     }
     
     @IBOutlet weak var playAgainButton: UIButton!
     @IBAction func playAgain(_ sender: UIButton) {
     gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
     gameIsActive = true
     player = 1
     
     winner.text = ""
     winner.isHidden = true
     
     for i in 1...9{
     let button = view.viewWithTag(i) as! UIButton
     button.setImage(nil, for: UIControlState())
     }
     
     
     
     }
     
     @IBAction func clearScores(_ sender: Any) {
     crossScore = 0
     circleScore = 0
     circle.text = "\(circleScore)"
     cross.text = "\(crossScore)"
     }
     
     


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        winner.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

