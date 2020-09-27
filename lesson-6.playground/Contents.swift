struct Basket<T: Autopart> {
    private var items: [T] = []
    
    mutating func push(_ element: T) {
        items.append(element)
    }
    mutating func pop() -> T? {
        return items.removeLast()
    }
    
    func filter(predicate: (T) -> Bool ) -> [T] {
        var mas = [T]()
        for item in items {
            if predicate(item) {
                mas.append(item)
            }
        }
        return mas
    }
    
    func discount(predicate: (T) -> T) -> [T] {
        var mas : [T] = []
        for item in items {
            predicate(item)
            mas.append(item)
        }
        return mas
    }
   
    subscript(indexes: Int ...) -> Int? {
        var allcost = 0
        for index in indexes {
            guard items.indices.contains(index) else {
                return nil
            }
            allcost += items[index].cost
        }
        return allcost
    }
}


enum brands: String {
    case Yamaha
    case Honda
    case Kawasaki
}

protocol Autopart {
    var brand: String { get }
    var type : String { get }
    var cost : Int { get }
}

class MotorcyclePart : Autopart, CustomStringConvertible {
    var description: String {
        return "Запчасть \(type) для \(brand), стоимость \(cost)"
    }
    
    var brand: String
    var type: String
    var cost : Int
    
    init(brand : brands, type : String, cost : Int) {
        self.brand = brand.rawValue
        self.type = type
        self.cost = cost
    }
    
    
    
    
}

let part1 = MotorcyclePart(brand: .Yamaha, type: "crankshaft", cost: 5000)
let part2 = MotorcyclePart(brand: .Honda, type: "spark", cost: 10)
let part3 = MotorcyclePart(brand: .Kawasaki, type: "wheel", cost: 300)
let part4 = MotorcyclePart(brand: .Yamaha, type: "tank", cost: 1200)
let part5 = MotorcyclePart(brand: .Honda, type: "arm", cost: 99)
let part6 = MotorcyclePart(brand: .Kawasaki, type: "relay", cost: 145)
let parts = [part1, part2, part3, part4, part5, part6]
var buys = Basket<MotorcyclePart>()
parts.forEach {
    buys.push($0)
}

if let cost = buys[0,5,3] {
    print(cost)
}
print(buys[6] ?? "Нет такой запчасти в корзине")

let filtered = buys.filter() {
    return $0.cost == 5000
}
filtered.forEach{
    print($0.description)
}
print("*** *** *** ***")
let discounted = buys.discount() {
    $0.cost -= Int(Double($0.cost) * 0.1)
    return $0
}
discounted.forEach{
    print($0.description)
}

