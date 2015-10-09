import UIKit

class MealsTableViewController: UITableViewController, AddMealDelegate {
    var meals = [
        Meal(name: "Cheesecake", happiness: 3),
        Meal(name: "Eggplant Brownie", happiness: 2)
    ]
    
    // AddMealDelegate
    func add(meal: Meal) {
        self.meals.append(meal)
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let meal = meals[indexPath.row]
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = meal.name
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addMeal" {
            let view = segue.destinationViewController as! ViewController
            view.delegate = self
        }
    }
}
