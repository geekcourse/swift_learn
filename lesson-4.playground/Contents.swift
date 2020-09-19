import UIKit

enum engineAction {
    case start, stop
}

enum actions {
    case windowOpen
    case windowClose
    case speedUp
    case speedDown
    case goToDrift
    case goToDrag
    case pedalVPol
    case extremeBrake
    case goToWork
    case load
    case unload
    case unloadAll
}

class Car {
    let name : String
    let doorCount : Int = 4
    var maxSpeed : Int = 120
    var engineState : String = "OFF"
    var windowState : String = "close"
    var currentSpeed : Int = 0
    
    init(name : String) {
        self.name = name
    }
    
    func engine(action : engineAction) {
        switch action {
        case .start:
            self.engineState = "ON"
        case.stop:
            self.engineState = "OFF"
        }
    }
    
    func action(with action : actions) {
        switch action {
        case .windowOpen:
            windowState = "open"
            print("Окна открыты")
        case .windowClose:
            windowState = "close"
            print("Окна закрыты")
        case .speedUp:
            if self.currentSpeed + 10 < self.maxSpeed {
                self.currentSpeed += 10
            } else {
                print("Достигнута максимальная скорость")
            }
        case .speedDown:
            if self.currentSpeed - 10 < 0 {
                print("Мы не движемся")
            } else {
                self.currentSpeed -= 10
            }
        default :
            break
        }
    }
    
}

class sportCar : Car {
    var color : String
        
    init(name: String, maxSpeed : Int, color : String) {
        self.color = color
        super.init(name: name)
        self.maxSpeed = maxSpeed
        
        if self.color == "red" {
            self.maxSpeed += 20
        }
    }
    
    
    override func action(with action : actions) {
        switch action {
        case .goToDrift:
            print("Поехали на дрифт")
        case .goToDrag:
            print("Поехали на драг")
        case .pedalVPol:
            self.currentSpeed = self.maxSpeed
            print("Максимальное ускорение, скорость \(self.maxSpeed)")
        case .extremeBrake:
            self.currentSpeed = 0
            print("Экстремальное торможение")
        default :
            super.action(with: action)
        }
    }
    
}

class trunkCar : Car {
    var maxLoad : Int
    var currentLoad : Int = 0
    
    init(name: String, maxLoad : Int) {
        self.maxLoad = maxLoad
        if name == "MAN" {
            self.maxLoad += 20
        }
        super.init(name: name)
    }
    
    override func action(with action : actions) {
        switch action {
        case .goToWork:
            if self.currentLoad != 0 {
                print("Поехали на маршрут")
            } else {
                print("Необходимо загрузиться")
            }
        case .load:
            if currentLoad + 50 < maxLoad {
                currentLoad += 50
            } else {
                print("Максимальная загрузка")
            }
        case .unload:
            if currentLoad - 10 < 0 {
                print("Нечего выгружать")
            } else {
                currentLoad -= 10
            }
        case .unloadAll:
            if currentLoad == 0 {
                print("Нечего выгружать")
            } else {
                currentLoad = 0
            }
        default :
            super.action(with: action)
        }
    }
    
}

var honda: sportCar = sportCar(name: "honda", maxSpeed: 200, color: "red")
honda.action(with: .goToDrag)
honda.action(with: .pedalVPol)
honda.action(with: .extremeBrake)
honda.action(with: .speedDown)
honda.action(with: .goToWork)

print("\n * * *           * * * \n")

var volvo: trunkCar = trunkCar(name: "volvo", maxLoad: 200)
volvo.action(with: .goToWork)
for _ in 1...4 {
    volvo.action(with: .load)
}
volvo.action(with: .goToWork)
volvo.action(with: .unload)
volvo.action(with: .unloadAll)
volvo.action(with: .unloadAll)


