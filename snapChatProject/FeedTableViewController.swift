//
//  FeedTableViewController.swift
//  snapChatProject
//
//  Created by Wilson Wang on 3/12/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {

    @IBOutlet var Feed: UITableView!
    var snapToView: Snap?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Feed.dataSource = self
        Feed.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Feed.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return threads.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (threads[threadNames[section]]?.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Feed.dequeueReusableCell(withIdentifier: "feedTableViewCell", for: indexPath) as! FeedTableViewCell
        let name = threadNames[indexPath.section]
        let snap: Snap = threads[name]![indexPath.item]
        
        cell.Name.text = snap.author
        cell.timeAgo.text = snap.getTimeStamp()
        cell.readSquare.image = #imageLiteral(resourceName: "read")
        if(!snap.read) {
            cell.readSquare.image = #imageLiteral(resourceName: "unread")
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let name = threadNames[indexPath.section]
        let snap: Snap = threads[name]![indexPath.item]
        snapToView = snap
        if(!snap.read) {
            snap.markAsRead()
            performSegue(withIdentifier: "feed2BigImage", sender: self)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "feed2BigImage" {
                if let dest = segue.destination as? EnlargedImageController {
                    dest.snapToView = snapToView
                }
            }
        }
    }
}
