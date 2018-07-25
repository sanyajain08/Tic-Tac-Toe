//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Sanya Jain 7/5/18.
//  Copyright © 2018 Sanya Jain. All rights reserved.
//

import UIKit

class firstViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var gridLabel0: GridLabel!
    @IBOutlet weak var gridLabel1: GridLabel!
    @IBOutlet weak var gridLabel2: GridLabel!
    @IBOutlet weak var gridLabel3: GridLabel!
    @IBOutlet weak var gridLabel4: GridLabel!
    @IBOutlet weak var gridLabel5: GridLabel!
    @IBOutlet weak var gridLabel6: GridLabel!
    @IBOutlet weak var gridLabel7: GridLabel!
    @IBOutlet weak var gridLabel8: GridLabel!
    
    //VARIABLES
    var labelsArray = [GridLabel]()
    var xTurn = true
    var gameOver = false
    
    func displayWinningMessage(message: String){
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Reset", style: .default) {
            (action) -> Void in self.resetGame()
        }
        
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        gameOver = true
    }
    
    func resetGame() {
        for gridLabelNumber in labelsArray{
            gridLabelNumber.text = ""
            gridLabelNumber.canTap = true
        }
        
        xTurn = true
        
        gameOver = false
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelsArray.append(gridLabel0)
        labelsArray.append(gridLabel1)
        labelsArray.append(gridLabel2)
        labelsArray.append(gridLabel3)
        labelsArray.append(gridLabel4)
        labelsArray.append(gridLabel5)
        labelsArray.append(gridLabel6)
        labelsArray.append(gridLabel7)
        labelsArray.append(gridLabel8)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTappedGridLabel(_ sender: UITapGestureRecognizer) {
        for label in labelsArray {
            if label.frame.contains(sender.location(in: backgroundView)) {
                if label.canTap {
                    if xTurn {
                        label.text = "X"
                    }
                    else {
                        label.text = "O"
                    }
                    if checkForWinner() {
                        var thePossibleWinner : String = ""
                        if xTurn {
                            thePossibleWinner = "X"
                        }
                        else {
                            thePossibleWinner = "O"
                        }
                        displayWinningMessage(message: "Winner is \(thePossibleWinner)!")
                    }
                    else if checkForCatsGame(){
                        displayWinningMessage(message: "Cat's Game")
                    }
                    else {
                        print("gaame is still on")
                    }
                    xTurn = !xTurn
                    label.canTap = false
                }
            }
            
        }
    }//ok
    
    func checkForWinner () -> Bool{//ok
        
        if checkThreeLabels(a: 0, b: 1, c: 2) {//ok
            
            return true
        }//ok
        else if checkThreeLabels(a: 3, b: 4, c: 5) {//ok
            
            return true
        }//ok
        else if checkThreeLabels(a: 6, b: 7, c: 8) {//ok
            
            return true
        }//ok
        else if checkThreeLabels(a: 0, b: 3, c: 6) {//ok
            
            return true
        }//ok
        else if checkThreeLabels(a: 1, b: 4, c: 7) {//ok
            
            return true
        }//ok
        else if checkThreeLabels(a: 2, b: 5, c: 8) {//ok
            
            return true
        }//ok
        else if checkThreeLabels(a: 0, b: 4, c: 8) {//ok
            
            return true
        }//ok
        else if checkThreeLabels(a: 6, b: 4, c: 2) {//ok
            
            return true
        }//ok
        else {//ok
            
            return false
        }//ok
    }//ok
    func checkThreeLabels (a: Int, b: Int, c: Int) -> Bool {//ok
        if labelsArray[a].text != "" && labelsArray[a].text == labelsArray[b].text && labelsArray[a].text == labelsArray[c].text {//ok
            return true
        }//ok
        else {//ok
            return false
        }//ok
        
    }//ok
    
    
    func checkForCatsGame () -> Bool {//ok
        for aLabel in labelsArray {//ok
            if aLabel.text == "" {//ok
                return false
            }//ok
        }//ok
        if checkForWinner() {//ok
            return false
        }//ok
        else {//ok
            return true
        }//ok
    }//ok
    
    
    
    
    
    
    
    
    
}

























