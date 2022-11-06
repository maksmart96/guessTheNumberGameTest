//
//  ComputerGuessingViewController.swift
//  guesNumber
//
//  Created by  Максим Мартынов on 05.11.2022.
//

import UIKit

class ComputerGuessingViewController: UIViewController {
    //game logic here
    let game = GameLogic()
//    var computerTriesCount = 0
    
    @IBOutlet weak var guessNumberLabel: UILabel!
    //play buttons
    @IBOutlet weak var biggerButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var lessButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        game.state = .startedNG
        guessNumberLabel.text = game.bigger()
        game.computerTriesCount += 1
        // Do any additional setup after loading the view.
    }
    
    @IBAction func greaterAction(_ sender: Any) {
        game.computerTriesCount += 1
        guessNumberLabel.text = game.bigger()
    }
    @IBAction func equalsAction(_ sender: Any) {
        game.computerTriesCount += 1
        guessNumberLabel.text = game.equals()
        print("число попыток компьютера = \(game.computerTriesCount)")
    }
    @IBAction func lessAction(_ sender: Any) {
        game.computerTriesCount += 1
        guessNumberLabel.text = game.smaller()
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let humanGuessingVC = segue.destination as? HumanGuessingViewController else { return }
        humanGuessingVC.computerTriesCount = game.computerTriesCount
        
    }

}
