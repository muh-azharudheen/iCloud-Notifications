//
//  AlertService.swift
//  iCloud-Notifications
//
//  Created by MS1 on 2/14/18.
//  Copyright © 2018 muhAzharudheen. All rights reserved.
//

import UIKit

class AlertService{
    
    private init() {}
    
    static func composeNote(in vc:UIViewController, completion: @escaping (Note) -> Void ) {
        let alert = UIAlertController(title: "New Note", message: "whats on your mind", preferredStyle: .alert)
        alert.addTextField { (titleF) in
            titleF.placeholder = "Title"
        }
        let post = UIAlertAction(title: "Post", style: .default) { (_) in
            guard let title = alert.textFields?.first?.text, title != "" else { return }
            let note = Note(name: title)
            completion(note)
        }
        alert.addAction(post)
        vc.present(alert, animated: true, completion: nil)
    }
    
    
}
