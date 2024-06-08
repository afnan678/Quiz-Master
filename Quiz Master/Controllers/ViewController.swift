//
//  ViewController.swift
//  Quiz Master
//
//  Created by Afnan Ahmed on 17/12/2023.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return shouldAllowPopGesture()
    }

    func shouldAllowPopGesture() -> Bool {
        return true
    }
    @IBAction func startBtnPressed(_ sender: Any) {
        
        let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "SelectCountryVC") as! SelectCountryVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

