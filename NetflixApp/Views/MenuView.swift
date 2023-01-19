//
//  MenuView.swift
//  ProgramaticView
//
//  Created by Saikiran Panuganti on 04/07/22.
//

import UIKit

protocol MenuViewDelegate {
    func logoTapped()
    func tvShowsTapped()
    func moviesTapped()
    func mylistTapped()
    func tvShowsTappedEx()
    func moviesTappedEx()
    func mylistTappedEx()
    func tvShowsSubTappedTapped()
    func moviesSubTappedTapped()
}

class MenuView: UIView {
    private var logoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "netflixhome")
        
        return imageView
    }()
    
    private var logoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(logoTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    private var tvShowsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        
        return view
    }()
    
    private var moviesView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        
        return view
    }()
    
    private var myListView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        
        return view
    }()
    
    private var castImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "cast")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor.white
        
        return imageView
    }()
    
    private var tvShowsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tv Shows"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    private var moviesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Movies"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    private var mylistLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My List"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    private var tvShowsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(tvShowsTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    private var moviesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(moviesTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    private var mylistButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(mylistTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    private var tvShowsArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "downArrow")
        
        return imageView
    }()
    private var moviesArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "downArrow")
        
        return imageView
    }()
    private var mylistArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "downArrow")
        
        return imageView
    }()
    
    private var tvShowsSubView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        
        return view
    }()
    private var moviesSubView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        
        return view
    }()
    
    private var tvShowsSubLabel: UILabel = {
        let label = UILabel()
        label.text = "All Genres"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.white
        
        return label
    }()
    private var moviesSubLabel: UILabel = {
        let label = UILabel()
        label.text = "All Genres"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.white
        
        return label
    }()
    
    private var tvShowsSubArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "downArrow")
        
        return imageView
    }()
    private var moviesSubArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "downArrow")
        
        return imageView
    }()
    
    private var tvShowsSubButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(tvShowsSubTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    private var moviesSubButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(moviesSubTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    var delegate: MenuViewDelegate?
    
    private var tvShowLeadingConstraint: NSLayoutConstraint = NSLayoutConstraint()
    private var moviesLeadingConstraint: NSLayoutConstraint = NSLayoutConstraint()
    private var mylistLeadingConstraint: NSLayoutConstraint = NSLayoutConstraint()
    private var tvShowsSubViewLeadingConstraint: NSLayoutConstraint = NSLayoutConstraint()
    private var movieSubViewLeadingConstraint: NSLayoutConstraint = NSLayoutConstraint()
    
    private var width: CGFloat = 0
    private var spacing: CGFloat {
        return (width-180)/4
    }
    private var moviesLeading: CGFloat = 0
    private var myListLeading: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        width = frame.width
        
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        width = frame.width
        moviesLeading = (spacing*2) + 70
        myListLeading = (spacing*3) + 125 // 70+55
        setUpUI()
    }
    
    private func setUpUI() {
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
        addSubViews()
        addSubViewConstraints()
        
        tvShowsSubView.isHidden = true
        moviesSubView.isHidden = true
        
        tvShowsArrow.isHidden = true
        moviesArrow.isHidden = true
        mylistArrow.isHidden = true
    }
    
    private func addSubViews() {
        addSubview(castImageView)
        addSubview(logoView)
        logoView.addSubview(logoImageView)
        logoView.addSubview(logoButton)
        
        addSubview(tvShowsView)
        addSubview(moviesView)
        addSubview(myListView)
        
        tvShowsView.addSubview(tvShowsLabel)
        tvShowsView.addSubview(tvShowsButton)
        tvShowsView.addSubview(tvShowsArrow)
        
        addSubview(tvShowsSubView)
        tvShowsSubView.addSubview(tvShowsSubLabel)
        tvShowsSubView.addSubview(tvShowsSubArrow)
        tvShowsSubView.addSubview(tvShowsSubButton)
        
        moviesView.addSubview(moviesLabel)
        moviesView.addSubview(moviesButton)
        moviesView.addSubview(moviesArrow)
        
        addSubview(moviesSubView)
        moviesSubView.addSubview(moviesSubLabel)
        moviesSubView.addSubview(moviesSubArrow)
        moviesSubView.addSubview(moviesSubButton)
        
        myListView.addSubview(mylistLabel)
        myListView.addSubview(mylistButton)
        myListView.addSubview(mylistArrow)
    }
    
    private func addSubViewConstraints() {
        addLogoCosntraints()
        
        castImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        castImageView.centerYAnchor.constraint(equalTo: logoView.centerYAnchor).isActive = true
        castImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        castImageView.heightAnchor.constraint(equalTo: castImageView.widthAnchor, multiplier: 1).isActive = true
        
        addTvShowsConstraints()
        addMoviesConstraints()
        addMyListConstraints()
        addTvShowsSubConstraints()
        addMoviesSubConstraints()
    }
    
    private func addLogoCosntraints() {
        logoView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        logoView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        logoView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        logoView.heightAnchor.constraint(equalTo: logoView.widthAnchor, multiplier: 1).isActive = true
        
        logoImageView.topAnchor.constraint(equalTo: logoView.topAnchor, constant: 0).isActive = true
        logoImageView.bottomAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 0).isActive = true
        logoImageView.leftAnchor.constraint(equalTo: logoView.leftAnchor, constant: 0).isActive = true
        logoImageView.rightAnchor.constraint(equalTo: logoView.rightAnchor, constant: 0).isActive = true
        
        logoButton.topAnchor.constraint(equalTo: logoView.topAnchor, constant: 0).isActive = true
        logoButton.bottomAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 0).isActive = true
        logoButton.leftAnchor.constraint(equalTo: logoView.leftAnchor, constant: 0).isActive = true
        logoButton.rightAnchor.constraint(equalTo: logoView.rightAnchor, constant: 0).isActive = true
    }
    
    private func addTvShowsConstraints() {
        tvShowsView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        tvShowsView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        tvShowsView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        tvShowLeadingConstraint = tvShowsView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: spacing)
        tvShowLeadingConstraint.isActive = true
        
        tvShowsLabel.leftAnchor.constraint(equalTo: tvShowsView.leftAnchor).isActive = true
//        tvShowsLabel.rightAnchor.constraint(equalTo: tvShowsView.rightAnchor).isActive = true
        tvShowsLabel.topAnchor.constraint(equalTo: tvShowsView.topAnchor).isActive = true
        tvShowsLabel.bottomAnchor.constraint(equalTo: tvShowsView.bottomAnchor).isActive = true
        
        tvShowsButton.leftAnchor.constraint(equalTo: tvShowsView.leftAnchor).isActive = true
        tvShowsButton.rightAnchor.constraint(equalTo: tvShowsView.rightAnchor).isActive = true
        tvShowsButton.topAnchor.constraint(equalTo: tvShowsView.topAnchor).isActive = true
        tvShowsButton.bottomAnchor.constraint(equalTo: tvShowsView.bottomAnchor).isActive = true
        
        tvShowsArrow.leftAnchor.constraint(equalTo: tvShowsLabel.rightAnchor, constant: 5).isActive = true
        tvShowsArrow.widthAnchor.constraint(equalToConstant: 15).isActive = true
        tvShowsArrow.heightAnchor.constraint(equalToConstant: 15).isActive = true
        tvShowsArrow.centerYAnchor.constraint(equalTo: tvShowsLabel.centerYAnchor).isActive = true
    }
    
    private func addMoviesConstraints() {
        moviesView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        moviesView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        moviesView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        moviesLeadingConstraint = moviesView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: moviesLeading)
        moviesLeadingConstraint.isActive = true
        
        moviesLabel.leftAnchor.constraint(equalTo: moviesView.leftAnchor).isActive = true
//        moviesLabel.rightAnchor.constraint(equalTo: moviesView.rightAnchor).isActive = true
        moviesLabel.topAnchor.constraint(equalTo: moviesView.topAnchor).isActive = true
        moviesLabel.bottomAnchor.constraint(equalTo: moviesView.bottomAnchor).isActive = true
        
        moviesButton.leftAnchor.constraint(equalTo: moviesView.leftAnchor).isActive = true
        moviesButton.rightAnchor.constraint(equalTo: moviesView.rightAnchor).isActive = true
        moviesButton.topAnchor.constraint(equalTo: moviesView.topAnchor).isActive = true
        moviesButton.bottomAnchor.constraint(equalTo: moviesView.bottomAnchor).isActive = true
        
        moviesArrow.leftAnchor.constraint(equalTo: moviesLabel.rightAnchor, constant: 5).isActive = true
        moviesArrow.widthAnchor.constraint(equalToConstant: 15).isActive = true
        moviesArrow.heightAnchor.constraint(equalToConstant: 15).isActive = true
        moviesArrow.centerYAnchor.constraint(equalTo: moviesLabel.centerYAnchor).isActive = true
    }
    
    private func addMyListConstraints() {
        myListView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        myListView.widthAnchor.constraint(equalToConstant: 75).isActive = true
        myListView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        mylistLeadingConstraint = myListView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: myListLeading)
        mylistLeadingConstraint.isActive = true
        
        mylistLabel.leftAnchor.constraint(equalTo: myListView.leftAnchor).isActive = true
//        mylistLabel.rightAnchor.constraint(equalTo: myListView.rightAnchor).isActive = true
        mylistLabel.topAnchor.constraint(equalTo: myListView.topAnchor).isActive = true
        mylistLabel.bottomAnchor.constraint(equalTo: myListView.bottomAnchor).isActive = true
        
        mylistButton.leftAnchor.constraint(equalTo: myListView.leftAnchor).isActive = true
        mylistButton.rightAnchor.constraint(equalTo: myListView.rightAnchor).isActive = true
        mylistButton.topAnchor.constraint(equalTo: myListView.topAnchor).isActive = true
        mylistButton.bottomAnchor.constraint(equalTo: myListView.bottomAnchor).isActive = true
        
        mylistArrow.leftAnchor.constraint(equalTo: mylistLabel.rightAnchor, constant: 5).isActive = true
        mylistArrow.widthAnchor.constraint(equalToConstant: 15).isActive = true
        mylistArrow.heightAnchor.constraint(equalToConstant: 15).isActive = true
        mylistArrow.centerYAnchor.constraint(equalTo: mylistLabel.centerYAnchor).isActive = true
    }
    
    private func addTvShowsSubConstraints() {
        tvShowsSubViewLeadingConstraint = tvShowsSubView.leftAnchor.constraint(equalTo: tvShowsView.leftAnchor, constant: 50)
        tvShowsSubViewLeadingConstraint.isActive = true
        tvShowsSubView.bottomAnchor.constraint(equalTo: tvShowsView.bottomAnchor).isActive = true
        tvShowsSubView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        tvShowsSubLabel.leftAnchor.constraint(equalTo: tvShowsSubView.leftAnchor).isActive = true
        tvShowsSubLabel.bottomAnchor.constraint(equalTo: tvShowsSubView.bottomAnchor).isActive = true
        tvShowsSubLabel.topAnchor.constraint(equalTo: tvShowsSubView.topAnchor).isActive = true
        
        tvShowsSubArrow.leftAnchor.constraint(equalTo: tvShowsSubLabel.rightAnchor, constant: 2).isActive = true
        tvShowsSubArrow.widthAnchor.constraint(equalToConstant: 10).isActive = true
        tvShowsSubArrow.heightAnchor.constraint(equalToConstant: 10).isActive = true
        tvShowsSubArrow.centerYAnchor.constraint(equalTo: tvShowsSubLabel.centerYAnchor, constant: 2).isActive = true
        tvShowsSubArrow.rightAnchor.constraint(equalTo: tvShowsSubView.rightAnchor).isActive = true
        
        tvShowsSubButton.leftAnchor.constraint(equalTo: tvShowsSubView.leftAnchor).isActive = true
        tvShowsSubButton.rightAnchor.constraint(equalTo: tvShowsSubView.rightAnchor).isActive = true
        tvShowsSubButton.topAnchor.constraint(equalTo: tvShowsSubView.topAnchor).isActive = true
        tvShowsSubButton.bottomAnchor.constraint(equalTo: tvShowsSubView.bottomAnchor).isActive = true
    }
    
    private func addMoviesSubConstraints() {
        movieSubViewLeadingConstraint = moviesSubView.leftAnchor.constraint(equalTo: moviesView.leftAnchor, constant: 20)
        movieSubViewLeadingConstraint.isActive = true
        moviesSubView.bottomAnchor.constraint(equalTo: moviesView.bottomAnchor).isActive = true
        moviesSubView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        moviesSubLabel.leftAnchor.constraint(equalTo: moviesSubView.leftAnchor).isActive = true
        moviesSubLabel.bottomAnchor.constraint(equalTo: moviesSubView.bottomAnchor).isActive = true
        moviesSubLabel.topAnchor.constraint(equalTo: moviesSubView.topAnchor).isActive = true
        
        moviesSubArrow.leftAnchor.constraint(equalTo: moviesSubLabel.rightAnchor, constant: 2).isActive = true
        moviesSubArrow.widthAnchor.constraint(equalToConstant: 10).isActive = true
        moviesSubArrow.heightAnchor.constraint(equalToConstant: 10).isActive = true
        moviesSubArrow.centerYAnchor.constraint(equalTo: moviesSubLabel.centerYAnchor, constant: 2).isActive = true
        moviesSubArrow.rightAnchor.constraint(equalTo: moviesSubView.rightAnchor).isActive = true
        
        moviesSubButton.leftAnchor.constraint(equalTo: moviesSubView.leftAnchor).isActive = true
        moviesSubButton.rightAnchor.constraint(equalTo: moviesSubView.rightAnchor).isActive = true
        moviesSubButton.topAnchor.constraint(equalTo: moviesSubView.topAnchor).isActive = true
        moviesSubButton.bottomAnchor.constraint(equalTo: moviesSubView.bottomAnchor).isActive = true
    }
    
    func updateMovieSubCategoryTitle(title: String) {
        DispatchQueue.main.async {
            self.moviesSubLabel.text = title
        }
    }
    
    func updateTvShowsSubCategoryTitle(title: String) {
        DispatchQueue.main.async {
            self.tvShowsSubLabel.text = title
        }
    }
    
    func logoTapped() {
        tvShowsView.isHidden = false
        moviesView.isHidden = false
        myListView.isHidden = false
        tvShowsSubView.isHidden = true
        tvShowsArrow.isHidden = true
        moviesArrow.isHidden = true
        moviesSubView.isHidden = true
        mylistArrow.isHidden = true
        tvShowsSubViewLeadingConstraint.constant = 50
        movieSubViewLeadingConstraint.constant = 20

        updateMovieSubCategoryTitle(title: "All Genres")
        updateTvShowsSubCategoryTitle(title: "All Genres")
        
        tvShowLeadingConstraint.constant = spacing
        moviesLeadingConstraint.constant = moviesLeading
        mylistLeadingConstraint.constant = myListLeading
        
        updateTags(tvShows: 0, movies: 0, myList: 0)
    }
    func tvshowsTapped() {
        updateTags(tvShows: 1, movies: 0, myList: 0)
        
        moviesView.isHidden = true
        myListView.isHidden = true
        moviesSubView.isHidden = true
        
        tvShowsView.isHidden = false
        tvShowsSubView.isHidden = false
        
        self.tvShowLeadingConstraint.constant = 30
        self.tvShowsSubViewLeadingConstraint.constant = 100
        
        self.tvShowsArrow.isHidden = false
    }
    func moviesTapped() {
        updateTags(tvShows: 0, movies: 1, myList: 0)
        
        tvShowsView.isHidden = true
        myListView.isHidden = true
        tvShowsSubView.isHidden = true
        
        moviesView.isHidden = false
        moviesSubView.isHidden = false
        
        self.moviesLeadingConstraint.constant = 30
        self.movieSubViewLeadingConstraint.constant = 80
        
        self.moviesArrow.isHidden = false
    }
    func mylistTapped() {
        updateTags(tvShows: 0, movies: 0, myList: 1)
        
        moviesView.isHidden = true
        tvShowsView.isHidden = true
        moviesSubView.isHidden = true
        tvShowsSubView.isHidden = true
        
        myListView.isHidden = false
        
        self.mylistLeadingConstraint.constant = 30
        
        self.mylistArrow.isHidden = false
    }
    
    func updateTags(tvShows: Int, movies: Int, myList: Int) {
        tvShowsButton.tag = tvShows
        moviesButton.tag = movies
        mylistButton.tag = myList
    }
    
    @objc private func logoTapped(_ sender: UIButton) {
        delegate?.logoTapped()
        
        logoTapped()
    }
    
    @objc private func tvShowsTapped(_ sender: UIButton) {
        if sender.tag == 0 {
            sender.tag = 1
            delegate?.tvShowsTapped()
            
            moviesView.isHidden = true
            myListView.isHidden = true
            tvShowsSubView.isHidden = false
            
            self.tvShowLeadingConstraint.constant = 30
            self.tvShowsSubViewLeadingConstraint.constant = 100
            
            UIView.animate(withDuration: 0.3) {
                self.layoutIfNeeded()
            } completion: { bool in
                self.tvShowsArrow.isHidden = false
            }
        }else {
            delegate?.tvShowsTappedEx()
        }
    }
    
    @objc private func moviesTapped(_ sender: UIButton) {
        if sender.tag == 0 {
            sender.tag = 1
            delegate?.moviesTapped()
            
            tvShowsView.isHidden = true
            myListView.isHidden = true
            moviesSubView.isHidden = false
            
            self.moviesLeadingConstraint.constant = 30
            self.movieSubViewLeadingConstraint.constant = 80
            
            UIView.animate(withDuration: 0.3) {
                self.layoutIfNeeded()
            } completion: { bool in
                self.moviesArrow.isHidden = false
            }
        }else {
            delegate?.moviesTappedEx()
        }
    }
    
    @objc private func mylistTapped(_ sender: UIButton) {
        if sender.tag == 0 {
            sender.tag = 1
            delegate?.mylistTapped()
            
            moviesView.isHidden = true
            tvShowsView.isHidden = true
            
            self.mylistLeadingConstraint.constant = 30
            
            UIView.animate(withDuration: 0.3) {
                self.layoutIfNeeded()
            } completion: { bool in
                self.mylistArrow.isHidden = false
            }
        }else {
            delegate?.mylistTappedEx()
        }
        
    }
    
    @objc private func tvShowsSubTapped(_ sender: UIButton) {
        delegate?.tvShowsSubTappedTapped()
    }
    @objc private func moviesSubTapped(_ sender: UIButton) {
        delegate?.moviesSubTappedTapped()
    }
}
