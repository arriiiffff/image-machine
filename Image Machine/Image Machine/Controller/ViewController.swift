//
//  ViewController.swift
//  Image Machine
//
//  Created by Muhammad Arif on 23/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var machineData: [MachineModel] = []
    var sorted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configureTable()
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: "SavedMachine") {
            if let array = try? PropertyListDecoder().decode([MachineModel].self, from: data) {
                self.machineData = array
                self.tableView.reloadData()
            }
        }
    }
    
    func sort() {
        self.machineData = self.machineData.sorted(by: { machineData, machineData1 in
            if let name = machineData.machineName, let name1 = machineData1.machineName {
                return name > name1
            } else {
                return true
            }
        })
        self.sorted = !self.sorted
        self.tableView.reloadData()
    }
    
    func configureTable() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
        self.tableView.register(UINib(nibName: "ViewCell", bundle: self.nibBundle), forCellReuseIdentifier: "ViewCell")
    }
    
    @IBAction func btnSort(_ sender: UIButton) {
        if self.sorted == true {
            self.machineData = self.machineData.reversed()
            self.sorted = false
            self.tableView.reloadData()
        } else {
            self.sort()
        }
    }
    
    @IBAction func btnAddMachine(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "AddMachine", bundle: self.nibBundle)
        let vc = storyboard.instantiateInitialViewController() as? AddMachineViewController ?? AddMachineViewController()
        vc.machineData = self.machineData
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.machineData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewCell", for: indexPath) as! ViewCell
        cell.selectionStyle = .none
        cell.configureData(data: self.machineData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Detail", bundle: self.nibBundle)
        let vc = storyboard.instantiateInitialViewController() as? DetailViewController ?? DetailViewController()
        vc.data = self.machineData[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.machineData.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
    }
}

