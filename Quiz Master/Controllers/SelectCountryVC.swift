//
//  SelectCountryVC.swift
//  Quiz Master
//
//  Created by Afnan Ahmed on 17/12/2023.
//

import UIKit

class SelectCountryVC: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
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
    
    @IBAction func SelectContinentBtnPressed(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "SelectVC") as! SelectVC
        vc.root = "Continent"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func selectCountryBtnPressed(_ sender: Any) {
        
        let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "SelectVC") as! SelectVC
        vc.root = "Country"
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
