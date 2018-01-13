//
//  Sender.swift
//  rush00
//
//  Created by Tom Ktorza on 13/01/2018.
//  Copyright © 2018 Anne FOUGERE. All rights reserved.
//

import Foundation

class Sender{
    var request: URLRequest?
    let site = "https://api.intra.42.fr/v2"
    var token : String
    var postForumUrl: String?
    var postMessageUrl: String?
    
    init(){
        self.postForumUrl = "\(site)/topics"
        self.postMessageUrl = "\(site)/messages"
    }

    func sendForum(forum: Forum, modif: Bool){
        if modif{
            if let url = URL(string: "\(self.postForumUrl!)/:\(forum.id)") {
                self.request = URLRequest(url: url)
                self.request?.httpMethod = "PUT"
                self.request?.setValue("Bearer " + self.token, forHTTPHeaderField: "Authorization")
                //            self.request?.setValue(<#T##value: String?##String?#>, forHTTPHeaderField: <#T##String#>) --> remplir le post body
                self.dataTask()
            }
        }else{
            if let url = URL(string: self.postForumUrl!) {
                self.request = URLRequest(url: url)
                self.request?.httpMethod = "POST"
                self.request?.setValue("Bearer " + self.token, forHTTPHeaderField: "Authorization")
                //            self.request?.setValue(<#T##value: String?##String?#>, forHTTPHeaderField: <#T##String#>) --> remplir le post body with forum
                self.dataTask()
            }
        }
    }
    
    func sendMessage(message: Message, modif: Bool){
        if modif{
             self.postMessageUrl = "\(self.postMessageUrl!)/:\(message.id)"
            if let url = URL(string: self.postMessageUrl!) {
                self.request = URLRequest(url: url)
                self.request?.httpMethod = "PUT"
                self.request?.setValue("Bearer " + self.token, forHTTPHeaderField: "Authorization")
                //            self.request?.setValue(<#T##value: String?##String?#>, forHTTPHeaderField: <#T##String#>) --> remplir le post body with msg
                self.dataTask()
            }
        } else{
            if let url = URL(string: self.postMessageUrl!) {
                self.request = URLRequest(url: url)
                self.request?.httpMethod = "POST"
                self.request?.setValue("Bearer " + self.token, forHTTPHeaderField: "Authorization")
                //            self.request?.setValue(<#T##value: String?##String?#>, forHTTPHeaderField: <#T##String#>) --> remplir le post body with msg
                self.dataTask()
            }
        }
        
    }
    
    func deleteForum(forum: Forum){
        if let url = URL(string: "\(self.postForumUrl!)/:\(forum.id)") {
            self.request = URLRequest(url: url)
            self.request?.httpMethod = "DELETE"
            self.request?.setValue("Bearer " + self.token, forHTTPHeaderField: "Authorization")
            //            self.request?.setValue(<#T##value: String?##String?#>, forHTTPHeaderField: <#T##String#>) --> remplir le post body
            self.dataTask()
        }
    }
    
    func deleteMessage(message: Message){
        if let url = URL(string: "\(self.postMessageUrl!)/:\(message.id)") {
            self.request = URLRequest(url: url)
            self.request?.httpMethod = "DELETE"
            self.request?.setValue("Bearer " + self.token, forHTTPHeaderField: "Authorization")
            //            self.request?.setValue(<#T##value: String?##String?#>, forHTTPHeaderField: <#T##String#>) --> remplir le post body
            self.dataTask()
        }
    }
    
        
    
    
    func dataTask(){
        let task = URLSession.shared.dataTask(with: self.request!) {
            (data, response, error) in
            if let err = error {
                print(err)
               
            }
        }
        task.resume()
    }
}
