//
//  ExtensionDelegate.swift
//  Jutsu WatchKit Extension
//
//  Created by Vincent Nguyen on 10/9/21.
//
import SwiftUI

var session: WKExtendedRuntimeSession!


class ExtensionDelegate: NSObject, WKExtensionDelegate, WKExtendedRuntimeSessionDelegate {

    func extendedRuntimeSession(_ extendedRuntimeSession: WKExtendedRuntimeSession, didInvalidateWith reason: WKExtendedRuntimeSessionInvalidationReason, error: Error?) {
        print("Session stopped at", Date())
        
        
        startSession()
    }

    func extendedRuntimeSessionDidStart(_ extendedRuntimeSession: WKExtendedRuntimeSession) {
        print("Session started at", Date())
    }

    func extendedRuntimeSessionWillExpire(_ extendedRuntimeSession: WKExtendedRuntimeSession) {
        
    }

    func applicationDidBecomeActive() {

        session.delegate = self
    }
    func startSession() {
        session = WKExtendedRuntimeSession()
        session.delegate = self
        session.start()
    }
    
    func stopSession() {
        
        session.invalidate()
    }
    
}
