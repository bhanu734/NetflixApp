//
//  RegisterViewController.swift
//  NetflixApp
//
//  Created by Mac on 12/12/22.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var registerview: RegisterView!
    var registerviewmodel: RegisterViewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerview.setupUI()
    }
    


}
