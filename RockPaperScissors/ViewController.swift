//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Nima Soleimani on 4/26/17.
//  Copyright © 2017 Nima Soleimani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var computerSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var currentGameState = GameState.start
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rockButtonTapped(_ sender: UIButton) {
        play(selectedSign: .rock)
    }

    @IBAction func paperButtonTapped(_ sender: UIButton) {
        play(selectedSign: .paper)
    }
    
    @IBAction func scissorsButtonTapped(_ sender: UIButton) {
        play(selectedSign: .scissors)
    }
    
    @IBAction func playAgainButtonTapped(_ sender: UIButton) {
        currentGameState = .start
        updateInterface()
    }
    
    func updateInterface() {
        gameStatus.text = "\(currentGameState)"
        updateViewColor()
        if currentGameState == .start {
            computerSign.text = "🤖"
            playAgainButton.isHidden = true
            enableSignButtons()
            displaySignButtons()
        }
        
    }
    
    func updateViewColor() {
        switch currentGameState {
        case .win:
        view.backgroundColor = UIColor.green
        case .lose:
            view.backgroundColor = UIColor.red
        case .draw:
            view.backgroundColor = UIColor.lightGray
        default:
            view.backgroundColor = UIColor.white
        }
        
    }
    
    func play(selectedSign: Sign) {
        let randomRobotSign: Sign = randomSign()
        currentGameState = selectedSign.compareSigns(opponentSign: randomRobotSign)
        updateInterface()
        computerSign.text = randomRobotSign.emoji
        disableSignButtons()
        hideSignButtons()
        playAgainButton.isHidden = false
    }
    
    func hideSignButtons() {
        if rockButton.isSelected == false {rockButton.isHidden = true}
        if paperButton.isSelected == false {paperButton.isHidden = true}
        if scissorsButton.isSelected == false {scissorsButton.isHidden = true}
    }
    
    func displaySignButtons() {
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
    }
    
    func enableSignButtons() {
        rockButton.isEnabled = true
        paperButton.isEnabled = true
        scissorsButton.isEnabled = true
    }
    
    func disableSignButtons() {
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
    }
}

