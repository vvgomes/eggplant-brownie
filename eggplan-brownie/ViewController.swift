import UIKit

protocol AddMealDelegate {
    func add(meal: Meal)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItemDelegate {
    @IBOutlet var nameField: UITextField!
    @IBOutlet var happinessField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    var delegate: AddMealDelegate?
    
    var items = [
        Item(name: "Eggplant Brownie", calories: 10)
    ]
    
    var selected = Array<Item>()
    
    @IBAction func add() {
        let name = nameField.text!
        let happiness = Int(happinessField.text!)
        
        if happiness == nil { return }
        
        let meal = Meal(name: name, happiness: happiness!)
        meal.items = selected
        
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
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(
            title: "New item",
            style: UIBarButtonItemStyle.Plain,
            target: self,
            action: Selector("showNewItem"))
        navigationItem.rightBarButtonItem = newItemButton
    }
    
    func showNewItem() {
        let newItem = NewItemViewController(delegate: self)
        if let navigation = self.navigationController {
            navigation.pushViewController(newItem, animated: true)
        }
    }
    
    // AddItemDelegate
    func addItem(item: Item) {
        items.append(item)
        if let table = tableView {
            table.reloadData()
        } else {
            Alert(controller: self).show("Unexpected error, but the item was added.")
        }
    }
}
