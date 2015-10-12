class Meal: Equatable {
    let name: String
    let happiness: Int
    var items: Array<Item>
    
    init(name: String, happiness: Int) {
        self.name = name
        self.happiness = happiness
        self.items = []
    }
    
    func totalCalories() -> Double {
        return items.map({$0.calories}).reduce(0.0, combine: +)
    }
    
    func details() -> String {
        let happinessText = "Happiness: \(happiness)"
        let itemsText = items.map({"* \($0.name) - calories: \($0.calories)"})
        let totalText = "Total: \(totalCalories().description) calories"
        return ([happinessText] + itemsText + [totalText]).joinWithSeparator("\n");
    }
}

func ==(one: Meal, another: Meal) -> Bool {
    return one.name == another.name
}