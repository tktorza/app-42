//
//  SendForumViewController.swift
//  rush00
//
//  Created by Tom Ktorza on 14/01/2018.
//  Copyright © 2018 Anne FOUGERE. All rights reserved.
//

import UIKit

//une seule view pour ajouter ou modifier un forum
class SendForumViewController: UIViewController, Sender {
    var forumToSend : Forum
    var pseudo: String = ""
    var modif: Bool
    
    @IBOutlet weak var forum: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "backSegue" {
            if let vc = segue.destination as?ViewController {
                vc.forums.changeBy(forum, forum)
            }
        }
    }
    
    @IBAction func SendForum(_ sender: Any) {
        self.forumToSend = Forum(forum.text!, pseudo)
        //sendForum est une methode de l'objet parent Sender qui s'occupe des requêtes et actualise la view
        self.sendForum(forum: self.forumtoSend, modif: modif)
        //je renvoie vers la sortie, la view est normalement actualisée
        performSegue(withIdentifier: "backSegue", sender: <#T##Any?#>)
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

