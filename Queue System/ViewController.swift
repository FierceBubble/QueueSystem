//
//  ViewController.swift
//  Queue System
//
//  Created by FierceBubble on 06/04/22.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController {
    
    @IBOutlet weak var registar_queueBtn: UIButton!
    @IBOutlet weak var finance_queueBtn: UIButton!
    @IBOutlet weak var vpu_queueBtn: UIButton!
    
    @IBOutlet weak var user_id: UILabel!
    @IBOutlet weak var user_name: UILabel!
    
    @IBOutlet weak var queue_label: UILabel!
    @IBOutlet weak var queue_number: UILabel!
    @IBOutlet weak var queue_time: UILabel!
    @IBOutlet weak var queue_department: UILabel!
    
    @IBOutlet weak var queue_registar: UILabel!
    @IBOutlet weak var queue_finance: UILabel!
    @IBOutlet weak var queue_vpu: UILabel!
    
    let database = Firestore.firestore()
    var name : String = ""
    var id : String = ""
    var uID: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        writePersonalInfo(uID: uID!)
        
        checkpersonalQueue(uID: uID!)
        
        writeQueueList()
    }
    
    func writePersonalInfo(uID:String){
        let docRef = database.document("Users/\(uID)")
        docRef.getDocument { [self] snapShot, err in
            guard let data = snapShot?.data(), err == nil else{
                return
            }
            
            guard let name = data["name"] as? String else{
                return
            }
            guard let id = data["studentID"] as? String else{
                return
            }
            
            self.name = name
            self.id = id
            
            self.user_name.text = name
            self.user_id.text = id
        }
    }
    
    func checkpersonalQueue(uID:String){
        
        let docRefQueue = database.document("Users/\(uID)")
        docRefQueue.getDocument { [self] snapShot, err in
            guard let data = snapShot?.data(), err == nil else{
                return
            }
            
            guard let queueAt = data["queueAt"] as? String else{
                queue_number.isHidden = true
                queue_department.isHidden = true
                queue_time.isHidden = true
                queue_label.text = "You are not in any Queue!"
                
                return
            }
            
            if(queueAt != ""){
                let docRefDept = self.database.document("Queue_List/\(queueAt)/Student_List/\(uID)")
                docRefDept.getDocument { snapShot, err in
                    guard let data = snapShot?.data(), err == nil else{
                        return
                    }
                    
                    guard let queueNumber = data["queueNumber"] as? Int else{
                        return
                    }
                    
                    guard let queueTime = data["timeQueue"] as? String else{
                        return
                    }
                    
                    
                    queue_number.text = String(queueNumber)
                    queue_number.isHidden = false
                    queue_department.text = String(queueAt)
                    queue_department.isHidden = false
                    queue_time.text = String(queueTime)
                    queue_time.isHidden = false
                    queue_label.text = "Your Queue"
                    
                    registar_queueBtn.isHidden = true
                    vpu_queueBtn.isHidden = true
                    finance_queueBtn.isHidden = true
                    
                    
                }
            }else{
                queue_number.isHidden = true
                queue_department.isHidden = true
                queue_time.isHidden = true
                queue_label.text = "You are not in any Queue!"
            }
            
        }
        
    }
    
    func writeQueueList(){
        let docRef_vpu = database.document("Queue_List/VPU")
        docRef_vpu.getDocument{ [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else{
                return
            }
            
            guard let text = data["currentQueue"] as? Int else{
                return
            }
            
            DispatchQueue.main.async {
                self?.queue_vpu.text = String(text)
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
                self?.queue_finance.text = String(text)
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
                self?.queue_registar.text = String(text)
            }
            
            print("Registar Queue = \(data)")
            
        }
    }
    
    @IBAction func queue_VPU(){
        addQueue(queueDept: "VPU")
        vpu_queueBtn.isHidden = true
        registar_queueBtn.isHidden = true
        finance_queueBtn.isHidden = true
        print("Queue VPU Clicked!")
    }
    
    @IBAction func queue_Finance(){
        addQueue(queueDept: "Finance")
        vpu_queueBtn.isHidden = true
        registar_queueBtn.isHidden = true
        finance_queueBtn.isHidden = true
        print("Queue Finance Clicked!")
    }
    
    @IBAction func queue_Registar(){
        addQueue(queueDept: "Registar")
        vpu_queueBtn.isHidden = true
        registar_queueBtn.isHidden = true
        finance_queueBtn.isHidden = true
        print("Queue Registar Clicked!")
    }
    
    func addQueue(queueDept: String){
        
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat="d MMM y, HH:mm:ss"
        
        let docRefAll = database.document("Queue_List/\(queueDept)")
        docRefAll.getDocument{ [self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else{
                return
            }
            
            guard let Queue = data["totalQueue"] as? Int else{
                return
            }
            
            
            let docRef = self.database.document("Queue_List/\(queueDept)/Student_List/\(uID!)")
            docRef.setData(["name" : name,
                            "id" : id,
                            "queueNumber" : (Queue+1),
                            "timeQueue" : dateformatter.string(from: Date())])
            
            let docRefPersonal = self.database.document("Users/\(uID!)")
            docRefPersonal.updateData(["queueAt" : queueDept])
            
            docRefAll.updateData(["totalQueue" : Queue+1])
            
            queue_number.text = String(Queue+1)
            queue_number.isHidden = false
            queue_department.text = String(queueDept)
            queue_department.isHidden = false
            queue_time.text = String(dateformatter.string(from: Date()))
            queue_time.isHidden = false
            queue_label.text = "Your Queue"
            
        }
        
    }
    


}

