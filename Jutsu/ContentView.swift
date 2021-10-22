//
//  ContentView.swift
//  Jutsu
//
//  Created by Vincent Nguyen on 10/9/21.
//

import SwiftUI

import WatchConnectivity

struct ContentView: View {
    @StateObject var session = AnimalSign()
    @State var reachable = "No"
    
    var body: some View {
        VStack {
            Button(action: {
                
                session.calibrateOn()
                
            }) {
                Text("Calibrate")
            }
        switch session.animal {
        case "serpent":
            
            VStack {
            Text("🐍").font(Font.system(size: 100, weight: .semibold))
                Image( "serpent")
            }
            
        case "dragon":
            
            VStack {
            Text("🐲").font(Font.system(size: 100, weight: .semibold))
                Image( "dragon")
                
            }
            
        case "boar":
            
            VStack {
            Text("🐷").font(Font.system(size: 100, weight: .semibold))
                Image( "boar")
                
            }
        case "sheep":
            
            VStack {
            Text("🐏").font(Font.system(size: 100, weight: .semibold))
            
            
            Image( "sheep")
                
            }
        case "monkey":
            
            VStack {
            Text("🐵").font(Font.system(size: 100, weight: .semibold))
                Image( "monkey")
            }
        case "horse":
            
            VStack {
            Text("🐴").font(Font.system(size: 100, weight: .semibold))
                
                Image("horse")
            }
        case "tiger":
            
            VStack {
            Text("🐯").font(Font.system(size: 100, weight: .semibold))
            
            Image( "tiger")
            
        }
            
        default:
            Text("JUTSU").font(Font.system(size: 100, weight: .semibold))
            
        }
            
            Text("Reachable \(reachable)")
                       
                       Button(action: {
                           if self.session.session.isReachable {
                               self.reachable = "Yes"
                           }
                           else{
                               self.reachable = "No"
                           }
                           
                       }) {
                           Text("Update")
                       }
            
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
