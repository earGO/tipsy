//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Edwin Odesseiron on 1/28/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import SwiftUI

class ResultsViewController: UIViewController {
    
    var totalPerPerson:String?;
    var tipsSummary:String?
    
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    @IBOutlet weak var tipsSummaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let total=totalPerPerson{
            totalPerPersonLabel.text=total;
        } else {
            totalPerPersonLabel.text="0"
        }
        if let summary=tipsSummary{
            tipsSummaryLabel.text=summary
        } else {
            tipsSummaryLabel.text="you haven't eat anithing!"
        }
        
        
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
