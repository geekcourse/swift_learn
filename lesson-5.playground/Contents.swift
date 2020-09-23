enum actions {
    case engineOn
    case engineOff
    case windowOpen
    case windowClose
}

protocol Car {
    var engineState : String {get set}
    var windowState : String {get set}
    var color : String {get}
    
    func action(action: actions)
}

extension Car {
    func engineOn()-> String {
        print("Двигатель заведен")
        return "ON"
    }
    func engineOff()-> String {
        print("Двигатель заглушен")
        return "OFF"
    }
    func windowOpen()-> String {
        print("Окна открыты")
        return "open"
    }
    func windowClose()-> String {
        print("Окна закрыты")
        return "close"
    }
}

extension SportCar : CustomStringConvertible {
    var description: String {
        return "Спортивный автомобиль цвета \(color), максимальная скорость \(maxSpeed)"
    }
}

class SportCar : Car {
    var engineState: String = "OFF"
    var windowState: String = "close"
    var maxSpeed : Int
    var color: String
    
    
    func action(action: actions) {
        switch action {
        case .engineOn:
            self.engineState = engineOn()
        case .engineOff:
            self.engineState = engineOff()
        case .windowOpen:
            self.windowState = windowOpen()
        case .windowClose:
            self.windowState = windowClose()
        }
    }
    
    init(maxSpeed: Int, color : String) {
        self.color = color
        self.maxSpeed = maxSpeed
        if color == "red" {
            self.maxSpeed += 20
        }
    }
}

extension TruckCar : CustomStringConvertible {
    var description: String {
        return "Грузовой автомобиль цвета \(color), максимальная грузоподъемность \(maxLoad)"
    }
}

class TruckCar : Car {
    var engineState: String = "OFF"
    var windowState: String = "close"
    var maxLoad : Int
    var color: String
    
    func action(action: actions) {
        switch action {
        case .engineOn:
            self.engineState = engineOn()
        case .engineOff:
            self.engineState = engineOff()
        case .windowOpen:
            self.windowState = windowOpen()
        case .windowClose:
            self.windowState = windowClose()
        }
    }
    
    init(maxLoad : Int, color : String) {
        self.maxLoad = maxLoad
        self.color = color
    }
}

var sportCar = SportCar(maxSpeed: 200, color: "red")
sportCar.action(action: .engineOn)
print(sportCar.engineState)
print(sportCar.description)

var truckCar = TruckCar(maxLoad: 1500, color: "gray")
truckCar.action(action: .windowOpen)
print(truckCar.windowState)
print(truckCar.description)
