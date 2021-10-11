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
    let subject = PassthroughSubject<String, Never>()
    
    @Published var animal: String = ""
    
    init(session: WCSession = .default) {
        self.delegate = SessionDelegater(animalSubject: subject)
        self.session = session
        self.session.delegate = self.delegate
        self.session.activate()
        
        subject
            .receive(on: DispatchQueue.main)
            .assign(to: &$animal)
    }
    
    func changeAnimalSign(selectedAnimal: String) {
        self.animal = selectedAnimal
        session.sendMessage(["animal": selectedAnimal], replyHandler: nil) { error in
            print(error.localizedDescription)
        }
    }
    

    
    
   
}
