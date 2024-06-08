//
//  SelectVC.swift
//  Quiz Master
//
//  Created by Afnan Ahmed on 19/12/2023.
//

import UIKit

class SelectVC: UIViewController {

    @IBOutlet weak var selectTV: UITableView!
    
    @IBOutlet weak var LevelLBL: UILabel!
    @IBOutlet weak var textfieldView: UIView!
    @IBOutlet weak var tableviewHeight: NSLayoutConstraint!
    @IBOutlet weak var TxtfieldLBL: UILabel!
    @IBOutlet weak var fieldTitelLBL: UILabel!
    @IBOutlet weak var titleLbL: UILabel!
    var index = -1
    var root = ""
    
    var country = ["Pakistan", "India", "Kenya", "South Africa", "Greece", "Monaco", "Australia", "Brazil", "Chile",]
    var continent = ["Asia", "Australia", "Africa", "Europe", "South America",]
    var temparr = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let selectedIdentifier = UserDefaults.standard.string(forKey: "Level")
        {
            var temp = (Int(selectedIdentifier) ?? 0)/3000
            temp = temp+1
            LevelLBL.text = "Level \(temp)"
        }
        
        
        
        temparr = []
        if root == "Continent"
        {
            titleLbL.text = "Select continent"
            fieldTitelLBL.text = root
            TxtfieldLBL.text = "Choose continent..."
            temparr = continent
        }
        else
        {
            titleLbL.text = "Select country"
            fieldTitelLBL.text = root
            TxtfieldLBL.text = "Choose country..."
            temparr = country
        }
        
        
        selectTV.delegate = self
        selectTV.dataSource = self
        selectTV.register(UINib(nibName: "SelectTVC", bundle: .main), forCellReuseIdentifier: "SelectTVC")
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        textfieldView.addGestureRecognizer(tapGesture)
                
                // Enable user interaction for the view
        textfieldView.isUserInteractionEnabled = true
        
        
    }
    
    @IBAction func goBtnPressed(_ sender: Any) {
        
        if TxtfieldLBL.text == "Choose country..." || TxtfieldLBL.text == "Choose continent..."
        {
            textfieldView.layer.borderWidth = 1
            textfieldView.layer.borderColor = UIColor.red.cgColor
        }
        else
        {
            let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "TakeQuizVC") as! TakeQuizVC
            vc.selected = TxtfieldLBL.text ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        
        textfieldView.layer.borderWidth = 0
        if selectTV.isHidden == true
        {
            selectTV.isHidden = false
        }
        else{
            selectTV.isHidden = true
        }
        
    }
    
}
extension SelectVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return temparr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectTVC", for: indexPath) as! SelectTVC
        
        if index == indexPath.row
        {
            cell.imageview.image = UIImage(named: "Selected")
        }
        else
        {
            cell.imageview.image = UIImage(named: "Unselected")

        }
        
        cell.TitleLBL.text = temparr[indexPath.row]
        cell.buttonTappedCallback = { [self] in
//            
            TxtfieldLBL.text = temparr[indexPath.row]
            TxtfieldLBL.textColor = .black
            index = indexPath.row
            selectTV.reloadData()
            selectTV.isHidden = true
         }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 30
        }
}

