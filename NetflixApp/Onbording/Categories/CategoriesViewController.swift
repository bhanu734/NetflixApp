//
//  CategoriesViewController.swift
//  NetflixApp
//
//  Created by Mac on 24/01/23.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var categoriesview: CategoriesView!
    var categoriesviewmodel: CategoriesViewModel = CategoriesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoriesview.delegate = self
        categoriesview.setupUI()
//        categoriesview.categoriesdata = categoriesviewmodel.categoriesdata
        categoriesview.updateUI()
        
    }
 
}
extension CategoriesViewController: CategoriesViewDelegate {
    func closeTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    
}
