//
//  ViewCell.swift
//  Image Machine
//
//  Created by Muhammad Arif on 23/09/21.
//

import Foundation
import UIKit

class ViewCell: UITableViewCell {
    
    @IBOutlet weak var barcodeImg: UIImageView!
    @IBOutlet weak var machineNameLbl: UILabel!
    @IBOutlet weak var machineTypeLbl: UILabel!
    @IBOutlet weak var barcodeNumberLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.barcodeImg.backgroundColor = .gray
    }
    
    func configureData(data: MachineModel) {
        self.machineNameLbl.text = data.machineName
        self.machineTypeLbl.text = data.machineType
        self.barcodeNumberLbl.text = "\(data.machineQRCodeNumber ?? 0)"
        switch data.machineQRCodeNumber {
        case 23090001:
            self.barcodeImg.image = UIImage(named: "qrcode")
        case 23090002:
            self.barcodeImg.image = UIImage(named: "qrcode2")
        case 23090003:
            self.barcodeImg.image = UIImage(named: "qrcode3")
        case 23090004:
            self.barcodeImg.image = UIImage(named: "qrcode4")
        case 23090005:
            self.barcodeImg.image = UIImage(named: "qrcode5")
        default:
            self.barcodeImg.image = UIImage(named: "qrcode")
        }
    }
    
}
