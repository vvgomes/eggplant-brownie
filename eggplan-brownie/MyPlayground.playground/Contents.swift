//: Playground - noun: a place where people can play

import UIKit

class Item {
    let name : String
    let calories : Double
    
    init(name : String, calories : Double) {
        self.name = name
        self.calories = calories
    }
}

class Meal {
    let name : String
    let happiness : Int
    var items : Array<Item>
    
    init(name : String, happiness : Int) {
        self.name = name
        self.happiness = happiness
        self.items = []
    }
    
    func totalCalories() -> Double {
        return items.map({$0.calories}).reduce(0.0, combine: +)
    }
}

let desert = Meal(name : "Desert", happiness : 4)
desert.items.append(Item(name : "Brownie", calories : 300.2))
desert.items.append(Item(name : "Cheesecake", calories : 350.5))
    
desert.items.forEach { (item) -> () in
    print(" => \(item.name) : \(item.calories)")
}
print(desert.totalCalories())

let list = ["foo", "bar"]
print(list + ["baz"])