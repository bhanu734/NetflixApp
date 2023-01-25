//
//  SubCategorieTableViewCell.swift
//  NetflixApp
//
//  Created by Mac on 25/01/23.
//

import UIKit

class SubCategorieTableViewCell: UITableViewCell {

    @IBOutlet weak var sublabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        sublabel.textColor = Colors.shared.whiteTextcolor
    }

    func configureUI(text: String){
        sublabel.text = text
    }
}
