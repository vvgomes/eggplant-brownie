import XCTest
@testable import eggplan_brownie

class eggplan_brownieTests: XCTestCase {
    
    func testMealEquality() {
        XCTAssertTrue(Meal(name: "Cheesecake", happiness: 4) == Meal(name: "Cheesecake", happiness: 2))
        XCTAssertFalse(Meal(name: "Cheesecake", happiness: 4) == Meal(name: "Brownie", happiness: 2))
    }
    
    func testItemEquality() {
        XCTAssertTrue(Item(name: "Suggar", calories: 100) == Item(name: "Suggar", calories: 200))
        XCTAssertFalse(Item(name: "Suggar", calories: 100) == Item(name: "Salt", calories: 200))
    }
    
    func testMealDetails() {
        var meal = Meal(name: "Cheesecake", happiness: 4)
        meal.items.append(Item(name: "Sugar", calories: 2.5))
        meal.items.append(Item(name: "Cheese", calories: 2.5))
        XCTAssertEqual(
            "Happiness: 4\n* Sugar - calories: 2.5\n* Cheese - calories: 2.5\nTotal: 5.0 calories",
            meal.details())
    }
}
