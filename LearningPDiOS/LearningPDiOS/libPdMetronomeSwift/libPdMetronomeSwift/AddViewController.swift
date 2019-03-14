//
//  AddViewController.swift
//  libPdMetronomeSwift
//
//  Created by Woong Hee Lee on 3/12/19.
//  Copyright © 2019 Woong Hee Lee. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var bpmText: UITextField!
    @IBOutlet weak var subdivisionText: UITextField!
    
    var newSong : SongWithBPM?
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
       
        let new_title = titleText?.text
        let new_artist = artistText?.text
        let new_bpm = bpmText?.text
        let new_subdivision = subdivisionText?.text
        
        if((new_title?.isEmpty)! || (new_artist?.isEmpty)!  ||
           (new_bpm?.isEmpty)!   || (new_subdivision?.isEmpty)!) {
            warningLabel.text = "Please fill in all fields"
            return false;
        }
        else if(Int(new_bpm!)! < 30 || Int(new_bpm!)! > 220){
            warningLabel.text = "The BPM Range is 30 - 220"
            return false;
        }
        else if(Int(new_subdivision!)! < 1 || Int(new_subdivision!)! > 8){
            warningLabel.text = "The Subdivision Range is 1 - 8"
            return false;
        }
        return true;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let new_title = titleText?.text
        let new_artist = artistText?.text
        let new_bpm = bpmText?.text
        let new_subdivision = subdivisionText?.text
        
        newSong = SongWithBPM(title: new_title!, artist: new_artist!, bpm: UInt(new_bpm!)!, subdivision: UInt(new_subdivision!)!)
        //clear all fields
        clearText()
    }
    
    //go back
    @IBAction func didPressCancel(_ sender: UIBarButtonItem) {
        clearText()
        dismiss(animated: true, completion: nil)
    }
    //
    func getNewSong() -> SongWithBPM {
        return newSong!
    }
    
    func clearText(){
        titleText.text = nil
        artistText.text = nil
        bpmText.text = nil
        warningLabel.text = nil
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
