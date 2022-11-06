//
//  WinnerViewController.swift
//  guesNumber
//
//  Created by  Максим Мартынов on 06.11.2022.
//

import UIKit

class WinnerViewController: UIViewController {
    var pcTries: Int = 0
    var humanTries: Int = 0

    @IBOutlet weak var humanTriesCountLabel: UILabel!
    @IBOutlet weak var pcTriesCountLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var homeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        humanTriesCountLabel.text = "Количество ваших попыток: \(humanTries)"
        pcTriesCountLabel.text = "Количество попыток компьютера: \(pcTries)"
        winnerLabel.text = humanTries < pcTries ? "Вы выйграли" : "Вы проиграли"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goHomeAction(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
