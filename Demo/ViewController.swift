//
//  ViewController.swift
//  Demo
//
//  Created by Yicheng Liang on 9/10/15.
//  Copyright © 2015 Yicheng Liang. All rights reserved.
//
//
//import UIKit
//
//class ViewController: UIViewController {
////
////    @IBOutlet weak var organizationlabel: UILabel!
////    @IBOutlet weak var avatarUrlabel: UIImageView!
////    
////    @IBOutlet weak var locationlabel: UILabel!
////    @IBOutlet weak var Descriptionlabel: UILabel!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
////            GitHubOrganization().fetchOrganizationInfo { (org: GitHubOrganization.Organization) -> () in
////            self.organizationlabel.text = org.OrgaNme
////            self.Descriptionlabel.text = org.description
////            self.locationlabel.text = org.location
////                if let url = NSURL(string: org.avatarUrl) {
////                    if let data = NSData(contentsOfURL: url){
////                        self.avatarUrlabel.contentMode = UIViewContentMode.ScaleAspectFit
////                        self.avatarUrlabel.image = UIImage(data: data)
////                    } else {
////                        self.avatarUrlabel.image = UIImage(named: "World")
////                    }
////                }
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//}
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var organizationLabel: UILabel!
//    var spinner = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
//    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        spinner.center = CGPointMake(view.bounds.width / 2, view.bounds.height / 2)
//        spinner.hidesWhenStopped = true
//        self.view.addSubview(spinner)
//        spinner.startAnimating()
        
        GitHubOrganization().fetchOrganizationDetails { (org: GitHubOrganization.Organization) -> () in
            self.organizationLabel.text = org.organizationName
            self.descriptionLabel.text = org.description
            self.locationLabel.text = org.location
            
            if let url = NSURL(string: org.avatarURL) {
                if let data = NSData(contentsOfURL: url){
                    self.avatar.contentMode = UIViewContentMode.ScaleAspectFit
                    self.avatar.image = UIImage(data: data)
                } else {
                    self.avatar.image = UIImage(named: "World")
                }
            }
            
//            self.spinner.stopAnimating()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}



