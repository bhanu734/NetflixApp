//
//  DetailheroCollectionViewCell.swift
//  NetflixApp
//
//  Created by Mac on 06/02/23.
//

protocol DetailheroCollectionViewCellDelegate {
    func playTapped()
}
import UIKit

class DetailheroCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var cat_label: UILabel!
    @IBOutlet weak var cat_view: UIView!
    @IBOutlet weak var stackview: UIStackView!
    @IBOutlet weak var playview: UIView!
    @IBOutlet weak var playlabel: UILabel!
    @IBOutlet weak var playimage: UIImageView!
    @IBOutlet weak var downloadview: UIView!
    @IBOutlet weak var downloadimage: UIImageView!
    @IBOutlet weak var downloadlabel: UILabel!
    @IBOutlet weak var descriptionlabel: UILabel!
    @IBOutlet weak var castlabel: UILabel!
    @IBOutlet weak var generslabel: UILabel!
    @IBOutlet weak var commentstackview: UIStackView!
    @IBOutlet weak var mylistview: UIView!
    @IBOutlet weak var mylistlabel: UILabel!
    @IBOutlet weak var mylistimage: UIImageView!
    @IBOutlet weak var rateview: UIView!
    @IBOutlet weak var ratelabel: UILabel!
    @IBOutlet weak var rateimage: UIImageView!
    @IBOutlet weak var shareview: UIView!
    @IBOutlet weak var sharelabel: UILabel!
    @IBOutlet weak var shareimage: UIImageView!
    @IBOutlet weak var topview: UIView!
    
    var delegate: DetailheroCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
        
       
    }

    func setupUI() {
        mainstackview()
        commentsStackview()
        
        backgroundColor = Colors.shared.blackcolor
        
        topview.backgroundColor = Colors.shared.blackcolor
        
        
//        heroImage.contentMode = .scaleAspectFit
        
        logoImage.image = Images.shared.netflix_Letter_N
        
        titlelabel.textColor = Colors.shared.whiteTextcolor
        titlelabel.font = Font.shared.bold4
        
        datelabel.textColor = Colors.shared.whiteTextcolor
        datelabel.font = Font.shared.medium2
        
        cat_view.backgroundColor = Colors.shared.darkgreycolor
        cat_label.textColor = Colors.shared.whiteTextcolor
//        cat_label.text = Strings.shared.Home
        
        descriptionlabel.textColor = Colors.shared.whiteTextcolor
        descriptionlabel.font = Font.shared.medium3
        
        castlabel.textColor = Colors.shared.whiteTextcolor
        
        
        generslabel.textColor = Colors.shared.whiteTextcolor
    }
    func mainstackview() {
        stackview.backgroundColor = Colors.shared.blackcolor
        
        playview.backgroundColor = Colors.shared.whiteBgcolor
        playview.layer.cornerRadius = 10.0
        playimage.tintColor = Colors.shared.blackcolor
        playimage.image = Images.shared.play
        playlabel.textColor = Colors.shared.blackcolor
        playlabel.text = Strings.shared.play
        
        downloadview.backgroundColor = Colors.shared.darkgreycolor
        downloadview.layer.cornerRadius = 10.0
        downloadimage.tintColor = Colors.shared.whiteimagecolor
        downloadimage.image = Images.shared.download_details
        downloadlabel.textColor = Colors.shared.whiteTextcolor
        downloadlabel.text = Strings.shared.download
        
     
    }
    func commentsStackview() {
        
//        commentstackview.backgroundColor = Colors.shared.blackcolor
        
        mylistview.backgroundColor = Colors.shared.blackcolor
        mylistlabel.textColor = Colors.shared.whiteTextcolor
        mylistlabel.text = Strings.shared.mylistlabel
        mylistimage.image = Images.shared.plus
        mylistimage.tintColor = Colors.shared.whiteimagecolor
        
        rateview.backgroundColor = Colors.shared.blackcolor
        ratelabel.textColor = Colors.shared.whiteTextcolor
        ratelabel.text = Strings.shared.rate
        rateimage.image = Images.shared.rate
        rateimage.tintColor = Colors.shared.whiteimagecolor
        
        shareview.backgroundColor = Colors.shared.blackcolor
        sharelabel.textColor = Colors.shared.whiteTextcolor
        sharelabel.text = Strings.shared.share
        shareimage.image = Images.shared.share
        shareimage.tintColor = Colors.shared.whiteimagecolor
    }
    
    func configUI(detailsData: SeriesData?) {
        if let detailsData = detailsData {
            heroImage.sd_setImage(with: URL(string: detailsData.imagery?.banner ?? ""), completed: nil)
            titlelabel.text = detailsData.name
            datelabel.text = detailsData.firstAirDate
            descriptionlabel.text = detailsData.overview
            cat_label.text = detailsData.type
            castlabel.text = getCastString(cast: detailsData.productionCompanies)
            generslabel.text = getCastString(genre: detailsData.genres)
        }
    }
    func configUI(detailsData: MoviesData?) {
        if let detailsData = detailsData {
            heroImage.sd_setImage(with: URL(string: detailsData.imagery?.banner ?? ""), completed: nil)
            titlelabel.text = detailsData.originalTitle
            datelabel.text = detailsData.releaseDate
            descriptionlabel.text = detailsData.overview
            cat_label.text = detailsData.contentType
            castlabel.text = getCastString(cast: detailsData.productionCompanies)
            generslabel.text = getCastString(genre: detailsData.genres)
        }
    }
    
    func getCastString(cast: [ProductionCompany]?) -> String? {
        var finalcast: String = "Cast: "
        
        if let cast = cast, cast.count > 0 {
            for castDict in cast {
                if let name = castDict.name {
                    finalcast += name + ", "
                }
            }
            finalcast.removeLast()
            finalcast.removeLast()
            return finalcast
        }
        return nil
    }
    func getCastString(genre: [Genre]?) -> String? {
        var finalgenre: String = "Genre: "
        
        if let genre = genre, genre.count > 0 {
            for genreDict in genre {
                if let name = genreDict.name {
                    finalgenre += name + ", "
                }
            }
            finalgenre.removeLast()
            finalgenre.removeLast()
            return finalgenre
        }
        return nil
    }
    
    @IBAction func playbuttonTapped() {
        delegate?.playTapped()
    }
    @IBAction func downloadbuttonTapped() {
        
    }
    @IBAction func mylistbuttonTapped() {
        
    }
    @IBAction func ratebuttonTapped() {
        
    }
    @IBAction func sharebuttonTapped() {
        
    }
}
