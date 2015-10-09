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