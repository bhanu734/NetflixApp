//
//  CategoriesView.swift
//  NetflixApp
//
//  Created by Mac on 24/01/23.
//

import UIKit
protocol CategoriesViewDelegate {
    func closeTapped()
}

class CategoriesView: UIView {

    @IBOutlet weak var blueview: UIView!
    @IBOutlet weak var closeview: UIView!
    @IBOutlet weak var closeimageview: UIImageView!
    @IBOutlet weak var categorietableview: UITableView!
    
    var delegate: CategoriesViewDelegate?
//    var categoriesdata : [String?] = []
    func setupUI() {
        
        backgroundColor = Colors.shared.cleartcolor
        blueview.backgroundColor = Colors.shared.cleartcolor
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = blueview.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blueview.addSubview(blurEffectView)
        
        categorietableview.register(UINib(nibName: "SubCategorieTableViewCell", bundle: nil), forCellReuseIdentifier: "SubCategorieTableViewCell")
        categorietableview.delegate = self
        categorietableview.dataSource = self
        
        closeview.backgroundColor = Colors.shared.cleartcolor
        closeimageview.image = Images.shared.crossimagefill
        closeimageview.tintColor = Colors.shared.whiteimagecolor
        
    }
    @IBAction func closeTapped() {
        delegate?.closeTapped()
    }
    func updateUI() {
        DispatchQueue.main.async {
            self.categorietableview.reloadData()
        }
    }
}
extension CategoriesView: UITableViewDelegate {
    
}
extension CategoriesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0 //categoriesdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell = categorietableview.dequeueReusableCell(withIdentifier: "SubCategorieTableViewCell", for: indexPath) as? SubCategorieTableViewCell {
//            cell.configureUI(text: categoriesdata[indexPath.row])
//            return cell
//        }
        return UITableViewCell()
    }
    
    
}
