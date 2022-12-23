//
//  CreateProfileView.swift
//  NetflixApp
//
//  Created by Mac on 19/12/22.
//

import UIKit

protocol CreateProfileViewDelegate {
    func ProfileImageTapped()
    func createbuttonTapped(profilename: String?, profileimage: String?)
}

class CreateProfileView: UIView {

    @IBOutlet weak var logoimage: UIImageView!
    @IBOutlet weak var profilename_view: UIView!
    @IBOutlet weak var profilename_textfield: UITextField!
    @IBOutlet weak var createbutton: UIButton!
    @IBOutlet weak var profilelabel: UILabel!
    @IBOutlet weak var profile_imageview: UIView!
    @IBOutlet weak var profile_image: UIImageView!
    @IBOutlet weak var profile_button: UIButton!
    @IBOutlet weak var profile_tick_imageview: UIImageView!
    @IBOutlet weak var createprofileBg: UIView!

    var delegate: CreateProfileViewDelegate?
    
    func setupUI() {
        
        logoimage.image = Images.shared.netflixlogo
        logoimage.contentMode = .scaleAspectFill
        
        createprofileBg.backgroundColor = Colors.shared.blackcolor
        
        profile_imageview.backgroundColor = Colors.shared.darkgreycolor
        profile_imageview.layer.cornerRadius = 5.0
        profile_image.image = UIImage(named: "profile1")
        
        profile_tick_imageview.image = Images.shared.editimage
        profile_tick_imageview.tintColor = Colors.shared.whiteimagecolor
        
        CreateButton()
        profilelabeltext()
        setupTextfeild()
    }
    func setupTextfeild() {
        profilename_textfield.placeholder = Strings.shared.email
        profilename_textfield.textColor = Colors.shared.whiteTextcolor
        profilename_textfield.backgroundColor = Colors.shared.darkgreycolor
        profilename_textfield.attributedPlaceholder = NSAttributedString(string: Strings.shared.create_profile_name, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        profilename_textfield.font = Font.shared.medium4
        profilename_textfield.tintColor = Colors.shared.whiteTextcolor
        profilename_view.backgroundColor = Colors.shared.darkgreycolor
        profilename_view.layer.cornerRadius = 10.0
    }
    func CreateButton() {
        createbutton.setTitleColor(Colors.shared.whiteTextcolor, for: .normal)
        createbutton.titleLabel?.font = Font.shared.bold5
        createbutton.layer.cornerRadius = 10.0
        createbutton.setTitle(Strings.shared.create, for: .normal)
        createbutton.backgroundColor = Colors.shared.redbuttoncolor
    }
    func profilelabeltext(){
        
        profilelabel.tintColor = Colors.shared.whiteTextcolor
        profilelabel.font = Font.shared.bold4
        profilelabel.textColor = Colors.shared.whiteTextcolor
        profilelabel.text = Strings.shared.create_profile_label
    }
    
    func updateUI(image: String) {
        profile_image.image = UIImage(named: image)
    }
    
    @IBAction func ProfileImageTapped() {
        delegate?.ProfileImageTapped()
    }
    
    @IBAction func CreateButtonTapped() {
        
    }
}
