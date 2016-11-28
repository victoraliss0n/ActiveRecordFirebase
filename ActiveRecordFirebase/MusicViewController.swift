//
//  MusicViewController.swift
//  ActiveRecordFirebase
//
//  Created by Victor Alisson on 26/11/16.
//  Copyright © 2016 Victor Alisson. All rights reserved.
//

import UIKit
import SCLAlertView
import Firebase
import SVProgressHUD

class MusicViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker: UIImagePickerController!
    
    @IBOutlet var imageMusic: UIImageView!
    
    @IBOutlet var autorLabel: UITextField!
    @IBOutlet var typeLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            imageMusic.image = image
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addImageTapped(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addMusic(_ sender: Any) {
        
        guard let imageMusic = imageMusic.image, let autor = autorLabel.text, let typeMusic = typeLabel.text else {
            return
        }
        let data = UIImageJPEGRepresentation(imageMusic, 0.1)
        
        let music = Music()
        music.autor = autor
        music.type = typeMusic
        
        //Relantionship: User-Musics
        let userMusic = UserMusic()
        userMusic.idMusic = UserMusic.modelID
        userMusic.idUser = FIRAuth.auth()!.currentUser!.uid
        
        addMusicFirebase(music: music, userMusic: userMusic, data: data!)
        
    }
    
    private func addMusicFirebase(music: Music, userMusic: UserMusic, data: Data) {
        SVProgressHUD.show(withStatus: "Salvando...")

        Music.upload(data: data, entity: music, completion: {(url) in
            music.urlImage = url
            music.save(path: userMusic.idMusic!, completion: { (error) in
                if error != nil {
                    print("\(error?.localizedDescription)")
                }
            })
            userMusic.update(path: "\(userMusic.idUser!)", completion: { (error) in
                if error == nil {
                    SVProgressHUD.dismiss()
                    _ = self.navigationController?.popViewController(animated: true)
                }
            })
        })
    }
}
