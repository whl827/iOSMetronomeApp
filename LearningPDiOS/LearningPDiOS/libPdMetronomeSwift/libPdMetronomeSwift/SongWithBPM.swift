//
//  SongWithBPM.swift
//  libPdMetronomeSwift
//
//  Created by Woong Hee Lee on 3/12/19.
//  Copyright © 2019 Woong Hee Lee. All rights reserved.
//

import Foundation
import UIKit

class SongWithBPM {
    
    var title: String
    var artist: String
    var bpm: UInt
    var subdivision: UInt
    
    init(title: String, artist: String, bpm: UInt, subdivision: UInt)
    {
        self.title = title
        self.artist = artist
        self.bpm = bpm;
        self.subdivision = subdivision
    }
    
}
