//
//  ResultVC.swift
//  Quiz Master
//
//  Created by Afnan Ahmed on 24/12/2023.
//

import UIKit

class ResultVC: UIViewController, UIGestureRecognizerDelegate {
    
    var iosCode = ""
    var currency = ""
    var prefix = ""
    var continent = ""
    var capital = ""
    var language = ""
    var flag = ""
    
    var results = 0
    var decwidth = 0.0
    var viewwidth = 0.0
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var LevelLBL: UILabel!
    @IBOutlet weak var widthOfScreView: NSLayoutConstraint!
    @IBOutlet weak var scoreLBL: UILabel!
    @IBOutlet weak var scoreView: UIView!
    @IBOutlet weak var congratesImageView: UIImageView!
    @IBOutlet weak var isoCodeimage: UIImageView!
    @IBOutlet weak var isoCodeLBL: UILabel!
    @IBOutlet weak var tryAgainBtnPressed: UILabel!
    @IBOutlet weak var backToMenuBtnPressed: UILabel!
    @IBOutlet weak var bUttonStackview: UIStackView!
    @IBOutlet weak var currencyImage: UIImageView!
    @IBOutlet weak var prefixImage: UIImageView!
    @IBOutlet weak var continentImage: UIImageView!
    @IBOutlet weak var capitalImage: UIImageView!
    @IBOutlet weak var languageImage: UIImageView!
    @IBOutlet weak var currencyLBL: UILabel!
    @IBOutlet weak var prefixLBL: UILabel!
    @IBOutlet weak var continentLBL: UILabel!
    @IBOutlet weak var capitalLBL: UILabel!
    @IBOutlet weak var languageLBL: UILabel!
    
    var result = [QuizData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewwidth = view.frame.width - 32.0
        
        for i in 0..<data.count
        {
            result.append(data[i])

        }
        if let selectedIdentifier = UserDefaults.standard.string(forKey: "Level")
        {
            var temp = (Int(selectedIdentifier) ?? 0)/3000
            temp = temp+1
            LevelLBL.text = "Level \(temp)"
        }
        // Set the interactive pop gesture recognizer delegate to self
        navigationController?.interactivePopGestureRecognizer?.delegate = self

        // Enable the interactive pop gesture recognizer
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        configureUI()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true

    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        // Add your condition here to selectively enable or disable the pop gesture
        // For example, allow the pop gesture only on certain conditions:
        return shouldAllowPopGesture()
    }

    func shouldAllowPopGesture() -> Bool {
        // Add your logic to determine whether to allow the pop gesture
        // For example, you might want to allow the pop gesture on specific screens
        // Return true if the pop gesture should be allowed, false otherwise
        return true
    }
    
    @IBAction func backToBtnPressed(_ sender: Any) {
        if let viewControllers = navigationController?.viewControllers, viewControllers.count > 3 {

                    let targetIndex = viewControllers.count - 4 // 3 screens + 1 for zero-based index
                   navigationController?.popToViewController(viewControllers[targetIndex], animated: true)
               }
    }
    @IBAction func tryagainBtnPressed1(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func configureUI()
    {
        for i in 0..<result.count
        {
            if result[i].flag == flag{
                
                if iosCode == result[i].iosCode
                {
                    results = results + 1
                    isoCodeimage.image = UIImage(named: "true")
                    isoCodeLBL.text = result[i].iosCode
                }
                else
                {
                    isoCodeimage.image = UIImage(named: "flase")
                    isoCodeLBL.text = result[i].iosCode
                    isoCodeLBL.textColor = UIColor(named: "wrongText")
                }
                if currency == result[i].currency
                {
                    results = results + 1
                    currencyImage.image = UIImage(named: "true")
                    currencyLBL.text = result[i].currency
                }
                else
                {
                    currencyImage.image = UIImage(named: "flase")
                    currencyLBL.text = result[i].currency
                    currencyLBL.textColor = UIColor(named: "wrongText")
                }
                if prefix == result[i].prefix
                {
                    results = results + 1
                    prefixImage.image = UIImage(named: "true")
                    prefixLBL.text = result[i].prefix
                }
                else
                {
                    prefixImage.image = UIImage(named: "flase")
                    prefixLBL.text = result[i].prefix
                    prefixLBL.textColor = UIColor(named: "wrongText")
                }
                
                if continent == result[i].contient
                {
                    results = results + 1
                    continentImage.image = UIImage(named: "true")
                    continentLBL.text = result[i].contient
                }
                else
                {
                    continentImage.image = UIImage(named: "flase")
                    continentLBL.text = result[i].contient
                    continentLBL.textColor = UIColor(named: "wrongText")
                }
                if capital == result[i].capital
                {
                    results = results + 1
                    capitalImage.image = UIImage(named: "true")
                    capitalLBL.text = result[i].capital
                }
                else
                {
                    capitalImage.image = UIImage(named: "flase")
                    capitalLBL.text = result[i].capital
                    capitalLBL.textColor = UIColor(named: "wrongText")
                }
                if language == result[i].language
                {
                    results = results + 1
                    languageImage.image = UIImage(named: "true")
                    languageLBL.text = result[i].language
                }
                else
                {
                    languageImage.image = UIImage(named: "flase")
                    languageLBL.text = result[i].language
                    languageLBL.textColor = UIColor(named: "wrongText")
                }
                
                titleLBL.text = "Result: \(results)/6"
                
                if results == 6
                {
                    congratesImageView.isHidden = false
                    bUttonStackview.isHidden = true
                    backToMenuBtnPressed.isHidden = true
                    tryAgainBtnPressed.isHidden = true
                    scoreLBL.text = "\(500) exp."
                    
                    widthOfScreView.constant = CGFloat(viewwidth)
                    UIView.animate(withDuration: 0.0) {
                        self.view.layoutIfNeeded()
                    }
                    
                    if let selectedIdentifier = UserDefaults.standard.string(forKey: "Level")
                    {
                        UserDefaults.standard.set((Int(selectedIdentifier) ?? 0) + 400, forKey: "Level")
                    }
                    else{
                        UserDefaults.standard.set(400, forKey: "Level")
                    }

                }
                else
                {
                    congratesImageView.isHidden = true
                    bUttonStackview.isHidden = false
                    backToMenuBtnPressed.isHidden = false
                    tryAgainBtnPressed.isHidden = false
                    scoreLBL.text = "\(83 * results) exp."
                    decwidth = viewwidth/6
                    viewwidth = decwidth * Double(results)
                    widthOfScreView.constant = CGFloat(viewwidth)

                    UIView.animate(withDuration: 0.0) {
                        self.view.layoutIfNeeded()
                    }
                                        
                    if let selectedIdentifier = UserDefaults.standard.string(forKey: "Level")
                    {
                        let temp = (83 * results)
                        UserDefaults.standard.set((Int(selectedIdentifier) ?? 0) + temp - 70, forKey: "Level")
                    }
                    else{
                        UserDefaults.standard.set((83 * results), forKey: "Level")
                    }
                }
            }
        }
    }
}
