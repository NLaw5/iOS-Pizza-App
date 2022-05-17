//
//  Payment_ScreenViewController.swift
//  PIZZA_Newman_134543198
//
//  Created by Newman Law on 2022-02-14.
//

import Foundation
//
//  ViewControllerScreen2.swift
//  PIZZA_Newman_134543198
//
//  Created by Newman Law on 2022-02-14.
//

import Foundation
import UIKit

class Payment_ScreenViewController: UIViewController {
    
    var name:String = ""
    var sizeOfPizza:Int = 0
    var quantityOfPizza:Int = 0
    var Subtotal:Double = 0.0
    
    @IBOutlet weak var lblSubtotal: UILabel!
    @IBOutlet weak var lblQuantityOfPizza: UILabel!
    @IBOutlet weak var lblSizeOfPizza: UILabel!
    @IBOutlet weak var lblTax: UILabel!
    @IBOutlet weak var lblFinalTotal: UILabel!
    @IBOutlet weak var lblPizzaName: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(sizeOfPizza == 0)
        {
            lblSizeOfPizza.text="Pizza Size: Small"
        }
        else if(sizeOfPizza == 1)
        {
            lblSizeOfPizza.text="Pizza Size: Medium"
        }
        else{
            lblSizeOfPizza.text="Pizza Size: Large"
        }

        lblPizzaName.text = "Bought Pizza: \(name)"

        lblQuantityOfPizza.text = "Quantity of Pizza: \(quantityOfPizza)"
        
        lblSubtotal.text = String(format: "Subtotal of Pizza Bought: %.2f", Subtotal)
        
        var tax = Subtotal * 0.13
        var finalPrice = tax + Subtotal
        
        lblTax.text = String(format: "Tax: %.2f", tax)
        lblFinalTotal.text = String(format: "Final Price of Pizza: %.2f", lblFinalTotal)
    
    }

}
