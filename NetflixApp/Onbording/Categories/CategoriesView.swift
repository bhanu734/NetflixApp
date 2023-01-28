//
//  CategoriesView.swift
//  NetflixApp
//
//  Created by Mac on 24/01/23.
//

import UIKit
protocol CategoriesViewDelegate {
    func closeTapped()
    func categorySelected(category: String)
}

class CategoriesView: UIView {

    @IBOutlet weak var blueview: UIView!
    @IBOutlet weak var closeview: UIView!
    @IBOutlet weak var closeimageview: UIImageView!
    @IBOutlet weak var categorietableview: UITableView!
    
    var delegate: CategoriesViewDelegate?
    var categoriesdata : [String] = []
    var categorytype: categoryType = .home
    
    func setupUI() {
        if categorytype == .home {
            categorietableview.contentInset = UIEdgeInsets(top: 240, left: 0, bottom: 0, right: 0)
        }else {
            categorietableview.contentInset = UIEdgeInsets(top: 30, left: 0, bottom: 140, right: 0)
        }
        
        backgroundColor = Colors.shared.clearcolor
        
        blueview.backgroundColor = Colors.shared.clearcolor
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = blueview.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blueview.addSubview(blurEffectView)
       
        categorietableview.backgroundColor = Colors.shared.clearcolor
        closeview.backgroundColor = Colors.shared.clearcolor
        closeimageview.image = Images.shared.crossimagefill?.withRenderingMode(.alwaysTemplate)
        closeimageview.tintColor = Colors.shared.whiteimagecolor
        
        
        categorietableview.register(UINib(nibName: "SubCategorieTableViewCell", bundle: nil), forCellReuseIdentifier: "SubCategorieTableViewCell")
        categorietableview.delegate = self
        categorietableview.dataSource = self
    
        
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.categorySelected(category: categoriesdata[indexPath.row])
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
extension CategoriesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = categorietableview.dequeueReusableCell(withIdentifier: "SubCategorieTableViewCell", for: indexPath) as? SubCategorieTableViewCell {
            cell.configureUI(textname: categoriesdata[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    
}
