//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var everythingTips=TipsLogic("10%",2,0.0);
    
    @IBOutlet weak var splitPersonsAmount: UILabel!;
    @IBOutlet weak var noTips: UIButton!;
    @IBOutlet weak var tenPercenttips: UIButton!;
    @IBOutlet weak var twentyPercentTips: UIButton!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    @IBAction func tipsButtonPressed(_ sender: UIButton) {
        if let buttonText=sender.currentTitle{
            everythingTips=TipsLogic(buttonText, everythingTips.persons, everythingTips.bill);
        }
        updateUi();
    }
    
    @IBAction func personsAmountStepper(_ sender: UIStepper) {
        self.splitPersonsAmount.text=String(Int(sender.value) );
        everythingTips=TipsLogic(everythingTips.tipsAmount, Int(sender.value), everythingTips.bill);
        view.endEditing(true)
    }
    
    @IBAction func userInputChanged(_ sender: UITextField) {
        if let userInput=sender.text{
            let billTotal=Float(userInput) ?? 0.0;
            everythingTips=TipsLogic(everythingTips.tipsAmount, everythingTips.persons, billTotal);
        }
    }
    @IBAction func calculateSplitBill(_ sender: UIButton) {
        everythingTips.calculateSplittedBill();
        self.performSegue(withIdentifier: "goToResults", sender: self);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="goToResults"){
            let destinationVC = segue.destination as! ResultsViewController;
            
            destinationVC.totalPerPerson=everythingTips.getSplittedBill();
            destinationVC.tipsSummary = everythingTips.getSummary();
        }
    }
    
    
    func updateUi(){
        view.endEditing(true)
        switch everythingTips.tipsAmount{
        case "20%":
            noTips.isSelected = false;
            tenPercenttips.isSelected=false;
            twentyPercentTips.isSelected=true;
        case "10%":
            noTips.isSelected = false;
            tenPercenttips.isSelected=true;
            twentyPercentTips.isSelected=false;
        default:
            noTips.isSelected = true;
            tenPercenttips.isSelected=false;
            twentyPercentTips.isSelected=false;
        }
    
    }
    
}

