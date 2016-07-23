//
//  ViewController.swift
//  firebase-storage-test
//
//  Created by Jess Rascal on 06/07/2016.
//  Copyright © 2016 JustOneJess. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var imageRef: FIRStorageReference!
    
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func downloadTapped(_ sender: AnyObject) {
        imageRef = FIRE_STORAGE_REF.child("Slack for iOS Upload-1.jpg")
        print("Ref: \(imageRef)")
        
        downloadImage(imageRef: imageRef)
        
    }

    @IBAction func uploadTapped(_ sender: AnyObject) {
        let imageData = UIImagePNGRepresentation(UIImage(named: "devslopes-logo.png")!)
        let logoRef = FIRE_STORAGE_REF.child("uploaded/logo.png")
        
        if let image = imageData {
            logoRef.put(image, metadata: nil) { (metadata, error) in
                if error != nil {
                    print("Error uploadin")
                } else {
                    print("Image metadata: \(metadata!.downloadURL)")
                    self.downloadImage(imageRef: logoRef)
                }
            }
        }
    }
    
    func downloadImage(imageRef: FIRStorageReference) {
        // Download the image
        imageRef.data(withMaxSize: 1 * 800 * 800) { (data, error) in
            if error != nil {
                print("Error Downloading: \(error?.localizedDescription)")
            } else {
                print("Image downloaded")
                self.imageView.image = UIImage(data: data!)
            }
        }
    }
    
    @IBAction func loginTapped(_ sender: AnyObject) {
            
            FIRAuth.auth()?.createUser(withEmail: "hardcoded@jess.com", password: "123456", completion: { (user, error) in
                if error != nil {
                    print("FIREBASE Authentication unsucessful")
                    print("FIREBASE Authentication error: \(error?.localizedDescription)")
                } else {
                    print("FIREBASE Authentication successful")
                }
            })
    }
    
    
    
}

