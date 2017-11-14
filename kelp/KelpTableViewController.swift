import UIKit
import os.log

class KelpTableViewController: UITableViewController {
    
    // MARK : Properties
    
    var fishes = [Fish]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button item provided by the table view controller
        navigationItem.leftBarButtonItem = editButtonItem
        
        // Load any saved meals, otherwise load sample data
        if let savedFishes = loadFishes() {
            fishes += savedFishes
        }
        //        else {
        //
        //        // Load the sample data
        //        loadSampleMeals()
        //        }
        //    }
        //
        //        func loadSampleMeals(){
        //
        //            let photo1 = UIImage(named: "meal1")
        //            let meal1 = Meal(name: "Caprese Salad", photo: photo1)!
        //
        //            let photo2 = UIImage(named: "meal2")
        //            let meal2 = Meal(name: "Chicken and Potatoes", photo: photo2)!
        //
        //            let photo3 = UIImage(named: "meal3")
        //            let meal3 = Meal(name: "Pasta with meatballs", photo: photo3)!
        //
        //            meals += [meal1, meal2, meal3]
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fishes.count
    }
    
    // Table view cells are reused and should be dequeued using a cell identifier
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "KelpTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! KelpTableViewCell
        
        // Fetches the appropriate fish for the data source layout
        let fish = fishes[indexPath.row]
        
        cell.nameLabel.text = fish.name
        cell.familyLabel.text = fish.family
        cell.photoImageView.image = fish.photo
        
        return cell
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            fishes.remove(at: indexPath.row)
            saveFishes()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let fishDetailViewController = segue.destination as!
            KelpViewController
            // Get the cell that gemerated this segue
            if let selectedFishCell = sender as? KelpTableViewCell {
                let indexPath = tableView.indexPath(for: selectedFishCell)!
                let selectedFish = fishes[indexPath.row]
                fishDetailViewController.fish = selectedFish
            }
        }
        else if segue.identifier == "AddItem" {
            print("Adding new fish.")
        }
    }
    
    @IBAction func unwindToFishList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as?
            KelpViewController, let fish = sourceViewController.fish {
            if let selectedIndexPath = tableView.indexPathsForSelectedRows?.last {
                // Update an existing fish
                fishes [(selectedIndexPath as IndexPath).row] = fish
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                // Add a new fish
                let newIndexPath = IndexPath(row: fishes.count, section: 0)
                fishes.append(fish)
                tableView.insertRows(at: [newIndexPath], with: .bottom)
            }
            // Save the fishes
            saveFishes()
        }
    }
    
    //     MARK : NSCoding
    private func saveFishes() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(fishes, toFile: (Fish.ArchiveURL.path))
        if !isSuccessfulSave {
            os_log("Failed to save fish...", log: OSLog.default, type: .error)
        } else {
            os_log("Fish successfully saved.", log: OSLog.default, type: .debug)
        }
    }
    private func loadFishes () -> [Fish]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: (Fish.ArchiveURL.path)) as?
            [Fish]
    }
}
