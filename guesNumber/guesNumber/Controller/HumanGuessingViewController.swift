//
//  HumanGuessingViewController.swift
//  guesNumber
//
//  Created by  Максим Мартынов on 05.11.2022.
//

import UIKit

class HumanGuessingViewController: UIViewController, UITextFieldDelegate {
    var secretNumber: Int = 0
    var computerTriesCount: Int?
    var myTries: Int = 0
    
    @IBOutlet weak var computerAnswerLabel: UILabel!
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var guessButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secretNumber = Int.random(in: (1...100))
        guessTextField.delegate = self
        guessTextField.keyboardType = .decimalPad
        
        
        print(secretNumber)
        
        computerAnswerLabel.isHidden = true
        setToolbar()
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        guard let num = Int((guessTextField.text!)) else { return }
        print(num)
        if num == secretNumber {   //segue
            myTries += 1
            performSegue(withIdentifier: "scoreSegue", sender: sender)
        }
        else if num < secretNumber {
                myTries += 1
                computerAnswerLabel.text = "Нет мое число больше вашего"
                computerAnswerLabel.isHidden = false
            guessTextField.text = nil
            }
        else if num > secretNumber {
                myTries += 1
                computerAnswerLabel.text = "Нет мое число меньше вашего"
                computerAnswerLabel.isHidden = false
            guessTextField.text = nil
            }
    }
    
    func setToolbar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(doneClicked))
        toolBar.setItems([doneButton], animated: false)

        guessTextField.inputAccessoryView = toolBar
    }

    @objc func doneClicked() {
        guessTextField.resignFirstResponder()
        view.endEditing(true)
}
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if !textField.text!.isEmpty,
            let number = Int(textField.text!),
           (1...100).contains(number)
        {
            guessButton.isEnabled = true
        } else {
            guessButton.isEnabled = false
        }
        return true
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let winnerVC = segue.destination as? WinnerViewController else { return }
        guard let computerTriesCount = computerTriesCount else {
            return
        }
        winnerVC.pcTries = computerTriesCount
        winnerVC.humanTries = myTries
    }

}

extension UIViewController {
    
//    func setToolbar(textField: UITextField) {
//        let toolBar = UIToolbar()
//        toolBar.sizeToFit()
//
//        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(doneClicked(textField)))
//        toolBar.setItems([doneButton], animated: false)
//
//        textField.inputAccessoryView = toolBar
//    }
//
//    @objc func doneClicked(_ textField: UITextField) {
//        textField.resignFirstResponder()
//        view.endEditing(true)
//}
}
