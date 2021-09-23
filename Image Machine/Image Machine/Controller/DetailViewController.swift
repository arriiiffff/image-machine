//
//  DetailViewController.swift
//  Image Machine
//
//  Created by Muhammad Arif on 23/09/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var qrImageView: UIImageView!
    @IBOutlet weak var machineNameLbl: UILabel!
    @IBOutlet weak var machineTypeLbl: UILabel!
    @IBOutlet weak var machineQRLbl: UILabel!
    
    var data: MachineModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configureData()
    }
    
    func configureData() {
        if let data = self.data {
            self.machineNameLbl.text = data.machineName
            self.machineTypeLbl.text = data.machineType
            self.machineQRLbl.text = "\(data.machineQRCodeNumber ?? 0)"
            self.qrImageView.image = UIImage(named: "qrcode")
        }
    }

}
