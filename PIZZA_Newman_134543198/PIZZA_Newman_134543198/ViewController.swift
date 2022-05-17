//
//  ViewController.swift
//  PIZZA_Newman_134543198
//
//  Created by Newman Law on 2022-02-14.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //Declaring our outlets
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var myStepper: UIStepper!
    @IBOutlet weak var mySegmentControl: UISegmentedControl!
    @IBOutlet weak var lblDescription: UILabel!
    
    //Declaring our variables:
    var pizzaNames = ["The Original", "Vegetarian Fiesta Pizza", "Spicy Pulled Pork"]
    var checkPizza = 0;
    

    var pizzaList:[Pizza] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.picker.delegate = self
        self.picker.dataSource = self
        
        var firstPizza:Pizza = Pizza(name:"Spicy Pulled Pork", desc:"Slow-roasted pulled pork with a special spicy and smoky BBQ pizza sauce.", price:[15.50, 17.50, 21.50])
        var secondPizza:Pizza = Pizza(name:"Vegetarian Fiesta Pizza", desc:"Roasted red peppers, carmelized onions, sundried organic tomatoes, feta, and spinach, on a thin crust with pesto sauce.", price:[15.50, 17.50, 21.50])
        var thirdPizza:Pizza = Pizza(name:"The Original", desc:"Pepperoni, cheese, green onions. Served with extra tomato sauce and three types of cheese", price:[15.50, 17.50, 21.50])
        
        pizzaList.append(thirdPizza)
        pizzaList.append(secondPizza)
        pizzaList.append(firstPizza)
        
        lblDescription.text = thirdPizza.desc
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pizzaNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        lblDescription.text = pizzaList[row].desc
        return pizzaNames[row]
    }
    
    @IBAction func segmentChanged(_ sender: Any) {
        print(mySegmentControl.selectedSegmentIndex)
        switch (mySegmentControl.selectedSegmentIndex) {
        case 0:
            print("The person picked a small pizza")
            checkPizza = 0
        case 1:
            print("The person picked a medium pizza")
            checkPizza = 1
        case 2:
            print("The preson picked a large pizza")
            checkPizza = 2
        default:
            checkPizza = -1
        }
    }
    
    @IBAction func stepperChanged(_ sender: Any) {
        print("Stepper value changed! \(myStepper.value)")
        lblQuantity.text = "\(Int(myStepper.value))"
    }
    
    @IBAction func placeOrder(_ sender: Any) {
        //1. Retrieve picker value
        var selectedIndex = self.picker.selectedRow(inComponent: 0)
        //2. Retrieve Size of pizza
        var sizeOfPizza = checkPizza
        //3. Retrieve Quantity of pizza
        var quantityOfPizza:Int = Int(self.myStepper.value)
        
        var finalPrice:Double = pizzaList[selectedIndex].price[sizeOfPizza] * Double(quantityOfPizza)
        //4. Print out value
//        print("Placing order of Pizza: ")
//        print("Pizza Name: \(pizzaList[selectedIndex].name)")
//        print("Pizza Desc: \(pizzaList[selectedIndex].desc)")
//        print("Pizza Price: \(finalPrice)")
//
        //Navigate to second screen
        
        guard let paymentScreen = storyboard?.instantiateViewController(identifier: "payment_screen") as? Payment_ScreenViewController else {
            print("cannot find a screen with an id of payment_screen")
            return
        }

        paymentScreen.name = pizzaList[selectedIndex].name
        paymentScreen.sizeOfPizza = checkPizza
        paymentScreen.quantityOfPizza = quantityOfPizza
        paymentScreen.Subtotal = finalPrice
        
        show(paymentScreen, sender: self)
    }
    
    
    @IBAction func startOver(_ sender: Any) {
        lblQuantity.text = "1"
        myStepper.value = 1.0
        
        mySegmentControl.selectedSegmentIndex = 0
        self.picker.selectRow(0, inComponent:0, animated:true)
        
    }
    
}

