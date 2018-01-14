//
//  Structs.swift
//  rush00
//
//  Created by Tom Ktorza on 14/01/2018.
//  Copyright © 2018 Anne FOUGERE. All rights reserved.
//

import Foundation

struct Message{
    var author_id : String?
    var content : String?
    var messageToSend: [String: String] = [:]
    
    init(_ c: String,_ id: String){
        self.author_id = id
        self.content = c
        self.messageToSend = ["content": self.content!, "author_id": self.author_id!]
    }
}

struct Forum {
    var author_id : String?
    var name : String?
    var kind : String = "normal"
    var language_id : String = "3"
    
    var forumToSend: [String: String] = [:]
    
    init(_ n: String,_ id: String){
        self.author_id = id
        self.name = n
        self.forumToSend = ["name": self.name!, "language_id": language_id, "kind":kind, "author_id": self.author_id!]
    }
}
