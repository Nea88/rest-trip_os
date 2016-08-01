//
//  appartmentsViewController.swift
//  rest-trip
//
//  Created by Sorochinskiy Dmitriy on 01.08.16.
//  Copyright © 2016 nelex. All rights reserved.
//

import UIKit

class appartmentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let array = ["app1", "app2", "app3"]
    
    @IBOutlet weak var appartmentItems: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appartmentItems.delegate = self
        appartmentItems.dataSource = self
    }
    
    //MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let appartmentItemCell = appartmentItems.dequeueReusableCellWithIdentifier("appartmentItemCell") as! appartmentTableViewCell
        
        appartmentItemCell.labelPrice.text = "\(indexPath.row*100)$"
        appartmentItemCell.labelAdress.text = array[indexPath.row]
        
        return appartmentItemCell
    }
    
    //MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("appartmentToDetails", sender: indexPath.row)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //MARK: Data send
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController
        controller.title = array[sender as! Int]
    }
}