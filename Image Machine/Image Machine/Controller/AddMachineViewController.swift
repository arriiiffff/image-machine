//
//  AddMachineViewController.swift
//  Image Machine
//
//  Created by Muhammad Arif on 23/09/21.
//

import UIKit

class AddMachineViewController: UIViewController {
    
    @IBOutlet weak var machineNameLbl: UITextField!
    @IBOutlet weak var machineTypeLbl: UITextField!
    @IBOutlet weak var machineQRCodeNumber: UITextField!
    
    var machineData: [MachineModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddMachine(_ sender: UIButton) {
        let machineItem = MachineModel(machineId: "\(Date())", machineName: self.machineNameLbl.text ?? "", machineType: self.machineTypeLbl.text ?? "", machineQRCodeNumber: Int(self.machineQRCodeNumber.text ?? "0"), machineImage: self.machineQRCodeNumber.text ?? "0")
        self.machineData.append(machineItem)
        let array : [MachineModel] = self.machineData
            if let data = try? PropertyListEncoder().encode(array) {
                UserDefaults.standard.set(data, forKey: "SavedMachine")
            }
        self.navigationController?.popViewController(animated: true)
    }
}
