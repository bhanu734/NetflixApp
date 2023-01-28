//
//  CategoriesViewController.swift
//  NetflixApp
//
//  Created by Mac on 24/01/23.
//

import UIKit
protocol CategoriesViewControllerDelegate {
    func categoryTapped(category: String, categorytype: categoryType)
}

class CategoriesViewController: UIViewController {

    @IBOutlet weak var categoriesview: CategoriesView!
    var categoriesviewmodel: CategoriesViewModel = CategoriesViewModel()
    
    var delegate: CategoriesViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoriesview.delegate = self
        categoriesview.setupUI()
        categoriesviewmodel.getData()
        categoriesview.categoriesdata = categoriesviewmodel.categoriesdata
        
        categoriesview.updateUI()
        
    }
 
}
extension CategoriesViewController: CategoriesViewDelegate {
   
    func closeTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    func categorySelected(category: String) {
        delegate?.categoryTapped(category: category, categorytype: categoriesviewmodel.categorytype)
        closeTapped()
    }
}
