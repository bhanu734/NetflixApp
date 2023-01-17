//
//  SplashViewController.swift
//  NetflixApp
//
//  Created by Mac on 23/12/22.
//

import UIKit

class SplashViewController: BaseViewController {

    @IBOutlet weak var splashview: SplashView!
    var splashviewmodel: SplashViewModel = SplashViewModel()
    
    var animationComplete: Bool = false
    var datafetchComplete: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        splashviewmodel.delegate = self
        splashview.delegate = self
        splashview.setupUI()
        splashviewmodel.getDetails()
    }
    override func viewDidAppear(_ animated: Bool) {
      
       
        splashview.animateGifimage()
        
    }
}
extension SplashViewController: SplashViewModelDelegate{
    func data_fetch_completed() {
        datafetchComplete = true
        if animationComplete {
            print("data fetch if called")
            if User.shared.userdetails?.profiles?.count ?? 1 >= 1 {
                DispatchQueue.main.async {
                    let controller = Controller.profileselection.getController()
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            }else {
                DispatchQueue.main.async {
                    print("data fetch else called")
                    let controller = Controller.createprofile.getController()
                    self.navigationController?.pushViewController(controller, animated: true)
                }
            }
        }
            
    }
    
    func goto_Login_vc() {
        datafetchComplete = true
        if animationComplete {
            DispatchQueue.main.async {
                let controller = Controller.register.getController()
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
    
    
}
extension SplashViewController: SplashViewDelegate{
    func animation_Completed() {
        animationComplete = true
        if datafetchComplete {
            if User.shared.isLogin {
                data_fetch_completed()
                
            } else {
                goto_Login_vc()
            }
             
        }
    }
 
    
    func goto_Welcome_Screen() {
        DispatchQueue.main.async {
            let controller = Controller.welcome.getController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
}
