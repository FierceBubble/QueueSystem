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
    
    @IBOutlet weak var queue_registar: UILabel!
    @IBOutlet weak var queue_finance: UILabel!
    @IBOutlet weak var queue_vpu: UILabel!
    
    let database = Firestore.firestore()
    let name = "Daniel Ryan Sunjaya"
    let id = "1001851873"

    override func viewDidLoad() {
        super.viewDidLoad()
        user_name.text = name
        user_id.text = id
        
        checkpersonalQueue()
        
        writeQueueList()
    }
    
    func checkpersonalQueue(){
        
//        database.collection("Queue_List/VPU_Queue/Student_List").whereField("id", isEqualTo: id).getDocuments { snapshot, err in
//            if err == nil{
//
//                if let snapshot = snapshot {
//                    var userInfo = snapshot.documents.map { doc in
//
//                        user(docID: doc.documentID,
//                                    id: doc["id"] as? String ?? "",
//                                    name: doc["name"] as? String ?? "",
//                                    queueNumber: doc["queueNumber"] as? Int ?? 0,
//                                    timeQueue: doc["timeQueue"] as? String ?? "")
//
//
//                        return
//                    }
//
//
//                }
//
//            }else{
//                // Document not found
//
//            }
//        }
        
        if(queue_number.text == "0"){
            queue_number.isHidden = true
            queue_label.text = "You are not in any Queue!"
        }else{
            queue_number.isHidden = false
            queue_label.text = "Your Queue"
        }
    }
    
    func writeQueueList(){
        let docRef_vpu = database.document("Queue_List/VPU_Queue")
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
        
        let docRef_finance = database.document("Queue_List/Finance_Queue")
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
        
        let docRef_registar = database.document("Queue_List/Registar_Queue")
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
        addQueue(queueDept: "VPU_Queue")
        vpu_queueBtn.isHidden = true
        registar_queueBtn.isHidden = true
        finance_queueBtn.isHidden = true
        print("Queue VPU Clicked!")
    }
    
    @IBAction func queue_Finance(){
        addQueue(queueDept: "Finance_Queue")
        vpu_queueBtn.isHidden = true
        registar_queueBtn.isHidden = true
        finance_queueBtn.isHidden = true
        print("Queue Finance Clicked!")
    }
    
    @IBAction func queue_Registar(){
        addQueue(queueDept: "Registar_Queue")
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
            
            
            let docRef = self.database.document("Queue_List/\(queueDept)/Student_List/\(String(Queue+1))")
            docRef.setData(["name" : name,
                            "id" : id,
                            "queueNumber" : (Queue+1),
                            "timeQueue" : dateformatter.string(from: Date())])
            
            docRefAll.setData(["totalQueue" : Queue+1])
            
        }
        
        checkpersonalQueue()
        
        
        
        
    }
    


}

