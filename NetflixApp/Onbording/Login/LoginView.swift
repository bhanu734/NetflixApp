//
//  LoginView.swift
//  NetflixApp
//
//  Created by Mac on 14/12/22.
//

import UIKit
protocol LoginViewDelegate {
    func siginTapped(email: String?, password: String?)
    func registerTapped()
    func forgotpasswordTapped()
    
}
class LoginView: UIView {

    var delegate: LoginViewDelegate?
    
    @IBOutlet weak var stackview: UIStackView!
    @IBOutlet weak var backview: UIView!
    @IBOutlet weak var logoimage: UIImageView!
    @IBOutlet weak var emailtextview: UIView!
    @IBOutlet weak var emailtextfield: UITextField!
    @IBOutlet weak var passwordtextview: UIView!
    @IBOutlet weak var passwordtextfield: UITextField!
    @IBOutlet weak var registerbutton: UIButton!
    @IBOutlet weak var forgotpasswordbutton: UIButton!
    @IBOutlet weak var signinbutton: UIButton!
    @IBOutlet weak var infolabel: UILabel!
    @IBOutlet weak var stackandview : UIView!
    
    func setupUI() {
        
        logoimage.image = Images.shared.netflixlogo
        logoimage.contentMode = .scaleAspectFill
        backview.backgroundColor = Colors.shared.blackcolor
        stackview.backgroundColor = Colors.shared.blackcolor
        stackandview.backgroundColor = Colors.shared.blackcolor
 
        register()
        signin()
        forgotpassword()
        labeltext()
        setupTextfeild(textfield: emailtextfield, textview: emailtextview, placeholder: Strings.shared.email)
        setupTextfeild(textfield: passwordtextfield, textview: passwordtextview, placeholder: Strings.shared.password)
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
    func forgotpassword() {
        forgotpasswordbutton.setTitleColor(Colors.shared.redbuttoncolor, for: .normal)
        forgotpasswordbutton.titleLabel?.font = Font.shared.medium3
        forgotpasswordbutton.setTitle(Strings.shared.forgot_password, for: .normal)
        forgotpasswordbutton.backgroundColor = Colors.shared.blackcolor
        
    }
    func signin() {
        signinbutton.setTitleColor(Colors.shared.whiteTextcolor, for: .normal)
        signinbutton.titleLabel?.font = Font.shared.bold5
        signinbutton.layer.cornerRadius = 10.0
        signinbutton.setTitle(Strings.shared.regsignin, for: .normal)
        signinbutton.backgroundColor = Colors.shared.redbuttoncolor
        
    }
    func register() {
        registerbutton.setTitleColor(Colors.shared.whiteTextcolor, for: .normal)
        registerbutton.titleLabel?.font = Font.shared.bold5
        registerbutton.setTitle(Strings.shared.register, for: .normal)
        registerbutton.backgroundColor = .clear
        registerbutton.layer.cornerRadius = 10.0
        registerbutton.layer.borderWidth = 2.0
        registerbutton.layer.borderColor = Colors.shared.redbordercolor
        
    }
    func labeltext(){
        
        infolabel.tintColor = Colors.shared.whiteTextcolor
        infolabel.font = Font.shared.medium2
        infolabel.textColor = Colors.shared.whiteTextcolor
        infolabel.text = Strings.shared.infolabeltext
    }

    @IBAction func registerTapped() {
        delegate?.registerTapped()
    }
    @IBAction func siginTapped() {
        delegate?.siginTapped(email: emailtextfield.text, password: passwordtextfield.text)
    }
    @IBAction func forgotpasswordTapped() {
        delegate?.forgotpasswordTapped()
    }
}
