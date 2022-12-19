//
//  ResetPasswordView.swift
//  NetflixApp
//
//  Created by Mac on 16/12/22.
//

import UIKit
protocol ResetPasswordViewDelegate {
    func submitTapped(password: String?, confirmpassword: String?)
    func backTapped()
}
class ResetPasswordView: UIView {
    
    var delegate: ResetPasswordViewDelegate?
    
    @IBOutlet weak var stackview: UIStackView!
    @IBOutlet weak var backview: UIView!
    @IBOutlet weak var logoimage: UIImageView!
    @IBOutlet weak var newpasswordtextview: UIView!
    @IBOutlet weak var newpasswordtextfield: UITextField!
    @IBOutlet weak var confirmpasswordtextview: UIView!
    @IBOutlet weak var confirmpasswordtextfield: UITextField!
    @IBOutlet weak var submitbutton: UIButton!
    @IBOutlet weak var stackandview : UIView!
    @IBOutlet weak var backbutton: UIButton!
    @IBOutlet weak var backbuttonimageview: UIImageView!
    
    func setupUI() {
        
        logoimage.image = Images.shared.netflixlogo
        logoimage.contentMode = .scaleAspectFill
        backview.backgroundColor = Colors.shared.blackcolor
        stackview.backgroundColor = Colors.shared.blackcolor
        stackandview.backgroundColor = Colors.shared.blackcolor
 
        Submit()
        setupTextfeild(textfield: newpasswordtextfield, textview: newpasswordtextview, placeholder: Strings.shared.newpassword)
        setupTextfeild(textfield: confirmpasswordtextfield, textview: confirmpasswordtextview, placeholder: Strings.shared.confirmpassword)
        cheveronback()
    }
    func setupTextfeild(textfield: UITextField, textview: UIView, placeholder: String) {
        textfield.placeholder = Strings.shared.email
        textfield.textColor = Colors.shared.whiteTextcolor
        textfield.backgroundColor = Colors.shared.darkgreycolor
        textfield.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textfield.font = Font.shared.medium4
        textfield.tintColor = Colors.shared.whiteTextcolor
        textview.backgroundColor = Colors.shared.darkgreycolor
        textview.layer.cornerRadius = 10.0
    }
    func Submit() {
        submitbutton.setTitleColor(Colors.shared.whiteTextcolor, for: .normal)
        submitbutton.titleLabel?.font = Font.shared.bold5
        submitbutton.layer.cornerRadius = 10.0
        submitbutton.setTitle(Strings.shared.submit, for: .normal)
        submitbutton.backgroundColor = Colors.shared.redbuttoncolor
        
    }
    func cheveronback() {
        
        backbuttonimageview.image = UIImage.init(systemName: Strings.shared.cheveronback)
        backbuttonimageview.tintColor = Colors.shared.whiteTextcolor
        backbuttonimageview.backgroundColor = Colors.shared.blackcolor
    }
    
    @IBAction func submitTapped() {
        delegate?.submitTapped(password: newpasswordtextfield.text, confirmpassword: confirmpasswordtextfield.text)
    }
    @IBAction func backTapped() {
        delegate?.backTapped()
    }
}
