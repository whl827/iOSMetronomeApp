//
//  SongListModel.swift
//  libPdMetronomeSwift
//
//  Created by Woong Hee Lee on 3/12/19.
//  Copyright © 2019 Woong Hee Lee. All rights reserved.
//

import Foundation

class SongListModel{
    
    private init(){
        list = Array<SongWithBPM>()

        //adding dummy data
        let downPicking = SongWithBPM(title: "Down Picking", artist: "none", bpm: 140, subdivision: 1)
        let alternatePicking = SongWithBPM(title: "Alternate Picking", artist: "none", bpm: 90, subdivision: 4)
        let chromatic = SongWithBPM(title: "Chromatic Exercise", artist: "none", bpm: 100, subdivision: 4)
        let sweeping = SongWithBPM(title: "Sweeping Exercise", artist: "none", bpm: 50, subdivision: 2)
        let legato = SongWithBPM(title: "Legato Exercise", artist: "none", bpm: 95, subdivision: 1)
        list.append(downPicking)
        list.append(alternatePicking)
        list.append(chromatic)
        list.append(sweeping)
        list.append(legato)
    }
    
    var list : Array<SongWithBPM>
    //how other classes call
    static let sharedInstance = SongListModel()
    
    func addSong(song: SongWithBPM){
        list.append(song)
    }
    func removeSongAt(index: Int)
    {
        list.remove(at: index)
    }
    func numOfSongs() -> Int {
        return list.count
    }
    func getListOfSongs() -> Array<SongWithBPM> {
        return list
    }
    
    
    
}
