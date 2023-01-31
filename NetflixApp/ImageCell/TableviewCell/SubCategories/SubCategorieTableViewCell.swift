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
       
        backgroundColor = Colors.shared.clearcolor
        
        sublabel.textColor = Colors.shared.whiteTextcolor
//        sublabel.tintColor = Colors.shared.whiteimagecolor
        
    }

    func configureUI(textname: String){
        sublabel.text = textname
    }
}
