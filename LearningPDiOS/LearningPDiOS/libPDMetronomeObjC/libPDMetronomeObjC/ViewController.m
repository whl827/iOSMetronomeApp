//
//  ViewController.m
//  libPDMetronomeObjC
//
//  Created by Woong Hee Lee on 3/6/19.
//  Copyright © 2019 Woong Hee Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *bpmLabel;
@property (weak, nonatomic) IBOutlet UISlider *bpmSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *subdivisionControl;
@property (weak, nonatomic) IBOutlet UISwitch *onOffSwitch;

@end

@implementation ViewController

//lazy instantiation
-(PDMetronome *)metronome{
    if(!_metronome){
        _metronome = [[PDMetronome alloc]initWithBPM:90 andSubdivisions:3];
        _metronome.on = NO;
    }
    return _metronome;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //after view is loaded, update the interface with data from the metronome instance
    self.onOffSwitch.on = self.metronome.isOn;
    self.bpmLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long) self.metronome.bpm];
    self.bpmSlider.value = self.metronome.bpm;
    self.subdivisionControl.selectedSegmentIndex = self.metronome.subdivisions;
}

//slider
- (IBAction)onBPMSliderChange:(id)sender {
    UISlider *slider = (UISlider *)sender;
    NSUInteger val = (NSUInteger)slider.value;
    //have the slider control the metronome bpm
    self.bpmLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)val];
    [self.metronome setBpm:val]; //self.metronome.bpm = val;
}

//subdivision
- (IBAction)onSubdivisionChange:(id)sender {
    UISegmentedControl *segCtrl = (UISegmentedControl *)sender;
    [self.metronome setSubdivisions:segCtrl.selectedSegmentIndex];
//    //self.metronome.subdivisions = segCtrl.selectedSegmentIndex;
}

//on off switch
- (IBAction)onSwitchChange:(id)sender {
    UISwitch *onOffSwitch = (UISwitch *)sender;
    [self.metronome setOn:onOffSwitch.on]; //self.metronome.on = onOffSwitch.on;

}
@end
