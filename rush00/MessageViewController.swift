//
//  MessageViewController.swift
//  rush00
//
//  Created by Anne FOUGERE on 1/13/18.
//  Copyright © 2018 Anne FOUGERE. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {
    
    var topics : (String, String, Int, String, String)?
    var topicId : Int?
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var messageNameText: UITextView!
    @IBOutlet weak var messageText: UITextView!
    @IBOutlet weak var nameText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel?.text = topics?.1
        messageNameText.text = topics?.3
        messageText.text = topics?.4
        nameText?.text = topics?.0
    }
}
