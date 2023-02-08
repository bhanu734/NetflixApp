//
//  DetailsViewController.swift
//  NetflixApp
//
//  Created by Mac on 06/02/23.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailsview: DetailsView!
    var detailsviewmodel: DetailsViewModel = DetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailsview.delegate = self
        detailsview.bannerdata = detailsviewmodel.bannerdata
        detailsview.setupUI()
        detailsview.updateUI()
    }
    

}
extension DetailsViewController: DetailsViewDelegate {
    func cloeTapped() {
        DispatchQueue.main.async {
            let controller = Controller.TabBar.getController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
