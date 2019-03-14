//
//  PDMetronome.h
//  libPDMetronomeObjC
//
//  Created by Woong Hee Lee on 3/7/19.
//  Copyright © 2019 Woong Hee Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PdDispatcher.h"

NS_ASSUME_NONNULL_BEGIN

@interface PDMetronome : NSObject

@property (assign, nonatomic) NSUInteger bpm;
@property (assign, nonatomic) NSUInteger subdivisions;
@property (assign, nonatomic) NSUInteger numOfNotes;
@property (assign, nonatomic, getter=isOn) BOOL on; // follow ios convention for getter


-(instancetype) initWithBPM: (NSUInteger)bpm andSubdivisions:(NSUInteger)subdivisions;

@end

NS_ASSUME_NONNULL_END
