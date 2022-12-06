//
//  PlayListController.swift
//  MyMusicApp
//
//  Created by Lucky on 05/12/22.
//

import UIKit

class PlayListController: UIViewController {

    
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var topContainerView: UIView!
    @IBOutlet weak var playListTableView: UITableView!
    
    var musicData: PlayList!
    var selected: Bool = false
    
    var favourite = [MusicData(title: "Bye Bye", description: "Marshmello, Juice WRLD", icon: "bye_bye", duration: "2:09"),
                     MusicData(title: "I Like You", description: "Post Malone, Doja Cat", icon: "like_you", duration: "4:03"),
                     MusicData(title: "Fountains", description: "Drake, Tems", icon: "fountains", duration: "3:18"),
                     MusicData(title: "Bye Bye", description: "Marshmello, Juice WRLD", icon: "bye_bye", duration: "2:09"),
                     MusicData(title: "I Like You", description: "Post Malone, Doja Cat", icon: "ic_dummy_7", duration: "4:03"),
                      MusicData(title: "Fountains", description: "Drake, Tems", icon: "ic_dummy_8", duration: "3:18"),
                     MusicData(title: "You right", description: "Doja Cat, The Weeknd", icon: "ic_dummy_9", duration: "5:03"),
                     MusicData(title: "2 AM", description: "Arizona Zervas", icon: "fountains", duration: "3:18"),
                     MusicData(title: "Baddest", description: "2 Chainz, Chris Brown", icon: "ic_dummy_10", duration: "9:09"),
                     MusicData(title: "True Love", description: "Kanye West", icon: "ic_dummy_11", duration: "4:03"),
                      MusicData(title: "Hands on you", description: "Austin George", icon: "ic_dummy_12", duration: "9:18")
    ]
    
    var selectIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    @IBAction func moreButton(_ sender: Any) {
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func playPauseButton(_ sender: Any) {
    }
    
    @IBAction func heartButton(_ sender: Any) {
        selected.toggle()
        heartButton.setImage(UIImage(named: selected ? "ic_heart_fill" : "ic_heart_empty"), for: .normal)
    }
}

extension PlayListController {
    
    private func initialSetup() {
        configureNavigaetion()
        configureTableView()
        configureHeaderData()
    }
    
    private func configureNavigaetion() {
        navigationController?.navigationBar.isHidden = true
    }
    
    
    private func configureTableView() {
        playListTableView.register(UINib(nibName: "MusicListCell", bundle: nil), forCellReuseIdentifier: "MusicListCell")
        playListTableView.dataSource = self
        playListTableView.delegate = self
        playListTableView.tableHeaderView = topContainerView
        playListTableView.tableFooterView = nil
        playListTableView.contentInset.bottom = 35
    }
    
    private func configureHeaderData() {
        topImageView.image = UIImage(named: musicData.icon)
        titleLabel.text = musicData.title
        descriptionLabel.text = musicData.description
        topImageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        topImageView.layer.masksToBounds = true
        topImageView.layer.cornerRadius = 20
    }
}

//MARK: - UITableViewDataSource

extension PlayListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favourite.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicListCell") as! MusicListCell
        let favouriteData = favourite[indexPath.row]
        cell.descriptionLabel.text = favouriteData.description
        cell.titleLabel.text = favouriteData.title
        cell.songImageView.image = UIImage(named: favouriteData.icon)
        cell.durationLabel.text = favouriteData.duration
        return cell
    }
}

//MARK: - UITableViewDelegate

extension PlayListController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let playerController = storyBoard.instantiateViewController(withIdentifier: "PlayerController") as! PlayerController
        let favouriteData = favourite[indexPath.row]
        playerController.songData = favouriteData
        self.navigationController?.pushViewController(playerController, animated: true)
    }
}
