//
//  PlayerController.swift
//  MyMusicApp
//
//  Created by Lucky on 06/12/22.
//

import UIKit
import AVFoundation

class PlayerController: UIViewController {
    
    @IBOutlet weak var playButtonConstraints: NSLayoutConstraint!
    @IBOutlet weak var musicImageView: UIImageView!
    @IBOutlet weak var startTimerLabel: UILabel!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var shuffleButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var repeatButton: UIButton!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var backNutton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var songData: MusicData!
    var selected: Bool = false
    var selectedPlayPauseButton: Bool = false
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    @IBAction func nextButton(_ sender: Any) {
      print("Next ")
    }
    
    @IBAction func prevButton(_ sender: Any) {
       print("Previous")
    }
    
    @IBAction func repeatButton(_ sender: Any) {
        print("Repeat")
    }
    
    @IBAction func shuffleButton(_ sender: Any) {
        print("Shuffle")
    }
    
    @IBAction func playPauseButton(_ sender: Any) {
     playPauseButton.isSelected.toggle()

        if playPauseButton.isSelected {
            playPauseButton.setImage(UIImage(named: "ic_play"), for: .normal)
            player.play()
        } else {
            playPauseButton.setImage(UIImage(named: "ic_pause"), for: .normal)
            player.pause()
        }
    }
    
    @IBAction func moreButton(_ sender: Any) {
        print("More")
    }
    
    @IBAction func heartButton(_ sender: Any) {
        selected.toggle()
        heartButton.setImage(UIImage(named: selected ? "ic_heart_fill" : "ic_heart_empty"), for: .normal)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension PlayerController {
    
    private func initialSetUp() {
        configureData()
        configureConstrain()
        audioPath()
    }
    
    private func audioPath() {
        do {
            let audioPath = Bundle.main.path(forResource: songData.music, ofType: songData.ext)
           try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        } catch {
            // Error
            print("Your image is wrong")
        }
    }
    
    private func configureData() {
        musicImageView.layer.cornerRadius = 15
        musicImageView.image = UIImage(named: songData.icon)
        titleLabel.text = songData.title
        descriptionLabel.text = songData.description
    }
    
    private func configureConstrain() {
        
        if UIDevice.current.hasNotch {
            playButtonConstraints.constant = 83
        } else {
            playButtonConstraints.constant = 40
        }
    }
}
