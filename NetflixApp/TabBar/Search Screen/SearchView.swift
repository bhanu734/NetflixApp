//
//  SearchView.swift
//  NetflixApp
//
//  Created by Mac on 29/01/23.
//

import UIKit

class SearchView: UIView {

    @IBOutlet weak var backgroundview: UIView!
    @IBOutlet weak var topview: UIView!
    @IBOutlet weak var cancelbutton: UIButton!
    @IBOutlet weak var searchtableview: UITableView!
    @IBOutlet weak var scopeimage: UIImageView!
    @IBOutlet weak var searchtextfeild: UITextField!
    @IBOutlet weak var scopeleading: NSLayoutConstraint!
    
    var leadingconstant: CGFloat = (SCREENWIDTH/2) - 55
    
    func setupUI() {
        cancelbutton.isHidden = true
        
        scopeleading.constant = leadingconstant
        backgroundview.backgroundColor = Colors.shared.blackcolor
        searchtableview.backgroundColor = Colors.shared.blackcolor
        topview.backgroundColor = Colors.shared.darkgreycolor
        topview.layer.cornerRadius = 10.0
        
        searchtextfeild.attributedPlaceholder = NSAttributedString(string: Strings.shared.Search ,attributes: [NSAttributedString.Key.foregroundColor: Colors.shared.lightgreycolor , NSAttributedString.Key.font: Font.shared.semibold2 ])
        
        cancelbutton.setTitle(Strings.shared.cancel, for: .normal)
        cancelbutton.setTitleColor(Colors.shared.whiteTextcolor, for: .normal)
        
        scopeimage.image = Images.shared.scope?.withRenderingMode(.alwaysTemplate)
        scopeimage.tintColor = Colors.shared.lightgreycolor
    }
    @IBAction func cancelTapped() {
        cancelbutton.isHidden = true
        scopeleading.constant = leadingconstant
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
        searchtextfeild.resignFirstResponder()
    }
    @IBAction func startSearch() {
        cancelbutton.isHidden = false
        scopeleading.constant = 10
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
        searchtextfeild.becomeFirstResponder()
    }
}
