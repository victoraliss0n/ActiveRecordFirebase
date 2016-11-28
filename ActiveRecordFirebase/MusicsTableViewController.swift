//
//  MusicsTableViewController.swift
//  ActiveRecordFirebase
//
//  Created by Victor Alisson on 27/11/16.
//  Copyright © 2016 Victor Alisson. All rights reserved.
//

import UIKit
import SCLAlertView
import SVProgressHUD
import Firebase

class MusicsTableViewController: UITableViewController {

    var musics = [Music]()
    var scl: SCLAlertView? = SCLAlertView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        observeMusics()
    }
    
    func observeMusics() {
        let alertViewResponder = self.scl?.showWait("Carregando", subTitle: "Aguarde um momento...")
        guard let currentUser = FIRAuth.auth()?.currentUser?.uid else {
            print("Usuário offline")
            return
        }
        UserMusic.asyncAll(path: currentUser, completion: {(json) in
            self.musics.removeAll()
            alertViewResponder?.close()
            for key in json.keys {
                Music.asyncAll(path: key, completion: { (json) in
                    let music = Music()
                    music.autor = json["autor"] as! String?
                    music.urlImage = json["urlImage"] as! String?
                    music.type = json["type"] as! String?
                    self.musics.append(music)
                    self.tableView.reloadData()
                })
            }
        })
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        //#warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return musics.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "music", for: indexPath) as! MusicTableViewCell
        let music = musics[indexPath.row]
        
        cell.autorLabel.text = music.autor!
        cell.typeLabel.text = music.type!
        cell.musicImageView.loadImageUsingCacheWithUrlString(music.urlImage!)
        
        return cell
    }

}
