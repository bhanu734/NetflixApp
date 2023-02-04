//
//  AccountTableViewCell.swift
//  NetflixApp
//
//  Created by Mac on 04/02/23.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    @IBOutlet weak var leftimage: UIImageView!
    @IBOutlet weak var rightimage: UIImageView!
    @IBOutlet weak var settinglabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       setupUI()
    }

    func setupUI() {
        contentView.backgroundColor = Colors.shared.clearcolor
        backgroundColor = Colors.shared.darkgreycolor
        leftimage.backgroundColor = Colors.shared.clearcolor
        leftimage.tintColor = Colors.shared.lightgreycolor
        rightimage.image = Images.shared.chevronRight
        
        rightimage.backgroundColor = Colors.shared.clearcolor
        rightimage.tintColor = Colors.shared.lightgreycolor
        
        settinglabel.textColor = Colors.shared.whiteTextcolor
        settinglabel.font = Font.shared.semibold4
        
        
    }
    
    func configureUI(accountsetting: AccountSettings) {
        leftimage.image = accountsetting.image
        settinglabel.text = accountsetting.tittle
    }
}
