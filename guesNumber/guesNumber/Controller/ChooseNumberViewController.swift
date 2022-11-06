//
//  ChooseNumberViewController.swift
//  guesNumber
//
//  Created by  Максим Мартынов on 05.11.2022.
//

import UIKit

class ChooseNumberViewController: UIViewController, UITextFieldDelegate {
//    var number: Int?
    
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet var numberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberTextField.delegate = self
        numberTextField.keyboardType = .decimalPad
        acceptButton.isEnabled = false
        // Do any additional setup after loading the view.
        navigationController?.isNavigationBarHidden = true
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if !textField.text!.isEmpty,
            let number = Int(textField.text!),
           (1...100).contains(number)
        {
            acceptButton.isEnabled = true
        } else {
            acceptButton.isEnabled = false
        }
        return true
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let computerGuessingVC = segue.destination as? ComputerGuessingViewController else { return }
//
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//    }

}
