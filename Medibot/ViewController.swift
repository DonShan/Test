 //
//  ViewController.swift
//  Medibot
//
//  Created by Ayesha Chamuni on 2021-09-12.
//

import UIKit
import Kommunicate

class ViewController: UIViewController {
    
    let kmConversation = KMConversationBuilder()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if Kommunicate.isLoggedIn {
            let identifier = String(describing: HomeViewController.self)
            let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let initialViewControlleripad = mainStoryboard.instantiateViewController(withIdentifier: identifier) as! HomeViewController
            let nacVc = UINavigationController(rootViewController: initialViewControlleripad)
            self.navigationController?.present(nacVc, animated: true, completion: nil)
        } else {
            let preChatVC = KMPreChatFormViewController(configuration: Kommunicate.defaultConfiguration)
            preChatVC.delegate = self // set the delegate to self to receive callbacks
            self.present(preChatVC, animated: false, completion: nil) // To present
        }
    }
}

extension ViewController: KMPreChatFormViewControllerDelegate {

    func userSubmittedResponse(name: String, email: String, phoneNumber: String) {
        self.dismiss(animated: false, completion: nil)
        
        // After successful registration, launch a conversation.
        let kmUser = KMUser()
        kmUser.userId = Kommunicate.randomId()
        kmUser.displayName = name
        kmUser.email = email // Optional
        kmUser.applicationId = "2988280c6976a6fa5e42ee5d9eef08f5f"
        
        // Use this same API for login
        Kommunicate.registerUser(kmUser, completion: {
            response, error in
            guard error == nil else {
                // show error
                return
            }
            let identifier = String(describing: HomeViewController.self)
            let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let initialViewControlleripad = mainStoryboard.instantiateViewController(withIdentifier: identifier) as! HomeViewController
            let nacVc = UINavigationController(rootViewController: initialViewControlleripad)
            self.navigationController?.present(nacVc, animated: true, completion: nil)
        })
    }

    func closeButtonTapped() {
        self.dismiss(animated: false, completion: nil)
    }
    
    
    
    
}
