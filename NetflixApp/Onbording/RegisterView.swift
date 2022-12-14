//
//  RegisterView.swift
//  NetflixApp
//
//  Created by Mac on 12/12/22.
//

import UIKit

class RegisterView: UIView {
    @IBOutlet weak var stackview: UIStackView!
    @IBOutlet weak var backview: UIView!
    @IBOutlet weak var logoimage: UIImageView!
    @IBOutlet weak var emailtextview: UIView!
    @IBOutlet weak var emailtextfield: UITextField!
    @IBOutlet weak var passwordtextview: UIView!
    @IBOutlet weak var passwordtextfield: UITextField!
    @IBOutlet weak var confirmpasswordtextview: UIView!
    @IBOutlet weak var confirmpasswordtextfield: UITextField!
    @IBOutlet weak var dateofbirthtextview: UIView!
    @IBOutlet weak var dateofbirthtextfield: UITextField!
    @IBOutlet weak var registerbutton: UIButton!
    @IBOutlet weak var signinbutton: UIButton!
    @IBOutlet weak var infolabel: UILabel!
    @IBOutlet weak var stackandview : UIView!
    
    func setupUI() {
        
        logoimage.image = Images.shared.netflixlogo
        logoimage.contentMode = .scaleAspectFill
        backview.backgroundColor = Colors.shared.blackcolor
        stackview.backgroundColor = Colors.shared.blackcolor
        stackandview.backgroundColor = Colors.shared.blackcolor
//        email()
//        password()
//        confirmpassword()
//        Dob()
        register()
        signin()
        labeltext()
        setupTextfeild(textfield: emailtextfield, textview: emailtextview, placeholder: Strings.shared.email)
        setupTextfeild(textfield: passwordtextfield, textview: passwordtextview, placeholder: Strings.shared.password)
        setupTextfeild(textfield: confirmpasswordtextfield, textview: confirmpasswordtextview, placeholder: Strings.shared.confirmpassword)
        setupTextfeild(textfield: dateofbirthtextfield, textview: dateofbirthtextview, placeholder: Strings.shared.Dob)
        
    }
    
    func setupTextfeild(textfield: UITextField, textview: UIView, placeholder: String) {
        textfield.placeholder = Strings.shared.email
        textfield.textColor = Colors.shared.whiteTextcolor
        textfield.backgroundColor = Colors.shared.darkgreycolor
        textfield.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        textfield.font = Font.shared.medium2
        textfield.tintColor = Colors.shared.whiteTextcolor
        textview.backgroundColor = Colors.shared.darkgreycolor
        textview.layer.cornerRadius = 10.0
    }
    func register() {
        registerbutton.setTitleColor(Colors.shared.whiteTextcolor, for: .normal)
        registerbutton.titleLabel?.font = Font.shared.bold5
        registerbutton.layer.cornerRadius = 10.0
        registerbutton.setTitle(Strings.shared.register, for: .normal)
        registerbutton.backgroundColor = Colors.shared.redbuttoncolor
        
    }
    func signin() {
        signinbutton.setTitleColor(Colors.shared.whiteTextcolor, for: .normal)
        signinbutton.titleLabel?.font = Font.shared.bold5
        signinbutton.setTitle(Strings.shared.regsignin, for: .normal)
        signinbutton.backgroundColor = .clear
        signinbutton.layer.cornerRadius = 10.0
        signinbutton.layer.borderWidth = 2.0
        signinbutton.layer.borderColor = Colors.shared.redbordercolor
        
    }
    func labeltext(){
        
        infolabel.tintColor = Colors.shared.whiteTextcolor
        infolabel.font = Font.shared.medium2
        infolabel.textColor = Colors.shared.whiteTextcolor
        infolabel.text = Strings.shared.infolabeltext
    }
    
    @IBAction func registerTapped() {
        
    }
    @IBAction func siginTapped() {
        
    }
}
