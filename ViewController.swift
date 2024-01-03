
import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var viewTable: UIView!
    @IBOutlet weak var TableView: UITableView!
    
    var Data = ["hii","hello","bye"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        cell.textLabel?.text = Data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle :  UITableViewCell.EditingStyle, forRowAt indexPath : IndexPath) {
        if editingStyle == .delete{
            TableView.beginUpdates()
            Data.remove(at: indexPath.row)
            TableView.deleteRows(at: [indexPath], with: .fade)
            TableView.endUpdates()
        }
    }
    
}
