//
//  TipsLogic.swift
//  Tipsy
//
//  Created by Edwin Odesseiron on 1/28/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct TipsLogic{
    
    var tipsAmount:String="0%";
    var persons:Int=2;
    var bill:Float=0.0;
    var splittedBill:Float=0.0;
    
    init(_ tipsAmount:String, _ persons:Int, _ bill:Float){
        self.tipsAmount=tipsAmount;
        self.persons=persons;
        self.bill=bill;
    }
    
    mutating func calculateSplittedBill(){
        let tipsValue=Float(tipsAmount.split(separator: "%")[0]);
        let actualTips = tipsValue ?? 0.0;
        self.splittedBill=Float(bill+actualTips)/Float(persons);
    }
    
    func getSplittedBill()->String{
        return String(format:"%.1f", splittedBill)
    }
    
    func getSummary()->String{
        return "Split between \(persons) people, with \(tipsAmount) tip."
    }
}
