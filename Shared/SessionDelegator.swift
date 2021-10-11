//
//  SessionDelegator.swift
//  Jutsu
//
//  Created by Vincent Nguyen on 10/9/21.
//

import Combine
import WatchConnectivity

class SessionDelegater: NSObject, WCSessionDelegate {
    let animalSubject: PassthroughSubject<String, Never>
    
    init(animalSubject: PassthroughSubject<String, Never>) {
        self.animalSubject = animalSubject
        super.init()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // Protocol comformance only
        // Not needed for this demo
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        DispatchQueue.main.async {
            if let animal = message["animal"] as? String {
                self.animalSubject.send(animal)
            } else {
                print("There was an error")
            }
        }
    }
    
    // iOS Protocol comformance
    // Not needed for this demo otherwise
    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("\(#function): activationState = \(session.activationState.rawValue)")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        // Activate the new session after having switched to a new watch.
        session.activate()
    }
    
    func sessionWatchStateDidChange(_ session: WCSession) {
        print("\(#function): activationState = \(session.activationState.rawValue)")
    }
    #endif
}
