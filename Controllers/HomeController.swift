//
//  HomeController.swift
//  MyMusicApp
//
//  Created by Lucky on 05/12/22.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var playListCollectionView: UICollectionView!
    @IBOutlet weak var topContainerView: UIView!
    @IBOutlet weak var allMusicTableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var textfieldContainerView: UIView!
    
    
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
    
    var categories = [Categories(title: "Resent"),
                      Categories(title: "Top 50"),
                      Categories(title: "Festival"),
                      Categories(title: "Chill"),
                      Categories(title: "R&B"),
                      Categories(title: "Festival"),
    ]
    
    var playList = [PlayList(title: "R&B Playlist", description: "Chill your mind", icon: "r_b_dummy"),
                    PlayList(title: "Daily Mix 2", description: "Made for you", icon: "daily_mix"),
                    PlayList(title: "R&B Playlist", description: "Chill your mind", icon: "r_b_dummy"),
                    PlayList(title: "Daily Mix 2", description: "Made for you", icon: "daily_mix"),
                    PlayList(title: "Daily Mix 2", description: "Made for you", icon: "daily_mix"),
                    PlayList(title: "R&B Playlist", description: "Chill your mind", icon: "r_b_dummy"),
                    PlayList(title: "Daily Mix 2", description: "Made for you", icon: "daily_mix")
    ]
    
    var selectIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

extension HomeController {
    
    private func initialSetup() {
        configureNavigaetion()
        configureTextField()
        configureCollectionView()
        configureTableView()
    }
    
    private func configureNavigaetion() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func configureTextField() {
        textfieldContainerView.layer.cornerRadius = 10
    }
    
    private func configureTableView() {
        allMusicTableView.register(UINib(nibName: "MusicListCell", bundle: nil), forCellReuseIdentifier: "MusicListCell")
        allMusicTableView.dataSource = self
        allMusicTableView.delegate = self
        allMusicTableView.tableHeaderView = topContainerView
        allMusicTableView.tableFooterView = nil
        allMusicTableView.contentInset.bottom = 35
    }
    
    private func configureCollectionView() {
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.delegate = self
        playListCollectionView.dataSource = self
        playListCollectionView.delegate = self
        categoriesCollectionView.register(UINib(nibName: "CategoriesCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionCell")
        playListCollectionView.register(UINib(nibName: "PlayListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PlayListCollectionViewCell")
    }
}

//MARK: - UICollectionViewDataSource

extension HomeController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.categoriesCollectionView {
            return categories.count
        } else {
            return playList.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.categoriesCollectionView {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionCell", for: indexPath) as! CategoriesCollectionCell
            print(categories[indexPath.row])
            cell.textLabel.text = categories[indexPath.row].title
            
            if selectIndex == indexPath.row {
                cell.textLabel.textColor = .white
                cell.bottomImage.isHidden = false
                cell.textLabel.font = UIFont(name: "OpenSans-Bold", size: 20)
                
            } else {
                cell.textLabel.textColor = .lightGray
                cell.textLabel.font = UIFont(name: "OpenSans-SemiBold", size: 16)
                cell.bottomImage.isHidden = true
            }
            
        return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayListCollectionViewCell", for: indexPath) as! PlayListCollectionViewCell
            let playListData = playList[indexPath.row]
            cell.titleLabel.text = playListData.title
            cell.iconImageView.image = UIImage(named: playListData.icon)
            cell.descriptionLabel.text = playListData.description
            return cell
        }
    }
}

//MARK: - UICollectionViewDelegate

extension HomeController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoriesCollectionView {
        selectIndex = indexPath.row
        categoriesCollectionView.reloadData()
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let playListController = storyboard.instantiateViewController(withIdentifier: "PlayListController") as! PlayListController
            let playListData = playList[indexPath.row]
            playListController.musicData = playListData
            navigationController?.pushViewController(playListController, animated: true)
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension HomeController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.categoriesCollectionView {
            let label = UILabel(frame: CGRect.null)
            label.text = categories[indexPath.row].title
            return CGSize(width: label.intrinsicContentSize.width + 24, height: 30)
        } else {
            return CGSize(width: 202, height: collectionView.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == self.categoriesCollectionView {
        return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        } else {
         return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.categoriesCollectionView {
        return 0
        } else {
         return 20
        }
    }
}

//MARK: - UITableViewDataSource

extension HomeController: UITableViewDataSource {
    
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

extension HomeController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
}
