//
//  TabBarViewController.swift
//  Image Machine
//
//  Created by Muhammad Arif on 23/09/21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.configureView()
    }
    

    private func configureView() {
        let homeStoryboard = UIStoryboard(name: "Main", bundle: self.nibBundle)
        let homeVC = homeStoryboard.instantiateInitialViewController() as? ViewController ?? ViewController()
        
//        let fir = FirstVC()
//        self.window?.rootViewController = UINavigationController(rootViewController: fir)
        
//        let codeReaderStoryboard = UIStoryboard(name: "Main", bundle: self.nibBundle)
        let codeReaderVC = QRCodeViewController()
        
        let rootHomeVC = UINavigationController(rootViewController: homeVC)
        rootHomeVC.tabBarItem = UITabBarItem(title: "Machine Data", image: UIImage(named: "ic-home"), selectedImage: UIImage(named: "ic-home"))
        
        let rootCodeReaderVC = UINavigationController(rootViewController: codeReaderVC)
        rootCodeReaderVC.tabBarItem = UITabBarItem(title: "Code Reader", image: UIImage(named: "ic-camera"), selectedImage: UIImage(named: "ic-camera"))
        
        
        self.viewControllers = [rootHomeVC, rootCodeReaderVC]
    
    }

}
