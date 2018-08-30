//
//  DetailViewController.swift
//  Git
//
//  Created by Alumno on 29/08/18.
//  Copyright © 2018 Angelica. All rights reserved.
//

import Foundation

import UIKit

class DetailViewController: UIViewController {
    
    var repo: Repo = Repo()
    
    //MARK:- IBOutlet
    
    @IBOutlet weak var avatarUImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var autorLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel! {
        didSet {
            self.urlLabel.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(goToUrl(_:))))
        }
    }
    @IBOutlet weak var descriptionTextView: UITextView!
    
 
    //MARK:- IBAction
    
    @IBAction func goToUrl(sender: AnyObject) {
        if let url = NSURL(string: self.repo.url) {
            if #available(iOS 10.0, *) {
                UIApplication.sharedApplication().openURL(url)
            } else {
               // UIApplication.shared.openURL(url)
                UIApplication.sharedApplication().openURL(url)
            }
        }
    }
    
    //MARK:- Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setDisplay()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setDisplay() {
        //self.avatarUImage?.image =
        self.titleLabel?.text = self.repo.name
        self.autorLabel?.text = self.repo.owner
        self.urlLabel?.text = self.repo.url
        self.descriptionTextView?.text = self.repo.description
    }
    
    
}
