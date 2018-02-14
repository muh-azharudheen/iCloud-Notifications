//
//  ViewController.swift
//  iCloud-Notifications
//
//  Created by MS1 on 2/14/18.
//  Copyright © 2018 muhAzharudheen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView : UITableView!
    
    fileprivate var notes = [Note]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction private func onComposeTapped(_ sender: UIBarButtonItem){
        AlertService.composeNote(in: self) {[unowned self] (note) in
            self.insertNote(note: note)
        }
    }
    
    private func insertNote(note: Note){
        notes.insert(note, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = notes[indexPath.row].name
        return cell
    }
}
