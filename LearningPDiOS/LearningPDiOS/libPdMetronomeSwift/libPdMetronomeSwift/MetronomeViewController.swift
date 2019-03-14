//
//  MetronomeViewController.swift
//  libPdMetronomeSwift
//
//  Created by Woong Hee Lee on 3/11/19.
//  Copyright © 2019 Woong Hee Lee. All rights reserved.
//

import UIKit

class MetronomeViewController: UIViewController {

    @IBOutlet weak var bpmLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var bpmSlider: UISlider!
    @IBOutlet weak var subdivisionControl: UISegmentedControl!
    @IBOutlet weak var fastForwardButton: UIButton!
    @IBOutlet weak var rewindButton: UIButton!
    
    var metronome: PDMetronome?
    
    var bpm: UInt = 90
    var subdivision: UInt = 0
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setSongBpm(bpm: bpm, subdivision: subdivision)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        metronome = PDMetronome(bpm: 90, andSubdivisions: 0);
        
        let val = metronome!.bpm
        bpmLabel.text = String(val) //update bpm label
        bpmSlider.value = Float(val)
        subdivisionControl.selectedSegmentIndex = Int(arc4random_uniform(0))
        
        let fastForwardDoubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(doubleTapFastForward(_:)))
        fastForwardDoubleTapGesture.numberOfTapsRequired = 2;
        fastForwardButton.addGestureRecognizer(fastForwardDoubleTapGesture)
        
        let fastForwardLongGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressFastForward(_:)))
        fastForwardLongGesture.minimumPressDuration = 1.0
        fastForwardButton.addGestureRecognizer(fastForwardLongGesture)
        
        let rewindDoubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(doubleTapRewind(_:)))
        rewindDoubleTapGesture.numberOfTapsRequired = 2;
        rewindButton.addGestureRecognizer(rewindDoubleTapGesture)
        
        let rewindLongGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressRewind(_:)))
        rewindLongGesture.minimumPressDuration = 1.0
        rewindButton.addGestureRecognizer(rewindLongGesture)
        
        let swipeUpGesture = UIPanGestureRecognizer(target: self, action: #selector(bpmSwipeGesture(_:)))
        bpmLabel.addGestureRecognizer(swipeUpGesture)
        

        let swipeDownGesture = UIPanGestureRecognizer(target: self, action: #selector(bpmSwipeGesture(_:)))
        bpmLabel.addGestureRecognizer(swipeDownGesture)
        
    }
    
    @objc func bpmSwipeGesture(_ sender: UIPanGestureRecognizer)
    {
        let velocity = sender.velocity(in: bpmLabel)
        
        if(velocity.x > 0){
            increaseBpm(amount: 1)
        }
        else
        {
            decreaseBpm(amount: 1)
        }
        
        if(velocity.y > 0)
        {   //up
            decreaseBpm(amount: 1)
        }
        else
        {   //down
            increaseBpm(amount: 1)
        }
    }
//
//    @objc func swipeUpBpm(_ sender: UIPanGestureRecognizer){
//        increaseBpm(amount: 1)
//    }
//    @objc func swipeDownBpm(_ sender: UIPanGestureRecognizer){
//        decreaseBpm(amount: 1)
//    }
    
    @objc func doubleTapFastForward(_ sender: UIGestureRecognizer){
        increaseBpm(amount: 5)
    }
    
    @objc func longPressFastForward(_ sender: UIGestureRecognizer){
        increaseBpm(amount: 10)
    }
    
    @objc func doubleTapRewind(_ sender: UIGestureRecognizer){
        decreaseBpm(amount: 5)
    }
    
    @objc func longPressRewind(_ sender: UIGestureRecognizer){
        decreaseBpm(amount: 10)
    }
    
    
    //change slider value and update bpm
    @IBAction func onSliderChange(_ sender: UISlider) {
        let val = UInt(sender.value)
        bpmLabel.text = String(val)
        metronome?.bpm = val; //self.metronome.bpm = val;
    }
    //subdivision change
    @IBAction func onSubdivisionChanged(_ sender: UISegmentedControl) {
        metronome?.subdivisions = UInt(sender.selectedSegmentIndex);
    }
    //play or stop metronome
    @IBAction func onPlayButtonPressed(_ sender: UIButton) {
        let image = metronome!.isOn ? UIImage(named: "play") : UIImage(named: "stop")
        playButton.setImage(image, for: .normal)
        metronome?.isOn = !metronome!.isOn
    }
    //slow down bpm
    @IBAction func onRewindButtonPressed(_ sender: UIButton) {
        decreaseBpm(amount: 1)
    }
    //increase bpm
    @IBAction func onFastForwardButtonPressed(_ sender: UIButton) {
        increaseBpm(amount: 1)
    }
    //function for increasing bpm
    func increaseBpm(amount: UInt){
        if(metronome!.bpm < 220){
            let new_val = metronome!.bpm + amount
            let val = new_val > 220 ? 220 : new_val//decrease bpm by one
            bpmLabel.text = String(val) //update bpm label
            bpmSlider.value = Float(val) //update slider position
            metronome?.bpm = val; //self.metronome.bpm = val;
        }
    }
    //function for descresing bpm
    func decreaseBpm(amount: UInt){
        if(metronome!.bpm > 30){
            let new_val = metronome!.bpm - amount
            let val = new_val < 30 ? 30 : new_val //decrease bpm by one
            bpmLabel.text = String(val) //update bpm label
            bpmSlider.value = Float(val) //update slider position
            metronome?.bpm = val; //self.metronome.bpm = val;
        }
    }
    
    override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {

    }
    
    func setSongBpm(bpm: UInt, subdivision: UInt){
        if(bpm >= 30 && bpm <= 220 && subdivision >= 0 && subdivision <= 7){
            
            //change bpm value, bpm lable, slider value, slider, subdivison val and controler
            metronome?.bpm = bpm;
            metronome?.subdivisions = subdivision
            bpmLabel.text = String(bpm) //update bpm label
            bpmSlider.value = Float(bpm) //update slider position
            subdivisionControl.selectedSegmentIndex = Int(subdivision)
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let image = UIImage(named: "play")
        playButton.setImage(image, for: .normal)
        metronome?.isOn = false
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

    }
 

}
