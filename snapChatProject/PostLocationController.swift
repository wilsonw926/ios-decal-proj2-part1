//
//  PostLocationController.swift
//  snapChatProject
//
//  Created by Wilson Wang on 3/12/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class PostLocationController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    @IBOutlet weak var selectedCategory: UILabel!
    
    var targetImage: UIImage?
    var currentFeed: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoryTableView.dequeueReusableCell(withIdentifier: "imageTableViewCell") as! ImageTableViewCell
        cell.feedName.text = threadNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        selectedCategory.text = threadNames[indexPath.item]
        currentFeed = threadNames[indexPath.item]
    }
    
    @IBAction func pressedPostButton(_ sender: UIButton) {
        if let cfeed = currentFeed {
            var snaps: [Snap] = threads[cfeed]!
            snaps.append(Snap(imageToPost: targetImage!, author: "Wilson"))
            threads[cfeed] = snaps
            PostSuccessfulAlert(cfeed)
        }
        else {
            NoThreadAlert()
        }
    }
    
    func NoThreadAlert() -> Void {
        let alertTitle = "Uh Oh!"
        let alertMessage = "Please select a thread to post to."
        let alert: UIAlertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            default:
                return
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func PostSuccessfulAlert(_ thread: String) -> Void {
        let alertTitle = "Success!"
        let alertMessage = "Posted Picture!"
        let alert: UIAlertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            default:
            self.navigationController?.popViewController(animated: true)
                return
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
