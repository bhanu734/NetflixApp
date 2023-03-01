//
//  PlayerView.swift
//  NetflixApp
//
//  Created by Mac on 22/02/23.
//
protocol PlayerViewDelegate {
    func closeTapped()
}
import UIKit
import AVKit

class PlayerView: UIView {
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var controlsview: UIView!
    @IBOutlet weak var closeview: UIView!
    @IBOutlet weak var closeimage: UIImageView!
    @IBOutlet weak var progressbar: UISlider!
    @IBOutlet weak var backwardimage: UIImageView!
    @IBOutlet weak var forwordimage: UIImageView!
    @IBOutlet weak var playPauseimage: UIImageView!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var totalDurationLabel: UILabel!
    
    var delegate: PlayerViewDelegate?
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    var currentTime: Double? {
        return player?.currentItem?.currentTime().seconds
    }
    var totalDuration: Double? {
        return player?.currentItem?.duration.seconds
    }
    
    func setupUI() {
        backgroundColor = Colors.shared.blackcolor
        playerView.backgroundColor = Colors.shared.blackcolor
        
        closeview.backgroundColor = Colors.shared.clearcolor
        closeimage.image = Images.shared.crossimage
        closeimage.tintColor = Colors.shared.whiteBgcolor
        closeview.layer.cornerRadius = 20.0
        
        backwardimage.image = Images.shared.tenSecondBackward
        backwardimage.tintColor = Colors.shared.whiteimagecolor
        forwordimage.image = Images.shared.tenSecondForward
        forwordimage.tintColor = Colors.shared.whiteimagecolor
        playPauseimage.image = Images.shared.pausebutton
        playPauseimage.tintColor = Colors.shared.whiteimagecolor
        
        progressbar.tintColor = Colors.shared.redbuttoncolor
        progressbar.thumbTintColor = Colors.shared.redbuttoncolor
        progressbar.minimumTrackTintColor = Colors.shared.redbuttoncolor
        progressbar.maximumTrackTintColor = Colors.shared.blackcolor
        progressbar.addTarget(self, action: #selector(sliderValueChanged(_:_:)), for: UIControl.Event.valueChanged)
        
        currentTimeLabel.textColor = Colors.shared.whiteTextcolor
        currentTimeLabel.font = Font.shared.medium3
        totalDurationLabel.textColor = Colors.shared.whiteTextcolor
        totalDurationLabel.font = Font.shared.medium3
        
        controlsview.isHidden = true
        addTapGester()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.playerLayer?.frame = self.playerView.bounds
    }
    
    func SetUpPlayer(videoUrl: String) {
        DispatchQueue.main.async {
            guard let videoURL = URL(string: videoUrl) else { return }
            self.player = AVPlayer(url: videoURL)
            guard let player = self.player else { return }
            self.playerLayer = AVPlayerLayer(player: player)
            guard let playerLayer = self.playerLayer else { return }
            playerLayer.frame = self.playerView.bounds
            self.playerView.layer.addSublayer(playerLayer)
            player.play()
            
            player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1), queue: .main) { time in
                self.currentTimeLabel.text = self.getFormattedTime(time: Int(time.seconds))
                self.totalDurationLabel.text = self.getFormattedTime(time: Int(self.totalDuration ?? 0))
                self.progressbar.value = Float(self.currentTime ?? 0) / Float(self.totalDuration ?? 0)
            }
            
        }

    }
    
    func addTapGester() {
        let tapGester = UITapGestureRecognizer(target: self, action: #selector(tapGesterRecognized(_:)))
        tapGester.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGester)
       
    }
    
    @objc func sliderValueChanged(_ sender: UISlider, _ event: UIEvent) {
        if event.allTouches?.first?.phase == .began {
            pauseContent()
        }else if event.allTouches?.first?.phase == .ended {
            if let duration = totalDuration {
                let time = duration*Double(progressbar.value)
                player?.seek(to: CMTimeMakeWithSeconds(time, preferredTimescale: 1), completionHandler: { bool in
                    self.playContent()
                })
            }
        }
    }
    
    @objc func tapGesterRecognized(_ sender: UITapGestureRecognizer ) {
        
        controlsview.isHidden = !controlsview.isHidden
    }
    
    @IBAction func closeTapped() {
        delegate?.closeTapped()
    }
    
    func playContent() {
        player?.play()
        playPauseimage.image = Images.shared.pausebutton
    }
    
    func pauseContent() {
        player?.pause()
        playPauseimage.image = Images.shared.playbutton
    }
    
    @IBAction func playPauseTapped() {
        if player?.timeControlStatus == .playing {
            pauseContent()
        } else if player?.timeControlStatus == .paused {
            playContent()
        }
    }
    
    func getFormattedTime(time: Int) -> String {
        let hours = time/3600
        var hourString = "\(hours)"
        let minutes = (time%3600)/60
        var minuteString = "\(minutes)"
        let seconds = time%60
        var secondString = "\(seconds)"

        if hours < 10 {
            hourString = "0" + hourString
        }
        if minutes < 10 {
            minuteString = "0" + minuteString
        }
        if seconds < 10 {
            secondString = "0" + secondString
        }

        return "\(hourString):\(minuteString):\(secondString)"
    }
    @IBAction func forwardTapped() {
        if let currentTime = currentTime, let duration = totalDuration, (currentTime+10 < duration) {
            player?.seek(to: CMTimeMakeWithSeconds(currentTime+10, preferredTimescale: 1), toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)
        }
    }
    @IBAction func backwardTapped() {
        if let currentTime = currentTime, (currentTime-10 > 0) {
            player?.seek(to: CMTimeMakeWithSeconds(currentTime-10, preferredTimescale: 1), toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)
        }else {
            player?.seek(to: CMTimeMakeWithSeconds(0, preferredTimescale: 1), toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)
        }
    }
    @IBAction func sliderValueChanged() {
        
    }
}
