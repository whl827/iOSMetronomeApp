//
//  PDPatch.m
//  PracticeLibPD
//
//  Created by Woong Hee Lee on 3/6/19.
//  Copyright © 2019 Woong Hee Lee. All rights reserved.
//

#import "PDPatch.h"

@implementation PDPatch

-(void)onOff:(BOOL)yesNo{
    //send message to pd
    float yn = (float)yesNo;
    [PdBase sendFloat:yn toReceiver:@"onOff"];
}
-(instancetype)initWithFile:(NSString *)pdFile{
    
    void *patch;
    self = [super init];
    if(self){
        //init code
        patch = [PdBase openFile:pdFile path:[[NSBundle mainBundle] resourcePath]];
        //if patch is not loaded, alert
        if(!patch){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Uh-oh" message:@"pd pathc not found" delegate:self cancelButtonTitle:@"Crap" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    return self;
}

@end
