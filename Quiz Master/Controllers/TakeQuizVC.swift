//
//  TakeQuizVC.swift
//  Quiz Master
//
//  Created by Afnan Ahmed on 20/12/2023.
//

import UIKit

class TakeQuizVC: UIViewController {
    
    var selected = ""
    var flag = ""

    @IBOutlet weak var LevelLBL: UILabel!
    @IBOutlet weak var languageView: UIView!
    @IBOutlet weak var capitalView: UIView!
    @IBOutlet weak var continentView: UIView!
    @IBOutlet weak var numberPrefixView: UIView!
    @IBOutlet weak var numberPrefixLBL: UITextField!
    @IBOutlet weak var currencyView: UIView!
    @IBOutlet weak var iosCodeView: UIView!
    @IBOutlet weak var languageLBL: UITextField!
    @IBOutlet weak var capitalLBL: UITextField!
    @IBOutlet weak var continentLBL: UITextField!
    @IBOutlet weak var currencyLBL: UITextField!
    @IBOutlet weak var iosCodeLBL: UITextField!
    @IBOutlet weak var flag3: UIImageView!
    @IBOutlet weak var flag2: UIImageView!
    @IBOutlet weak var flag1: UIImageView!
    @IBOutlet weak var secondsLBL: UILabel!
    @IBOutlet weak var tileleftviewWidth: NSLayoutConstraint!
    @IBOutlet weak var timeleftView: UIView!
    @IBOutlet weak var TitleLBL: UILabel!
    
    var viewwidth = 0.0
     var timer: Timer?
     var secondsRemaining = 300
    var decwidth = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondsLBL.text = "\(secondsRemaining) sec."
        // Do any additional setup after loading the view.
        print(selected)
        TitleLBL.text = selected
        flag = selected
        
        if let selectedIdentifier = UserDefaults.standard.string(forKey: "Level")
        {
            var temp = (Int(selectedIdentifier) ?? 0)/3000
            temp = temp+1
            LevelLBL.text = "Level \(temp)"
        }
        viewwidth = view.frame.width - 32.0
        tileleftviewWidth.constant = CGFloat(viewwidth)
        decwidth = viewwidth/Double(secondsRemaining)
        UIView.animate(withDuration: 0.0) {
            self.view.layoutIfNeeded()
        }
        configureUI()
        startTimer()
    }
    @objc func flag1pressed(_ gesture: UITapGestureRecognizer) {
        
        flag1.layer.borderWidth = 1
        flag2.layer.borderWidth = 0
        flag3.layer.borderWidth = 0
        flag1.layer.borderColor = UIColor(named: "ParoteColor")?.cgColor
    }
    @objc func flag2pressed(_ gesture: UITapGestureRecognizer) {
        
        flag3.layer.borderWidth = 0
        flag1.layer.borderWidth = 0
        flag2.layer.borderWidth = 1
        flag2.layer.borderColor = UIColor(named: "ParoteColor")?.cgColor
        
    }
    @objc func flag3pressed(_ gesture: UITapGestureRecognizer) {
        
        flag1.layer.borderWidth = 0
        flag2.layer.borderWidth = 0
        flag3.layer.borderWidth = 1
        flag3.layer.borderColor = UIColor(named: "ParoteColor")?.cgColor
    }
    
    func checkCountry(image: UIImage)
    {
        if image == UIImage(named: "Pakistan")
        {
            flag = "Pakistan"
        }
        else if image == UIImage(named: "Australia")
        {
            flag = "Australia"
        }
        else if image == UIImage(named: "India")
        {
            flag = "India"
        }
        else if image == UIImage(named: "Kenya")
        {
            flag = "Kenya"
        }
        else if image == UIImage(named: "South Africa")
        {
            flag = "South Africa"
        }
        else if image == UIImage(named: "Greece")
        {
            flag = "Greece"
        }
        else if image == UIImage(named: "Monaco")
        {
            flag = "Monaco"
        }
        else if image == UIImage(named: "Brazil")
        {
            flag = "Brazil"
        }
        else if image == UIImage(named: "Chile")
        {
            flag = "Chile"
        }
    }    
    // Function to start the timer
      func startTimer() {
          timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
      }
      
      // Function called every second to update the timer
      @objc func updateTimer() {
          if secondsRemaining > 0 {
              secondsRemaining -= 1
              viewwidth = viewwidth - decwidth
              print("\(secondsRemaining) seconds remaining")
              secondsLBL.text = "\(secondsRemaining) sec."
              tileleftviewWidth.constant = CGFloat(viewwidth)

              UIView.animate(withDuration: 0.0) {
                  self.view.layoutIfNeeded()
              }

          } else {
              timer?.invalidate()
              print("Timer completed!")
          }
      }
    
    @IBAction func doneBtnPressed(_ sender: Any) {
        
        if (iosCodeLBL.text == "") || iosCodeLBL.text == " " || iosCodeLBL.text == "  " || iosCodeLBL.text == "   "
        {
            iosCodeView.layer.borderWidth = 1
            iosCodeView.layer.borderColor = UIColor.red.cgColor
        }
        else{
            iosCodeView.layer.borderWidth = 0
            if (currencyLBL.text == "") || currencyLBL.text == " " || currencyLBL.text == "  " || currencyLBL.text == "   "
            {
                currencyView.layer.borderWidth = 1
                currencyView.layer.borderColor = UIColor.red.cgColor
            }
            else{
                currencyView.layer.borderWidth = 0
                if (numberPrefixLBL.text == "") || numberPrefixLBL.text == " " || numberPrefixLBL.text == "  " || numberPrefixLBL.text == "   "
                {
                    numberPrefixView.layer.borderWidth = 1
                    numberPrefixView.layer.borderColor = UIColor.red.cgColor
                }
                else{
                    numberPrefixView.layer.borderWidth = 0
                    if (continentLBL.text == "") || continentLBL.text == " " || continentLBL.text == "  " || continentLBL.text == "   "
                    {
                        continentView.layer.borderWidth = 1
                        continentView.layer.borderColor = UIColor.red.cgColor
                    }
                    else{
                        continentView.layer.borderWidth = 0
                        if (capitalLBL.text == "") || capitalLBL.text == " " || capitalLBL.text == "  " || capitalLBL.text == "   "
                        {
                            capitalView.layer.borderWidth = 1
                            capitalView.layer.borderColor = UIColor.red.cgColor
                        }
                        else{
                            capitalView.layer.borderWidth = 0
                            if (languageLBL.text == "") || languageLBL.text == " " || languageLBL.text == "  " || languageLBL.text == "   "
                            {
                                languageView.layer.borderWidth = 1
                                languageView.layer.borderColor = UIColor.red.cgColor
                            }
                            else{
                                languageView.layer.borderWidth = 0
                                let vc  = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "ResultVC") as! ResultVC
                                vc.iosCode = (iosCodeLBL.text ?? "").uppercased()
                                vc.currency = (currencyLBL.text ?? "").uppercased()
                                vc.prefix = numberPrefixLBL.text ?? ""
                                vc.continent = (continentLBL.text ?? "").capitalized
                                vc.capital = (capitalLBL.text ?? "").capitalized
                                vc.language = (languageLBL.text ?? "").capitalized
                                vc.flag = flag
                                navigationController?.pushViewController(vc, animated: true)
                            }
                        }
                    }
                }
            }
            
        }
        
    }
    
}



extension TakeQuizVC {
    
    func configureUI()
    {
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(flag1pressed(_:)))
        flag1.addGestureRecognizer(tapGesture1)
        flag1.isUserInteractionEnabled = true

        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(flag2pressed(_:)))
        flag2.addGestureRecognizer(tapGesture2)
        flag2.isUserInteractionEnabled = true
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(flag3pressed(_:)))
        flag3.addGestureRecognizer(tapGesture3)
        flag3.isUserInteractionEnabled = true
        
        
        
        if (selected == "Asia" || selected == "Australia" || selected == "Africa" || selected == "Europe" || selected == "South America")
        {
            
            if selected == "Asia"
            {
                let images1 = [UIImage(named: "Pakistan"),UIImage(named: "India"),UIImage(named: "Pakistan"),UIImage(named: "india")].Shuffled()
                let images2 = [UIImage(named: "Kenya"), UIImage(named: "South Africa"), UIImage(named: "Greece"), UIImage(named: "Monaco"), UIImage(named: "Australia"), UIImage(named: "Brazil"), UIImage(named: "Chile"),].Shuffled()
                checkCountry(image: (images1[0]!))
                let images = [images1[0],images2[0],images2[3]].Shuffled()
                flag1.image = images[0]
                flag2.image = images[1]
                flag3.image = images[2]

            }
            else if selected == "Australia"
            {
                
                let images1 = [UIImage(named: "Australia"),UIImage(named: "Australia"),UIImage(named: "Australia"),UIImage(named: "Australia")].Shuffled()
                let images2 = [UIImage(named: "Pakistan"), UIImage(named: "India"), UIImage(named: "Kenya"), UIImage(named: "South Africa"), UIImage(named: "Greece"), UIImage(named: "Monaco"), UIImage(named: "Pakistan"), UIImage(named: "Brazil"), UIImage(named: "Chile"),].Shuffled()
                let images = [images1[0],images2[0],images2[3]].Shuffled()
                checkCountry(image: (images1[0]!))
                flag1.image = images[0]
                flag2.image = images[1]
                flag3.image = images[2]
            }
            else if selected == "Africa"
            {
                let images1 = [UIImage(named: "Kenya"),UIImage(named: "South Africa"),UIImage(named: "Kenya"),UIImage(named: "South Africa")].Shuffled()
                let images2 = [UIImage(named: "Pakistan"), UIImage(named: "India"), UIImage(named: "Pakistan"), UIImage(named: "Chile"), UIImage(named: "Greece"), UIImage(named: "Monaco"), UIImage(named: "Australia"), UIImage(named: "Brazil"), UIImage(named: "Chile"),].Shuffled()
                let images = [images1[0],images2[0],images2[3]].Shuffled()
                checkCountry(image: (images1[0]!))
                flag1.image = images[0]
                flag2.image = images[1]
                flag3.image = images[2]
            }
            else if selected == "Europe"
            {
                let images1 = [UIImage(named: "Greece"),UIImage(named: "Monaco"),UIImage(named: "Greece"),UIImage(named: "Monaco")].Shuffled()
                let images2 = [UIImage(named: "Pakistan"), UIImage(named: "India"), UIImage(named: "Kenya"), UIImage(named: "South Africa"), UIImage(named: "Australia"), UIImage(named: "Pakistan"), UIImage(named: "Australia"), UIImage(named: "Brazil"), UIImage(named: "Chile"),].Shuffled()
                let images = [images1[0],images2[0],images2[3]].Shuffled()
                checkCountry(image: (images1[0]!))
                flag1.image = images[0]
                flag2.image = images[1]
                flag3.image = images[2]
            }
            else if selected == "South America"
            {
                let images1 = [UIImage(named: "Brazil"),UIImage(named: "Chile"),UIImage(named: "Brazil"),UIImage(named: "Chile")].Shuffled()
                let images2 = [UIImage(named: "Pakistan"), UIImage(named: "India"), UIImage(named: "Kenya"), UIImage(named: "South Africa"), UIImage(named: "Greece"), UIImage(named: "Monaco"), UIImage(named: "Australia"), UIImage(named: "Pakistan"), UIImage(named: "Australia"),].Shuffled()
                let images = [images1[0],images2[0],images2[3]].Shuffled()
                checkCountry(image: (images1[0]!))
                flag1.image = images[0]
                flag2.image = images[1]
                flag3.image = images[2]
            }
            
            
            
        }
        else
        {
            
            if selected == "Pakistan"
            {
                let images2 = [UIImage(named: "India"), UIImage(named: "India"), UIImage(named: "Kenya"), UIImage(named: "South Africa"), UIImage(named: "Greece"), UIImage(named: "Monaco"), UIImage(named: "Australia"), UIImage(named: "Brazil"), UIImage(named: "Chile"),].Shuffled()
                let images = [UIImage(named: "Pakistan"),images2[0],images2[3]].Shuffled()
                flag1.image = images[0]
                flag2.image = images[1]
                flag3.image = images[2]
            }
            else if selected == "India"
            {
                let images2 = [UIImage(named: "Pakistan"), UIImage(named: "Pakistan"), UIImage(named: "Kenya"), UIImage(named: "South Africa"), UIImage(named: "Greece"), UIImage(named: "Monaco"), UIImage(named: "Australia"), UIImage(named: "Brazil"), UIImage(named: "Chile"),].Shuffled()
                let images = [UIImage(named: "India"),images2[0],images2[3]].Shuffled()
                flag1.image = images[0]
                flag2.image = images[1]
                flag3.image = images[2]
            }
            else if selected == "Kenya"
            {
                let images2 = [UIImage(named: "Pakistan"), UIImage(named: "India"), UIImage(named: "Chile"), UIImage(named: "South Africa"), UIImage(named: "Greece"), UIImage(named: "Monaco"), UIImage(named: "Australia"), UIImage(named: "Brazil"), UIImage(named: "Chile"),].Shuffled()
                let images = [UIImage(named: "Kenya"),images2[0],images2[3]].Shuffled()
                flag1.image = images[0]
                flag2.image = images[1]
                flag3.image = images[2]
            }
            else if selected == "South Africa"
            {
                let images2 = [UIImage(named: "Pakistan"), UIImage(named: "India"), UIImage(named: "Kenya"), UIImage(named: "Brazil"), UIImage(named: "Greece"), UIImage(named: "Monaco"), UIImage(named: "Australia"), UIImage(named: "Brazil"), UIImage(named: "Chile"),].Shuffled()
                let images = [UIImage(named: "South Africa"),images2[0],images2[3]].Shuffled()
                flag1.image = images[0]
                flag2.image = images[1]
                flag3.image = images[2]
            }
            else if selected == "Greece"
            {
                let images2 = [UIImage(named: "Pakistan"), UIImage(named: "India"), UIImage(named: "Kenya"), UIImage(named: "South Africa"), UIImage(named: "Monaco"), UIImage(named: "Monaco"), UIImage(named: "Australia"), UIImage(named: "Brazil"), UIImage(named: "Chile"),].Shuffled()
                let images = [UIImage(named: "Greece"),images2[0],images2[3]].Shuffled()
                flag1.image = images[0]
                flag2.image = images[1]
                flag3.image = images[2]
            }
            else if selected == "Monaco"
            {
                let images2 = [UIImage(named: "Pakistan"), UIImage(named: "India"), UIImage(named: "Kenya"), UIImage(named: "South Africa"), UIImage(named: "Greece"), UIImage(named: "Greece"), UIImage(named: "Australia"), UIImage(named: "Brazil"), UIImage(named: "Chile"),].Shuffled()
                let images = [UIImage(named: "Monaco"),images2[0],images2[3]].Shuffled()
                flag1.image = images[0]
                flag2.image = images[1]
                flag3.image = images[2]
            }
            else if selected == "Australia"
            {
                let images2 = [UIImage(named: "Pakistan"), UIImage(named: "India"), UIImage(named: "Kenya"), UIImage(named: "South Africa"), UIImage(named: "Greece"), UIImage(named: "Monaco"), UIImage(named: "Pakistan"), UIImage(named: "Brazil"), UIImage(named: "Chile"),].Shuffled()
                let images = [UIImage(named: "Australia"),images2[0],images2[3]].Shuffled()
                flag1.image = images[0]
                flag2.image = images[1]
                flag3.image = images[2]
            }
            else if selected == "Brazil"
            {
                let images2 = [UIImage(named: "Pakistan"), UIImage(named: "India"), UIImage(named: "Kenya"), UIImage(named: "South Africa"), UIImage(named: "Greece"), UIImage(named: "Monaco"), UIImage(named: "Australia"), UIImage(named: "Australia"), UIImage(named: "Chile"),].Shuffled()
                let images = [UIImage(named: "Brazil"),images2[0],images2[3]].Shuffled()
                flag1.image = images[0]
                flag2.image = images[1]
                flag3.image = images[2]
            }
            else if selected == "Chile"
            {
                let images2 = [UIImage(named: "Pakistan"), UIImage(named: "India"), UIImage(named: "Kenya"), UIImage(named: "South Africa"), UIImage(named: "Greece"), UIImage(named: "Monaco"), UIImage(named: "Australia"), UIImage(named: "Brazil"), UIImage(named: "Brazil"),].Shuffled()
                let images = [UIImage(named: "Chile"),images2[0],images2[3]].Shuffled()
                flag1.image = images[0]
                flag2.image = images[1]
                flag3.image = images[2]
            }
            
            
        }
    }
}
