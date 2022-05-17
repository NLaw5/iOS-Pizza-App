//
//  Pizza.swift
//  PIZZA_Newman_134543198
//
//  Created by Newman Law on 2022-02-14.
//

import Foundation


class Pizza {
    
    //Properties
    var name:String
    var desc:String
    var price:[Double]
    
    init(name:String, desc:String, price:[Double])
    {
        self.name = name
        self.desc = desc
        self.price = price
    }
}
