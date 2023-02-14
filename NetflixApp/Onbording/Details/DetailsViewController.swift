//
//  DetailsViewController.swift
//  NetflixApp
//
//  Created by Mac on 06/02/23.
//

import UIKit

class DetailsViewController: BaseViewController {

    @IBOutlet weak var detailsview: DetailsView!
    var detailsviewmodel: DetailsViewModel = DetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailsview.delegate = self
        detailsviewmodel.delegate = self
        detailsview.banner = detailsviewmodel.banner
        detailsview.setupUI()
        detailsviewmodel.getDetails()
        detailsview.updateUI()
    }
    

}
extension DetailsViewController: DetailsViewDelegate {
    func cloeTapped() {
        DispatchQueue.main.async {
//            let controller = Controller.TabBar.getController()
//            self.navigationController?.pushViewController(controller, animated: true)
            self.navigationController?.popViewController(animated: true)
        }
    }
}

extension DetailsViewController: DetailsViewModelDelegate {
    func updateUI() {
        detailsview.seriesDetails = detailsviewmodel.seriesDetails
        detailsview.movieDetails = detailsviewmodel.movieDetails
        detailsview.relatedContent = detailsviewmodel.relatedContent
        detailsview.updateUI()
    }
}
