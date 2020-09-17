import UIKit

enum actions: String {
    case engineStart = "Завести двигатель"
    case engineStop = "Заглушить двигатель"
    case windowOpen = "Открыть окна"
    case windowClose = "Закрыть окна"
    case speedUp = "Ускориться"
    case speedDown = "Замедлиться"
    case load = "Загрузить багажник"
    case unload = "Выгрузить из багажника"
}
struct sportCar {
    let mark : String
    let year : Int
    var currentSpeed : Int
    var engineState : String = "OFF"
    var windowState : String
    
    
    init(mark: String, year: Int) {
        self.mark = mark
        self.year = year
        self.currentSpeed = 0
        self.windowState = "close"
    }
    
    mutating func action(action : actions) {
        print("Выполнение: \(self.mark) \(action.rawValue)")
        switch action {
        case .engineStart:
            print("\(self.mark) : Двигатель заведен")
            self.engineState = "ON"
        case .engineStop:
            print("\(self.mark) : Двигатель заглушен")
            self.engineState = "OFF"
        case .windowOpen:
            print("\(self.mark) : Окна открыты")
            self.windowState = "open"
        case .windowClose:
            print("\(self.mark) : Окна закрыты")
            self.windowState = "close"
        case .speedUp:
            print("\(self.mark) : Ускоряемся")
            self.currentSpeed += 10
        case .speedDown:
            print("\(self.mark) : Замедляемся")
            if self.currentSpeed != 0 {
                self.currentSpeed -= 10
            } else {
                print("Автомобиль не движется")
            }
        default:
            print("Данный автомобиль не поддерживает такое действие")
        
        }
        
    }
}

struct trunkCar {
    let mark : String
    let year : Int
    var engineState : String = "OFF"
    var windowState : String
    let capacity : Int
    var load : Int = 0
    
    init(mark: String, year: Int, capacity : Int) {
        self.mark = mark
        self.year = year
        self.capacity = capacity
        self.windowState = "close"
    }
    
    mutating func action(action : actions) {
        print("Выполнение: \(self.mark) \(action.rawValue)")
        switch action {
        case .engineStart:
            print("\(self.mark) : Двигатель заведен")
            self.engineState = "ON"
        case .engineStop:
            print("\(self.mark) : Двигатель заглушен")
            self.engineState = "OFF"
        case .windowOpen:
            print("\(self.mark) : Окна открыты")
            self.windowState = "open"
        case .windowClose:
            print("\(self.mark) : Окна закрыты")
            self.windowState = "close"
        case .load:
            print("\(self.mark) : Загрузка")
            if self.load + 10 < self.capacity {
                self.load += 10
            } else {
                print("Загружено максимально")
            }
        case .unload:
            print("\(self.mark) : Разгрузка")
            if self.load != 0 {
                self.load -= 10
            } else {
                print("Нечего разгружать")
            }
        default:
            print("Данный автомобиль не поддерживает такое действие")
        
        }
        
    }
}


var honda = sportCar(mark: "honda", year: 2009)
honda.action(action: actions.engineStart)
honda.action(action: actions.windowOpen)
for _ in 1...3 {
    honda.action(action: actions.speedUp)
}
print(honda.currentSpeed, honda.engineState, honda.windowState)


var volvo = trunkCar(mark: "volvo", year: 2019, capacity: 500)
volvo.action(action: actions.engineStart)
volvo.action(action: actions.windowOpen)
for _ in 1...3 {
    volvo.action(action: actions.load)
}
for _ in 1...4 {
    volvo.action(action: actions.unload)
}
print(volvo.load, volvo.engineState, volvo.windowState)
