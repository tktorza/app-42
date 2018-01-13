//
//  ViewController.swift
//  rush00
//
//  Created by Anne FOUGERE on 1/13/18.
//  Copyright © 2018 Anne FOUGERE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var forums: [Forum]?{
        didSet{
            if self.tweets!.count < 1 {
                self.displayEmpty()
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //retour de SendMessage
    @IBAction func unWindSegue(segue: UIStoryboardSegue){
        
    }
    //Les deux qui suivent servent à initialiser la valeur de forum au sein de la viewController pour y ajouter un msg
    override func tableView(_ tableView: UITableView, didSelectItemAt indexPath: IndexPath) {
        self.prepareScrollView(forum: self.forums[indexPath.item].0, refs)
    }
    // MARK: NAVIGATION
    
    func prepareScrollView(forum: Forum) {
        let destinationvc = self.storyboard?.instantiateViewController(withIdentifier: "SendMessageViewController") as! SendMessageViewController
        
        destinationvc.forum = forum
        //if modif == true
        destinationvc.message.text = message
        
        
        
        self.navigationController?.pushViewController(destinationvc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

