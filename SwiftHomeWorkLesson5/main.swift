//
//  main.swift
//  SwiftHomeWorkLesson5
//
//  Created by N3L1N on 02/01/2022.
//

import Foundation

enum windows {
    case opened, closed
}

enum engine {
    case started, stoped
}

protocol Car{
    var model:String {get}
    var realeaseYear:Int{get}
    var windows:windows{get set}
    var engine:engine{get set}
}


extension Car {
    mutating func Windows(status:windows){
        switch status {
        case .opened:
            print("\(model): windows are opened")
            self.windows = .opened
        case .closed:
            print("\(model): windows are closed")
            self.windows = .closed
        }
    }
    
    mutating func Engine(status:engine){
        switch status {
        case .started:
            print("\(model): engine started")
            self.engine = .started
        case .stoped:
            print("\(model): engine stoped")
            self.engine = .stoped
        }
    }
}

protocol TrunkCar:Car {
    var bodyVolume:Int{get}
    var bodyFreeSpace:Int{get}
    var cargoVolume:Int{get set}
}


extension TrunkCar {
    mutating func PutCargoBody(volume:Int) {
        if bodyFreeSpace >= volume {
            print("\(model): cargo volume \(volume) put to body")
            self.cargoVolume += volume
        } else {
            print("? \(model): Not space in cargo volume \(volume)")
        }
    }
    mutating func RemoveCargoBody(volume:Int) {
        if self.bodyVolume >= volume{
            print("\(model): cargo volume \(volume) remove from the body")
            self.cargoVolume -= volume
        } else {
            print("? \(model): Not such of cargo \(volume) in the body")
        }
    }
}


protocol SportCar:Car {
    var maxSpeed:Int{get}
    var currentSpeed:Int{get set}
}
    
extension SportCar{
    mutating func IncreaseSpeed(speed:Int){
        if speed + currentSpeed <= maxSpeed{
            print("\(model): burned engine \(speed)")
            self.currentSpeed += speed
        } else {
            print("? \(model): can not accelerate speed \(speed + currentSpeed) maximal speed: \(maxSpeed)")
        }
    }

    mutating func ReduceSpeed(speed: Int){
        if self.currentSpeed >= speed {
            print("\(model): slown down \(speed)")
            self.currentSpeed -= speed
        } else {
            print("? \(model) stoped")
            self.currentSpeed = 0
        }
    }
}


class trunkCar:TrunkCar {
    var model: String
    var realeaseYear: Int
    var windows: windows
    var engine: engine
    let bodyVolume: Int
    var bodyFreeSpace: Int {
        get{return bodyVolume - cargoVolume}
    }
    var cargoVolume: Int
    
    init(model:String, realeaseYear:Int, bodyVolume:Int) {
        self.bodyVolume = bodyVolume
        self.cargoVolume = 0
        self.model = model
        self.realeaseYear = realeaseYear
        self.engine = .stoped
        self.windows = .closed
    }
}

class sportCar:SportCar {
    var maxSpeed: Int
    var currentSpeed: Int
    var model: String
    var realeaseYear: Int
    var windows: windows
    var engine: engine
    
    init(model:String, realeaseYear:Int, maxSpeed:Int){
        self.maxSpeed = maxSpeed
        self.currentSpeed = 0
        self.model = model
        self.realeaseYear = realeaseYear
        self.windows = .closed
        self.engine = .stoped
    }
}

extension trunkCar:CustomStringConvertible{
    var description: String {
        return "Car: \(model)\n" +
        "realease year: \(realeaseYear)\n" +
        "body volume: \(bodyVolume)\n" +
        "cargo volume: \(cargoVolume)\n" +
        "engine status: \(engine)\n" +
        "windows status: \(windows)\n"
    }
}

extension sportCar:CustomStringConvertible{
    var description: String{
        return "Car: \(model)\n" +
        "realease year: \(realeaseYear)\n" +
        "current speed: \(currentSpeed)\n" +
        "max speed: \(maxSpeed)\n" +
        "engine status: \(engine)\n" +
        "windows status: \(windows)\n"
    }
}


var ferrari = sportCar(model: "Ferrari", realeaseYear: 2008, maxSpeed: 360)
var tesla = sportCar(model: "Tesla", realeaseYear: 2020, maxSpeed: 315)
var man = trunkCar(model: "Man", realeaseYear: 2012, bodyVolume: 3500)
var volvo = trunkCar(model: "Volvo", realeaseYear: 2002, bodyVolume: 3000)

ferrari.Engine(status: .started)
ferrari.Windows(status: .opened)
ferrari.IncreaseSpeed(speed: 70)
ferrari.IncreaseSpeed(speed: 400)
ferrari.ReduceSpeed(speed: 40)

tesla.Engine(status: .started)
tesla.IncreaseSpeed(speed: 200)

man.PutCargoBody(volume: 500)
man.PutCargoBody(volume: 1000)
man.Engine(status: .started)

volvo.Windows(status: .opened)


print(ferrari)
print(tesla)
print(man)
print(volvo)



































