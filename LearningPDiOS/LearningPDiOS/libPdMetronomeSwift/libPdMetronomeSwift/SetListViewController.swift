//
//  SetListViewController.swift
//  libPdMetronomeSwift
//
//  Created by Woong Hee Lee on 3/12/19.
//  Copyright © 2019 Woong Hee Lee. All rights reserved.
//

import UIKit

class SetListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedBpm : UInt = 90
    var selectedSubdivision: UInt = 1
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SongListModel.sharedInstance.numOfSongs()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "songListCell") as? SongListTableViewCell//custom cell name
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "songListCell") as? SongListTableViewCell
        }
        //what to put on cell
        cell?.songTitle.text = SongListModel.sharedInstance.getListOfSongs()[indexPath.row].title
        cell?.songBpm.text = String(SongListModel.sharedInstance.getListOfSongs()[indexPath.row].bpm) + " bpm"

        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) //highlight and goes away
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segue_name = segue.identifier
        if(segue_name == "ShowSongBpmSegue"){ //call after selecting one of the cells
            //get the index of cell pressed
            let cell = sender as! UITableViewCell
            let index = tableView.indexPath(for: cell)!.row
            selectedBpm = SongListModel.sharedInstance.getListOfSongs()[index].bpm;
            selectedSubdivision = SongListModel.sharedInstance.getListOfSongs()[index].subdivision;
            
            print(selectedBpm)
            print(selectedSubdivision)
            
            //pass back bpm and subdivision
            let tabBarController = segue.destination as! UITabBarController
            let destinationViewController = tabBarController.viewControllers![0] as! MetronomeViewController // or whatever tab index you're trying to access
            destinationViewController.bpm = selectedBpm
            destinationViewController.subdivision = selectedSubdivision - 1
        }
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue){

        
        if(unwindSegue.identifier == "AddNewSongUnwind"){
            let avc = unwindSegue.source as! AddViewController
            //Add A New Song to the array
            SongListModel.sharedInstance.addSong(song: avc.getNewSong())
            tableView.reloadData()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.separatorStyle = .none
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
