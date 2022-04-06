//
//  HostViewController.swift
//  Queue System
//
//  Created by FierceBubble on 06/04/22.
//

import UIKit
import Firebase

class HostViewController: UIViewController {

    
    @IBOutlet weak var VPUqueueText: UILabel!
    
    @IBOutlet weak var registrarQueueText: UILabel!
    
    @IBOutlet weak var financeQueueText: UILabel!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        writeQueueList()
    }
    
    func writeQueueList(){
        
        //display the current number queue
        //the host or front officer only able to see the text
        
    }
}
