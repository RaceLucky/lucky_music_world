//
//  ViewController.swift
//  MyMusicApp
//
//  Created by Lucky on 05/12/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let homeController = storyBoard.instantiateViewController(withIdentifier: "HomeController") as! HomeController
        navigationController?.pushViewController(homeController, animated: true)
    }
}

