enum FileError: String, Error {
    case noaccess = "Нет такого файла или Вы не владелец"
    case isntowner = "У Вас нет доступа к этому файлу"
    case tobig = "Превышен максимальный контент"
    case notfound = "Файл не найден"
}


struct File{
    let name: String
    let path: String
    let owner: String
    let maxcontent: Int
}


class FileManager {
    var allfiles = [
        "file1" : File(name: "file1", path: "/home/user1/", owner: "user1", maxcontent: 10),
        "file2" : File(name: "file2", path: "/home/user2/", owner: "user2", maxcontent: 20),
        "file3" : File(name: "file3", path: "/home/user1/", owner: "user2", maxcontent: 30),
        "file4" : File(name: "file4", path: "/home/user2/", owner: "user1", maxcontent: 40),
    ]
    let user : String
    
    
    init(user : String) {
        self.user = user
    }

    

    func read(path : String, name : String) -> (File?, FileError?) {
        var result: (File?, FileError?)
        for i in allfiles {
            if (i.value.name == name) && (i.value.path == path) && (self.user == i.value.owner) {
                result = (i.value, nil)
                break
            }
        }
        guard result.0 != nil else {
            return (nil, .noaccess)
        }
        return result
    }
    
    func wright(path : String, name : String, content : Int) throws -> File {
        var filetowright : File?
        for i in allfiles {
            if (i.value.name == name) && (i.value.path == path) {
                filetowright = i.value
                break
            }
        }
        //Вопрос - первый guard проверяет что файл у меня нашелся. Но в последующих - мне необходимо все равно unwrap эту переменную. Так и должно быть?
        guard filetowright != nil  else {
            throw FileError.notfound
        }
        let unwrapped = filetowright!
        guard unwrapped.owner == self.user else {
            throw FileError.isntowner
        }
        guard unwrapped.maxcontent >= content else {
            throw FileError.tobig
        }
        print("Записали контент в \(unwrapped.path)\(unwrapped.name)")
        return unwrapped
    }
}

let manager1 = FileManager(user: "user1")
let readedfile1 = manager1.read(path: "/home/user1/", name: "file1")

if let readed1 = readedfile1.0  {
    print("Прочитан файл \(readed1.path)\(readed1.name)")
} else {
    print(readedfile1.1!.rawValue)
}


print("* * *      * * *")



let manager2 = FileManager(user: "user2")
let readedfile2 = manager2.read(path: "/home/user1/", name: "file2")
if let readed2 = readedfile2.0  {
    print("Прочитан файл \(readed2.path)\(readed2.name)")
} else {
    print(readedfile2.1!.rawValue)
}

print("* * *      * * *")

//перехватывает первую ошибку. Как отловить все в данном конкретном случае? Для каждой строки - свой do-catch?
let manager3 = FileManager(user: "user2")
do {
    let wrighted1 = try manager3.wright(path: "/home/user1/", name: "file1", content: 10)
    let wrighted2 = try manager3.wright(path: "/home/user2/", name: "file2", content: 22)
    let wrighted3 = try manager3.wright(path: "/home/user1/", name: "file3", content: 25)
} catch let error {
    print(error)
}
