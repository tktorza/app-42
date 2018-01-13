//
//  ViewController.swift
//  rush00
//
//  Created by Anne FOUGERE on 1/13/18.
//  Copyright © 2018 Anne FOUGERE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var topicTableView: UITableView!
    
    func getToken() {
        let CUSTOMER_KEY = "ee0c9275f90176a823d8c3b79bccd8ba50c243577a94f26fb2826fa8fa4c3194"
        let CUSTOMER_SECRET = "655f0c6cf39e7cc073fb23889c4afb899471de975e4270805493a7fdd54a556e"
        let BEARER = ((CUSTOMER_KEY + ":" + CUSTOMER_SECRET).data(using: String.Encoding.utf8))!.base64EncodedString(options: NSData.Base64EncodingOptions (rawValue: 0))
        let url = NSURL(string: "https://api.intra.42.fr/oauth/token")
        let request = NSMutableURLRequest(url: url! as URL)
        
        request.httpMethod = "POST"
        request.setValue("Basic " + BEARER, forHTTPHeaderField: "Authorization")
        request.setValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = "grant_type=client_credentials".data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) in
            if error != nil {
                print(error!)
            }
            else if let d = data {
                do {
                    if let dic : NSDictionary = try JSONSerialization.jsonObject(with: d, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                        if let t = dic["access_token"] {
                            self.testRequest(token: String(describing: t), CUSTOMER_KEY: CUSTOMER_KEY, CUSTOMER_SECRET: CUSTOMER_SECRET, BEARER: BEARER)
                        }
                    }
                }
                catch (let err) {
                    print(err)
                }
            }
        }
        task.resume()
    }

    func testRequest(token: String, CUSTOMER_KEY: String, CUSTOMER_SECRET: String, BEARER: String) {
        print(token)
        let url = NSURL(string: "https://api.intra.42.fr/v2/cursus_topics")
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        print(request)
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) in
            if error != nil {
                print(error!)
            }
            else if let d = data {
                do {
                    let dic = try JSONSerialization.jsonObject(with: d, options: []) as! [[String: AnyObject]]
                    Data.treatTopics(topics: dic)
                    DispatchQueue.main.async {
                        self.topicTableView.reloadData()
                    }
                }
                catch (let err) {
                    print(err)
                }
            }
        }
        print("END")
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let topic_data = Data.topics {
            return topic_data.count
        }
     
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.backgroundColor = UIColor.black
        let cell = tableView.dequeueReusableCell(withIdentifier: "topicCellIdentifier") as! TopicsTableViewCell
        cell.topic = Data.topics?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.subviews[indexPath.row] as? TopicsTableViewCell
        print("ICICICICICICICICICICICICICCICICICICIs")
        performSegue(withIdentifier: "principalMessageIdentifier", sender: Data.topics![indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.identifier)
        if segue.identifier == "principalMessageIdentifier" {
            if let dest = segue.destination as? MessageViewController {
                print(sender)
                dest.topics = sender as? (String, String, Int, String, String)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getToken()
    }

}

