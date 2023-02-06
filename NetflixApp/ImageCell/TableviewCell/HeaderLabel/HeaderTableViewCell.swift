//
//  HeaderTableViewCell.swift
//  NetflixApp
//
//  Created by Mac on 05/02/23.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var labeloutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
 
    func setupUI() {
        
        labeloutlet.textColor = Colors.shared.whiteTextcolor
        labeloutlet.font = Font.shared.bold5
        
    }
    
    func configUI(text: String) {
        labeloutlet.text = text
    }
}
