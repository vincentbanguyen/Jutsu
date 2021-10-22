//
//  AccelerometerView.swift
//  Jutsu WatchKit Extension
//
//  Created by Vincent Nguyen on 10/9/21.
//
import CoreMotion
import SwiftUI


struct AccelerometerView: View {
    @StateObject var animal = AnimalSign()
    let extender = ExtensionDelegate()
    
    let motionManager = CMMotionManager()
    let queue = OperationQueue()

    @State private var pitch = Double.zero
    @State private var yaw = Double.zero
    @State private var roll = Double.zero
    @State var animalWeaved = false
    @State private var accelerationX = Double.zero
    @State private var accelerationY = Double.zero
    @State private var accelerationZ = Double.zero
    @State var jutsuArray: [String] = []
    @State var movement = false
    
    
    @State var orientationArray = [CGPoint(x: -0.096, y: -0.15), CGPoint(x: -1.34, y: -2.225), CGPoint(x: -0.6, y: 2.96), CGPoint(x: -0.405, y: -0.441), CGPoint(x: 0.11, y: 0.057), CGPoint(x: -0.905, y: -0.7989), CGPoint(x: -0.2, y: -0.36)]
   
    var xcelThreshold = 0.6
    
    
    var pitchSerpent = -0.096
   // var yawSerpent = -0.619
    var rollSerpent = -0.15
    
    
    var pitchDragon = -1.34
   // var yawDragon = -2.7316
    var rollDragon = -2.225
    
    var pitchBoar = -0.6
   // var yawBoar = 2.267
    var rollBoar = 2.96
    
    var pitchSheep = -0.405
   // var yawSheep = 0.05
    var rollSheep = -0.441
    
    var pitchMonkey = 0.11
   // var yawMonkey = -0.889
    var rollMonkey = 0.057
    
    var pitchHorse = -0.905
   // var yawHorse = -0.9459
    var rollHorse = -0.7989
    
    var pitchTiger = -0.2
   // var yawTiger = -1.03
    var rollTiger = -0.36
    
    

    
    
    var tolerance: CGFloat = 0.7

//     @StateObject var manager = LocationManager()


    

    var body: some View {

        VStack{
            
            Button(action: {
                extender.startSession()
            }) {
                Text("START")
            }
            
            
//            switch animal.animal {
//            case "serpent":
//                Text("🐍").font(Font.system(size: 100, weight: .semibold))
//
//            case "dragon":
//                Text("🐲").font(Font.system(size: 100, weight: .semibold))
//
//            case "boar":
//                Text("🐷").font(Font.system(size: 100, weight: .semibold))
//            case "sheep":
//                Text("🐏").font(Font.system(size: 100, weight: .semibold))
//            case "monkey":
//                Text("🐵").font(Font.system(size: 100, weight: .semibold))
//            case "horse":
//                Text("🐴").font(Font.system(size: 100, weight: .semibold))
//            case "tiger":
//                Text("🐯").font(Font.system(size: 100, weight: .semibold))
//
//
//
//
//
//
//            default:
//                Text("JUTSU").font(Font.system(size: 30, weight: .semibold))
//
//            }
            
            
            Button(action: {
                extender.stopSession()
                
            }) {
                Text("STOP")
            }
            
            
            // add button to start and stop
//            Text("Pitch: \(pitch)")
//            Text("Yaw: \(yaw)")
//            Text("Roll: \(roll)")
//            Text("xcelX: \(accelerationX)")
//            Text("xcelY: \(accelerationY)")
//            Text("xcelZ: \(accelerationZ)")
            
        }//Vstack
        .onAppear {
           
           
            
                print("ON APPEAR")
                self.motionManager.startDeviceMotionUpdates(to: self.queue) { (data: CMDeviceMotion?, error: Error?) in
                    guard let data = data else {
                        print("Error: \(error!)")
                        return
                    }
                    let attitude: CMAttitude = data.attitude
                    let userAcceleration = data.userAcceleration
                    
                    
                    
                    
//
                  print("pitch: \(attitude.pitch)")
//                    print("yaw: \(attitude.yaw)")
                    print("roll: \(attitude.roll)")
//                    print("accelerationX: \(userAcceleration.x)")
//                    print("accelerationY: \(userAcceleration.y)")
//                    print("accelerationZ: \(userAcceleration.z)")

//
                    
                   
                    
                    if movement == false && (accelerationX > xcelThreshold || accelerationY > xcelThreshold || accelerationZ > xcelThreshold) {
                        
                        
                        
                        
                     
                        
                        
                    //    print("movement began")
                        self.movement = true
                        
                    }
                    else if movement == true {
                        self.movement = false
                        
                        
                        let closestOrientation = orientationArray.enumerated().min( by: { hypotf(Float($0.1.x - CGFloat(attitude.pitch)),Float($0.1.y - CGFloat(attitude.roll))) < hypotf(Float($1.1.x - CGFloat(attitude.pitch)),Float($1.1.y - CGFloat(attitude.roll))) } )!
                        
                        
                        if animalWeaved == false {
                        switch closestOrientation.offset {
                        case 0:
                            checkAnimalSign(animal: "serpent")
                        case 1:
                            checkAnimalSign(animal: "dragon")
                        case 2:
                            checkAnimalSign(animal: "boar")
                        case 3:
                            checkAnimalSign(animal: "sheep")
                        case 4:
                            checkAnimalSign(animal: "monkey")
                        case 5:
                            checkAnimalSign(animal: "horse")
                        case 6:
                            checkAnimalSign(animal: "tiger")
                        default:
                            checkAnimalSign(animal: "serpent")
                            
                        }
                        }
                        
//                        if (abs(attitude.pitch - pitchSerpent) < tolerance) && (abs(attitude.roll - rollSerpent) < tolerance) {
//                            checkAnimalSign(animal: "serpent")
//                        }
//
//                        else if (abs(attitude.pitch - pitchDragon) < tolerance) && (abs(attitude.roll - rollDragon) < tolerance) {
//                            checkAnimalSign(animal: "dragon")
//                        }
//
//                        else if (abs(attitude.pitch - pitchBoar) < tolerance) && (abs(attitude.roll - rollBoar) < tolerance) {
//                            checkAnimalSign(animal: "boar")
//                        }
//
//                        else if (abs(attitude.pitch - pitchSheep) < tolerance) && (abs(attitude.roll - rollSheep) < tolerance) {
//                            checkAnimalSign(animal: "sheep")
//                        }
//
//                        else if (abs(attitude.pitch - pitchMonkey) < tolerance) && (abs(attitude.roll - rollMonkey) < tolerance) {
//                            checkAnimalSign(animal: "monkey")
//                        }
//
//                        else if (abs(attitude.pitch - pitchHorse) < tolerance) && (abs(attitude.roll - rollHorse) < tolerance) {
//                            checkAnimalSign(animal: "horse")
//                        }
//
//                        else if (abs(attitude.pitch - pitchTiger) < tolerance) && (abs(attitude.roll - rollTiger) < tolerance) {
//                            checkAnimalSign(animal: "tiger")
//                        }
                        
                        
                        
                    //    print("movement ended")
                        
                  
//
//                        print("pitch: \(attitude.pitch)")
//                        print("yaw: \(attitude.yaw)")
//                        print("roll: \(attitude.roll)")
//                        print("accelerationX: \(userAcceleration.x)")
//                        print("accelerationY: \(userAcceleration.y)")
//                        print("accelerationZ: \(userAcceleration.z)")
                        
                        
                        
                    }
    

                    DispatchQueue.main.async {
                        self.pitch = attitude.pitch
                        self.yaw = attitude.yaw
                        self.roll = attitude.roll
                        self.accelerationX = userAcceleration.x
                        self.accelerationY = userAcceleration.y
                        self.accelerationZ = userAcceleration.z
                    }
                }
            }//.onappear
        
        
        
    }//view
    
    func checkAnimalSign(animal: String) {
        
        animalWeaved = true
            if jutsuArray.count > 0 {
                if jutsuArray[jutsuArray.count - 1] != animal {
                    print("\(animal) sign Weaved.")
                    jutsuArray.append("\(animal)")
                    self.animal.changeAnimalSign(selectedAnimal: animal)
                    WKInterfaceDevice.current().play(.start)
                }
            }
            else {
                jutsuArray.append("\(animal)")
                self.animal.changeAnimalSign(selectedAnimal: animal)
                WKInterfaceDevice.current().play(.start)
            }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
        animalWeaved = false
        }
    }
    
}//struct
