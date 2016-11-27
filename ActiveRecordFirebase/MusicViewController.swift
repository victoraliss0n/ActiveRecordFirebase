//
//  MusicViewController.swift
//  ActiveRecordFirebase
//
//  Created by Victor Alisson on 26/11/16.
//  Copyright © 2016 Victor Alisson. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker: UIImagePickerController!
    
    @IBOutlet var imageMusic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            imageMusic.image = image
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func addImageTapped(_ sender: Any) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
}
