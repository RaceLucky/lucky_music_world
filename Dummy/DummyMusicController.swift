//
//  DummyMusicController.swift
//  MyMusicApp
//
//  Created by Lucky on 07/12/22.
//

import UIKit
import AVFoundation

class DummyMusicController: UIViewController {
    
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    @IBAction func playButton(_ sender: Any) {
        player.play()
        
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        player.pause()
    }
}

extension DummyMusicController {
    
    private func initialSetup() {
        audioPath()
    }
    
    private func audioPath() {
        do {
            let audioPath = Bundle.main.path(forResource: "Baby(PaglaSongs)", ofType: ".mp3")
           try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        } catch {
            // Error
        }
    }
}
