//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!

    // navigation bar button item
    // must logout of firebase
    @IBAction func logoutPressed(_ sender: Any) {
        
        // do logout
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError.localizedDescription)
            return
        }
        // pop to root of navigtion controller
        self.navigationController?.popToRootViewController(animated: true)
    }

    // locally referenced message list
    var messages: [Message] = [
          Message(sender: "1@2.com", body: "Hey!")
        , Message(sender: "3@4.com", body: "Hello")
        , Message(sender: "1@2.com", body: "What's up?")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        self.navigationItem.title = K.appName
        self.navigationItem.hidesBackButton = true
        
        // when a table view has a new xib cell, we have to register the new cell xib with the table view itself
        // this preps the tableView to accept the new xib UI class to be displayed as a cell
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
}

// responsible for populating the table view rows and cells
extension ChatViewController: UITableViewDataSource {

    // how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    // return a populated cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a cell and return it to the tableView
        // this cell is now a MessageCell
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell

        cell.label.text = messages[indexPath.row].body
        
        return cell
    }
}

// get UI actions from table view thru this delegate
extension ChatViewController: UITableViewDelegate {
    // when a cell in the table view is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
