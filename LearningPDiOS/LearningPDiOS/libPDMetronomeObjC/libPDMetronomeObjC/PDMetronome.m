//
//  PDMetronome.m
//  libPDMetronomeObjC
//
//  Created by Woong Hee Lee on 3/7/19.
//  Copyright © 2019 Woong Hee Lee. All rights reserved.
//

#import "PDMetronome.h"

@implementation PDMetronome

//modfiy setters for peroperties to send dat to lib PD
-(void)setBpm:(NSUInteger) bpm{
    _bpm = bpm; //referring to the class variable
    [PdBase sendFloat:_bpm toReceiver:@"bpm"];
}
-(void)setSubdivisions:(NSUInteger)subdivisions{
    _subdivisions = subdivisions;
    [PdBase sendFloat:_subdivisions toReceiver:@"subdivisions"];

}
-(void)setOn:(BOOL) on{
    _on = on;
    float yn = (float)on;
    [PdBase sendFloat:yn toReceiver:@"onOff"];
}


//custom initalizer
-(instancetype) initWithBPM:(NSUInteger)bpm andSubdivisions:(NSUInteger)subdivisions{
    void *patch;
    self = [super init];
    if(self){
        patch = [PdBase openFile:@"metronome.pd" path:[[NSBundle mainBundle]resourcePath]];
        if(!patch){
            NSLog(@"THERE IS NO PATCH!!!");
        }
        self.bpm = bpm;
        self.subdivisions = subdivisions;
        self.numOfNotes = 1;
    }
    return self;
}

//modify the standard initializer to init with a BPM of 60 and no subdivisions
-(instancetype)init{
    return [self initWithBPM:60 andSubdivisions:1];
}

@end
