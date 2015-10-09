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
}
