//
//  ViewController.swift
//  kelp
//
//  Created by Jacqueline DesMarais on 11/7/17.
//  Copyright © 2017 Jacque DesMarais. All rights reserved.
//

import UIKit

class FishDetailViewController: UITableViewController {
    
    var fishes = [Fish]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    override func stackView(_ tableView: UIStackView, cellForRowAt indexPath: IndexPath) -> UIStackView {
        let cellIdentifier = "FishDetailStackView"
        let cell = stackView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FishDetailStackView
        
        // Fetches the appropriate fish for the data source layout
        let fish = fishes[indexPath.row]
        
        cell.nameLabel.text = fish.name
        cell.familyLabel.text = fish.family
        cell.colorLabel.text = fish.color
        cell.aquariumLabel.text = fish.aquarium
        cell.descriptionLabel.text = fish.description
        cell.photoImageView.image = fish.photo
        
        return cell
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        navigationController! .popViewController(animated: true)
    }
    

}


