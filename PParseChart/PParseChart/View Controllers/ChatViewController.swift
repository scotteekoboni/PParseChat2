//
//  ChatViewController.swift
//  PParseChart
//
//  Created by Scott Guidoboni on 2/2/18.
//  Copyright © 2018 doordontLLC. All rights reserved.
//

import UIKit
import Parse


class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var messages: [PFObject] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        
        let messages = self.messages[indexPath.row]
        
        cell.messageThing.text = messages["text"] as? String
        cell.usernameThing.text = messages["username"] as? String
        
        
        return cell
    }
    

    
    @IBOutlet weak var chatView: UITableView!
    @IBOutlet weak var chatMessageField: UITextField!
    
//    @IBAction func Fixer(_ sender: Any) {
//        func logOut() {
//            // Logout the current user
//            PFUser.logOutInBackground(block: { (error) in
//                if let error = error {
//                    print(error.localizedDescription)
//                } else {
//                    print("Successful loggout")
//                    self.performSegue(withIdentifier: "logoutSegue", sender: nil)
//                    
//                }
//            })
//        }
//        logOut()
//    }
    @IBAction func logBarItem(_ sender: Any) {
            print("bye bye")
            func logOut() {
                // Logout the current user
                PFUser.logOutInBackground(block: { (error) in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Successful loggout")
                        self.performSegue(withIdentifier: "logoutSegue", sender: nil)
                        
                    }
                })
            }
            logOut()
    }
    @IBAction func logOutt(_ sender: Any) {
        print("bye bye")
        func logOut() {
            // Logout the current user
            PFUser.logOutInBackground(block: { (error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Successful loggout")
                    self.performSegue(withIdentifier: "logoutSegue", sender: nil)
                    
                }
            })
        }
        logOut()
    }
    
    
    @IBAction func sendButton(_ sender: Any) {
        
        let chatMessage = PFObject(className: "Message")
        
        chatMessage["text"] = chatMessageField.text ?? "" //IDK about placement
       chatMessage["username"] = PFUser.current()!.username
        if chatMessage["text"] as! String != "" {
        chatMessage.saveInBackground { (success, error) in
            if success {
                print("The message was saved bitch!")
//                chatMessage["text"] = self.chatMessageField.text ?? "" //IDK about placement or if this will clear the test field or not :-/
                
                self.chatMessageField.text = ""
                
                
            } else if let error = error {
                print("Problem saving message: \(error.localizedDescription)")
            }
        }
    }
    }
    
    @objc func fetchPosts(){
        // construct query
        //let predicate = NSPredicate(format: "likesCount > 100")
        var query = PFQuery(className: "Message")
        //query.order(by: "createdAt")
        
        // fetch data asynchronously
        query.findObjectsInBackground { (messages: [PFObject]?, error: Error?) in
            if let messages = messages {
                // do something with the array of object returned by the call
                self.messages = messages
                self.chatView.reloadData()
            } else {
                print(error?.localizedDescription)
            }
        }
    }
    
    //~~~~~~~~~~~~~~~needs editing~~~~~~~~~~~
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//    return 1 // This was put in mainly for my own unit testing
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return Message.count // Most of the time my data source is an array of something...  will replace with the actual name of the data source
//    }
//
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        // Note:  Be sure to replace the argument to dequeueReusableCellWithIdentifier with the actual identifier string!
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell") as! ChatCell
//
//        // set cell's textLabel.text property
//        // set cell's detailTextLabel.text property
//        return cell
//    }
    //~~~~~~~~~~~~~~~needs editing~~~~~~~~~~~
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Chat"
        
        let navigationBar = navigationController?.navigationBar
        navigationBar?.tintColor = UIColor.blue
        
        let leftButton =  UIBarButtonItem(title: "Logout", style: UIBarButtonItemStyle.plain, target: self, action: #selector(logBarItem(_:)))
//        let rightButton = UIBarButtonItem(title: "Right Button", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        
            navigationItem.leftBarButtonItem = leftButton
//        navigationItem.rightBarButtonItem = rightButton
    
        
        chatView.dataSource = self //THIS ISNT right//FIX
        chatView.delegate = self  //Anything else to set delegate property?
        
//        let query = PFQuery(className: <#T##String#>)
//        query.orderByDescending("createdAt")
//        query.includeKey("author")
//        query.limit = 20
//
//        // fetch data asynchronously
//        query.findObjectsInBackgroundWithBlock { (messages, error: NSError?) -> Void in
//            if messages {
//                // do something with the data fetched
//                self.messages =
//                self.feedTableView.reloadData()
//            } else {
//                // handle error
//                print("error!!!!")
//            }
//        }
//
        
        
        //UIRefreshControl.self: chatView // suppose to refresh the table viw every second??
        
        //Auto Resizing
        // Auto size row height based on cell autolayout constraints
        chatView.rowHeight = UITableViewAutomaticDimension
        // Provide an estimated row height. Used for calculating scroll indicator
        chatView.estimatedRowHeight = 50
        
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(fetchPosts), userInfo: nil, repeats: true)
        //self.chatView.reloadData()

        
        chatView.separatorStyle = .none
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
