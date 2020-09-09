import UIKit

//2*x^2 -7*x + 5 = 0 - 2 корня
//2,5*x^2 -7*x + 5 = 0 - корней нет
//2*x^2 -4*x + 2 = 0 - корней нет
let a: Float = 2
let b: Float = -4
let c: Float = 2

var D: Float
var x1: Float
var x2: Float

D = b*b - 4*a*c
if (D < 0.0) {
    print("Корней нет")
} else if (D == 0) {
    x1 = -b / (2*a)
    print("1 корень: x1=\(x1)")
} else {
    x1 = (-b + sqrt(D))/(2*a)
    x2 = (-b - sqrt(D))/(2*a)
    print("2 корня: x1=\(x1), x2=\(x2)")
}


let k1: Float = 4
let k2: Float = 7
var g: Float
var s: Float
var p: Float
g = sqrt(k1*k1 + k2*k2)
s = (k1*k2) / 2
p = k1+k2+g
print("Гипотенуза: \(g), Площадь: \(s), Периметр: \(p)")

let start: Float = 10000
var sum = start
let percent: Float = 10
let y: Int = 5


for _ in 1...y {
    sum += sum*percent/100
}
print("Вклад - \(start); Процент: \(percent); Срок: \(y); Итог: \(sum)")



