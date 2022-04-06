//
//  HostViewController.swift
//  Queue System
//
//  Created by FierceBubble on 06/04/22.
//

import UIKit
import Firebase

class HostViewController: UIViewController {

    
    @IBOutlet weak var VPUQueueTextField: UILabel!
    
    @IBOutlet weak var registrarQueueTextField: UILabel!
    
    @IBOutlet weak var financeQueueTextField: UILabel!
    
    
    @IBOutlet weak var VPUNextButton: UIButton!
    
    @IBOutlet weak var registrarNextButton: UIButton!
    
    @IBOutlet weak var financeNextButton: UIButton!
    
    let database = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        writeQueueList()
        
        setUpButtonStyle()
    }
    
    func setUpButtonStyle(){
        
        Styling.styleFilledButton(VPUNextButton)
        Styling.styleHollowButton(registrarNextButton)
        Styling.styleFilledButton(financeNextButton)
    }
    
    func writeQueueList(){
        
        //display the current number queue
        //the host or front officer only able to see the text
        
        let docRef_vpu = database.document("Queue_List/VPU")
        docRef_vpu.getDocument{ [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else{
                return
            }
            
            guard let text = data["currentQueue"] as? Int else{
                return
            }
            
            DispatchQueue.main.async {
                self?.VPUQueueTextField.text = String(text)
            }
            
            print("VPU Queue = \(data)")
            
        }
        
        let docRef_finance = database.document("Queue_List/Finance")
        docRef_finance.getDocument{ [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else{
                return
            }
            
            guard let text = data["currentQueue"] as? Int else{
                return
            }
            
            DispatchQueue.main.async {
                self?.financeQueueTextField.text = String(text)
            }
            
            print("Finance Queue = \(data)")
            
        }
        
        let docRef_registar = database.document("Queue_List/Registar")
        docRef_registar.getDocument{ [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else{
                return
            }
            
            guard let text = data["currentQueue"] as? Int else{
                return
            }
            
            DispatchQueue.main.async {
                self?.registrarQueueTextField.text = String(text)
            }
            
            print("Registar Queue = \(data)")
            
        }
        
    }
    
    
    @IBAction func VPUClicked(_ sender: Any) {
        
        let docRef_vpu = database.document("Queue_List/VPU")
        docRef_vpu.getDocument{ [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else{
                return
            }
            
            guard let currentQueue = data["currentQueue"] as? Int else{
                return
            }
            
            guard let totalQueue = data["totalQueue"] as? Int else{
                return
            }
            
            if(currentQueue != totalQueue){
                DispatchQueue.main.async {
                    self?.VPUQueueTextField.text = String(currentQueue+1)
                }
                
                docRef_vpu.updateData(["currentQueue":(currentQueue+1)])
                
            }
            
        }
        
    }
    
    @IBAction func registrarClicked(_ sender: Any) {
        
        let docRef_registar = database.document("Queue_List/Registar")
        docRef_registar.getDocument{ [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else{
                return
            }
            
            guard let currentQueue = data["currentQueue"] as? Int else{
                return
            }
            
            guard let totalQueue = data["totalQueue"] as? Int else{
                return
            }
            
            if(currentQueue != totalQueue){
                DispatchQueue.main.async {
                    self?.registrarQueueTextField.text = String(currentQueue+1)
                }
                
                docRef_registar.updateData(["currentQueue":(currentQueue+1)])
                
            }
            
        }
    }
    
    
    @IBAction func financeClicked(_ sender: Any) {
        let docRef_finance = database.document("Queue_List/Finance")
        docRef_finance.getDocument{ [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else{
                return
            }
            
            guard let currentQueue = data["currentQueue"] as? Int else{
                return
            }
            
            guard let totalQueue = data["totalQueue"] as? Int else{
                return
            }
            
            if(totalQueue != currentQueue){
                DispatchQueue.main.async {
                    self?.financeQueueTextField.text = String(currentQueue+1)
                }
                
                docRef_finance.updateData(["currentQueue":(currentQueue+1)])
            }
            
            
        }
    }
    
}
