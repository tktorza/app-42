//
//  TopicsTableViewCell.swift
//  rush00
//
//  Created by Anne FOUGERE on 1/13/18.
//  Copyright © 2018 Anne FOUGERE. All rights reserved.
//

import UIKit

class TopicsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var topicNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    var id : Int?
    var messageBody : String?
    
    var topic : (String, String, Int, String, String)? {
        didSet {
            if let d = topic {
                id = d.2
                dateLabel?.text = d.1
                nameLabel?.text = d.0
                topicNameLabel?.text = d.3
                messageBody = d.4
            }
        }
    }
}
