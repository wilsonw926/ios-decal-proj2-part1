//
//  EnlargedImageController.swift
//  snapChatProject
//
//  Created by Wilson Wang on 3/12/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class EnlargedImageController: UIViewController {

    var snapToView: Snap?
    @IBOutlet weak var enlargedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let snap = snapToView {
            enlargedImage.image = snap.image
        }
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressedImage(_ sender: Any) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.popViewController(animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
