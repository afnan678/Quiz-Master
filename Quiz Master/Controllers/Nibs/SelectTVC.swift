//
//  SelectTVC.swift
//  Quiz Master
//
//  Created by Afnan Ahmed on 19/12/2023.
//

import UIKit

class SelectTVC: UITableViewCell {
    var buttonTappedCallback: (() -> Void)?

    @IBOutlet weak var TitleLBL: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var selectBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func selectBtnPressed(_ sender: Any) {
        buttonTappedCallback?()
    }
}
