import UIKit

protocol AddItemDelegate {
    func addItem(item: Item)
}

class NewItemViewController: UIViewController {
    @IBOutlet var nameField: UITextField!
    @IBOutlet var caloriesField: UITextField!
    
    var delegate: AddItemDelegate?
    
    init(delegate: AddItemDelegate) {
        self.delegate = delegate
        super.init(nibName: "NewItemViewController", bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    @IBAction func addNewItem() {
        let name = nameField.text!
        let calories = NSString(string: caloriesField.text!).doubleValue
        let item = Item(name: name, calories: calories)
        
        if delegate != nil {
            delegate!.addItem(item)
        }
        
        if let navigation = navigationController {
            navigation.popViewControllerAnimated(true)
        }
    }
}
