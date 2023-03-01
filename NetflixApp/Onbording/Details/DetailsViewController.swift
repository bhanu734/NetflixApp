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

        detailsviewmodel.delegate = self
        detailsview.delegate = self
        detailsview.setupUI()
        detailsviewmodel.getDetails()
        detailsview.isSeries = detailsviewmodel.isSeries
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
    
    func playTapped() {
        DispatchQueue.main.async {
           if let controller = Controller.playerscreen.getController() as? PlayerViewController {
            controller.playerviewmodel.banner = self.detailsviewmodel.banner
            controller.modalPresentationStyle = .overFullScreen
            self.present(controller, animated: true, completion: nil)
            }
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
