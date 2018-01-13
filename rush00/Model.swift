//
//  Model.swift
//  rush00
//
//  Created by Anne FOUGERE on 1/13/18.
//  Copyright © 2018 Anne FOUGERE. All rights reserved.
//

import Foundation

class Data {
    static var topics : [(String, String, Int, String, String)]?
    
    static func treatTopics(topics : [[String: AnyObject]]) {
        var toto : String?
        var tata : String?
        var id : Int?
        var messageBody : String?
        
        for topic in topics {
            id = topic["topic_id"] as? Int
            if let top = topic["topic"] as? [String: AnyObject] {
                if let author = top["author"] as? [String: AnyObject] {
                    toto = author["login"] as? String
                }
                if let message = top["message"] as? [String: AnyObject] {
                    if let content = message["content"] as? [String: AnyObject] {
                        messageBody = content["markdown"] as? String
                    }
                }
                tata = top["created_at"] as? String
                if (self.topics != nil) {
                    self.topics?.append((toto!, tata!, id!, top["name"] as! String, messageBody!))
                } else {
                    self.topics = [(toto!, tata!, id!, top["name"] as! String, messageBody!)]
                }
            }
        }
    }
}
