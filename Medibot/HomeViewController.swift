//
//  HomeViewController.swift
//  Medibot
//
//  Created by Sachithra Siriwardhane on 2021-09-12.
//

import UIKit
import Kommunicate

class HomeViewController: UIViewController {

    let kmConversation = KMConversationBuilder()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Kommunicate.showConversations(from: self)
    }
    
    
}
