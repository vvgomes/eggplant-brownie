import UIKit

protocol AddMealDelegate {
    func add(meal: Meal)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var nameField: UITextField!
    @IBOutlet var happinessField: UITextField!
    var delegate: AddMealDelegate?
    let items = [
        Item(name: "Eggplant Brownie", calories: 10),
        Item(name: "Zucchini Muffin", calories: 10),
        Item(name: "Cookie", calories: 10),
        Item(name: "Coconut oil", calories: 500),
        Item(name: "Chocolate frosting", calories: 1000),
        Item(name: "Chocolate chip", calories: 1000)
    ]
    var selected = Array<Item>()
    
    @IBAction func add() {
        let name = nameField.text!
        let happiness = Int(happinessField.text!)
        
        if happiness == nil { return }
        
        let meal = Meal(name: name, happiness: happiness!)
        meal.items = selected
        print("Eaten: \(meal.name) - \(meal.happiness) - \(meal.items)")
        
        if delegate != nil {
            delegate!.add(meal)
        }
        
        if let navigation = self.navigationController {
            navigation.popViewControllerAnimated(true)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        
        cell.textLabel?.text = item.name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if cell == nil { return }
            
        if cell!.accessoryType == UITableViewCellAccessoryType.None {
            cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
            selected.append(items[indexPath.row])
        } else {
            cell!.accessoryType = UITableViewCellAccessoryType.None
            if let index = selected.indexOf(items[indexPath.row]) {
                selected.removeAtIndex(index)
            }
        }
    }
}
