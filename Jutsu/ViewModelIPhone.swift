//
//  ViewModelIPhone.swift
//  Jutsu
//
//  Created by Vincent Nguyen on 10/9/21.
//

import SwiftUI
import Foundation
import WatchConnectivity

class ViewModelPhone : NSObject,  WCSessionDelegate{

    var session: WCSession
    init(session: WCSession = .default){
            self.session = session
            super.init()
            self.session.delegate = self
            session.activate()
        
        }
    
    
    
    
  
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
       
    }
    
    
}
