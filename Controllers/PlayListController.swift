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
    
    var favourite = [MusicData(title: "Patli Kamariya Mor Hai Hai", description: "Trending instagram song", icon: "patli", duration: "4:09", music: "Patli Kamariya Mor Hai Hai(PagalWorld.com.se)", ext: ".mp3"),
                     MusicData(title: "Extremes", description: "Alan Walker song", icon: "extremes", duration: "4:03", music: "Extremes(PagalWorld.com.se)", ext: ".mp3"),
                     MusicData(title: "Man On The Moon", description: "Alan Walker song", icon: "fountains", duration: "3:18", music: "Man On The Moon(PagalWorld.com.se)", ext: ".mp3"),
                     MusicData(title: "Not You", description: "Alan Walker song", icon: "not_you", duration: "2:09", music: "Not You(PagalWorld.com.se)", ext: ".mp3"),
                     MusicData(title: "On My Way", description: "Alan Walker song", icon: "on_way", duration: "4:03", music: "On My Way(PagalWorld.com.se)", ext: ".mp3"),
                     MusicData(title: "Paradise", description: "Alan Walker song", icon: "paradise", duration: "3:18", music: "Paradise(PagalWorld.com.se)", ext: ".mp3"),
                     MusicData(title: "Baby", description: "Justin Biber song", icon: "baby", duration: "5:03", music: "Baby(PaglaSongs)", ext: ".mp3"),
                     MusicData(title: "Senorita", description: "Senorita famous", icon: "pagalworld", duration: "3:18", music: "04. Senorita", ext: ".mp3"),
                     MusicData(title: "All is well - Remix", description: "All is well", icon: "pagalworld", duration: "5:09", music: "07.%20Aal%20Izz%20Well%20-%20Remix", ext: ".mp3"),
                     MusicData(title: "Ek Pyar Ka Naghma Hai", description: "Ek Pyar Ka Naghma Hai - Shor", icon: "pyar_nagma", duration: "4:03", music: "Ek Pyar Ka Naghma Hai - Shor 128 Kbps", ext: ".mp3"),
                      MusicData(title: "Mera Dil Ye Pukare Aaja", description: "Instagram Trending song", icon: "aaja", duration: "9:18", music: "Mera Dil Ye Pukare Aaja (Remix) DJ Usman Bhatti_192(PagalWorld.com.se)", ext: ".mp3")
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
