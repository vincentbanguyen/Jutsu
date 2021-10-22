//
//  AnimalSign.swift
//  Jutsu
//
//  Created by Vincent Nguyen on 10/10/21.
//


import SwiftUI

import Combine
import WatchConnectivity

final class AnimalSign: ObservableObject {
    var session: WCSession
    let delegate: WCSessionDelegate
    let animalSubject = PassthroughSubject<String, Never>()
    let calibratingSubject = PassthroughSubject<Bool, Never>()
    
    let calibratePitchSubject = PassthroughSubject<Double, Never>()
    let calibrateRollSubject = PassthroughSubject<Double, Never>()
    
    @Published var animal: String = ""
    @Published var calibrating: Bool = false
    
    @Published var calibratePitch = Double.zero
    @Published var calibrateRoll = Double.zero
    
    init(session: WCSession = .default) {
        self.delegate = SessionDelegater(animalSubject: animalSubject, calibratingSubject: calibratingSubject, calibratePitchSubject: calibratePitchSubject, calibrateRollSubject: calibrateRollSubject)
        self.session = session
        self.session.delegate = self.delegate
        self.session.activate()
        
        animalSubject
            .receive(on: DispatchQueue.main)
            .assign(to: &$animal)
        
        calibratingSubject
            .receive(on: DispatchQueue.main)
            .assign(to: &$calibrating)
        
        calibratePitchSubject
            .receive(on: DispatchQueue.main)
            .assign(to: &$calibratePitch)
        
        calibrateRollSubject
            .receive(on: DispatchQueue.main)
            .assign(to: &$calibrateRoll)
    }
    
    func calibrateOn() {
        calibrating = true
        
    }
    
    func calibrateOff() {
        calibrating = false
    }
    
    func setCalibration(calibrateRoll: Double, calibratePitch: Double) {
        
        self.calibrateRoll = calibrateRoll
        self.calibratePitch = calibratePitch
        
        print("calibratePitch:   \(calibratePitch)")
        print("calibrateRoll:  \(calibrateRoll)")
    }
    
    func changeAnimalSign(selectedAnimal: String) {
        self.animal = selectedAnimal
        session.sendMessage(["animal": selectedAnimal], replyHandler: nil) { error in
            print(error.localizedDescription)
        }
    }
    

    
    
   
}
