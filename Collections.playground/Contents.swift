// Мы можем указывать тип массива как и любой другой - Array<Что мы храним> или же использовать короткую запись - [Что мы храним]
let arrayA: Array<String> = Array<String>()
let arrayB: [String] = [String]()

// Результат отличаться не будет:
print(arrayA == arrayB)

// Также можно просто открыть квадратную скобку и записать через запятую все элементы, которые вы хотите хранить в массиве. Не забудьте закрывающую скобку в конце ;)
var cities = ["Los Angeles", "Miami", "New York"]

// Мы можем получить элемент массива по его номеру. Нумерация начинается с 0.
print(cities[1])

// Также мы можем изменять массив: добавлять элементы в конец, вставлять в середину, заменять, удалять.
cities.append("Chicago")
cities.insert("Seattle", at: 1)
cities.remove(at: 2)
cities[0] = "San Francisco"

// Давайте посмотрим, как изменился наш массив:
print(cities)

// Используя цикл `for` мы можем пройти все элементы массива. При этом будет соблюден их порядок:
for city in cities {
    print(city)
}

// Для словаря также как и для массива существует две формы записи типа. Но здесь нужно указать не только тип хранимого элемента, но тип данных ключа.
let dictionaryA: Dictionary<String, Int> = Dictionary<String, Int>()
let dictionaryB: [String: Int] = [String: Int]()

// Мы также, как и для массива можем сразу составить словарь. Для этого нужно записать все пары "ключ-значение" через запятую. При этом ключ отделяется от значения двоеточием.
var headcountByCity = [
    "Las Angeles": 4000000,
    "Miami": 1500000,
    "New York": 12000000
]

// Получить значение можно также, как и в массиве, но вместо порядкового номера мы будем использовать ключ. Обратите внимание, что нам возвращается Optional значение. Это происходит из-за того, что значения для данного ключа в словаре может и не быть.
print(headcountByCity["Miami"])

// Мы можем менять словарь, задавая значение для ключей. Если в словаре уже было значение для этого ключа, оно перезапишется (затрется).
headcountByCity["Dallas"] = 1100000
headcountByCity["Miami"] = 2000000

print(headcountByCity["Miami"])

// Если нам нужно стереть значение для ключа, то нужно записать "ничего", т.е. nil
headcountByCity["Miami"] = nil

// Мы можем перебрать все пары "ключ-значение" и для словаря. Но здесь не будет сохраняться порядок - словарь вообще не запоминает порядок, в котором в него складывали элементы.
for (city, headcount) in headcountByCity {
    print("\(headcount) people live in \(city)")
}

// Иногда бывает непонятно, какую коллекцию выбрать - словарь или массив. Как правило, все зависит от того, как вы будете использовать эти данные.

// Допустим, у нас есть список студентов. Каждый студент описывается структурой Student:
struct Student {
    let name: String
    let age: Int
    let rating: Double
}

let kolya = Student(name: "Коля", age: 22, rating: 4.5)
let masha = Student(name: "Маша", age: 21, rating: 3)
let petya = Student(name: "Петя", age: 35, rating: 4.7)
let anya = Student(name: "Аня", age: 22, rating: 3.9)
let sasha = Student(name: "Саша", age: 19, rating: 4.1)

// Логично сделать список студентов массивом:
let students = [kolya, masha, petya, anya, sasha]

// Тогда мы сможем его легко перебирать и порядок будет одинаковым:
for student in students {
    print(student)
}

// Если мы будем делать таблицу, то мы сможем быстро получать нужного студента для каждой строчки:
func studentName(for row: Int) -> String {
    return students[row].name
}

print(studentName(for: 0))
print(studentName(for: 1))

// Но вот другая ситуация. У нас есть поле ввода, куда мы вводим имя студента и нам нужно показать его имя. Чтобы получить это из массива, нам придется перебрать всех студентов, чтобы найти нужного:

func ratingForStudent(with name: String) -> Double? {
    for student in students {
        if student.name == name {
            return student.rating
        }
    }

    // Студента с таким именем нет
    return nil
}

// Каждый раз проверять всех студентов - слишком долго как при написании кода, так и при работе приложения. Для такой задачи лучше использовать словарь:

let studentsByName = [
    kolya.name: kolya,
    masha.name: masha,
    anya.name: anya,
    petya.name: petya,
    sasha.name: sasha
]

// Тогда поиск нужного студента по имени будет легким как для программиста, так и для процессора:

func ratingForStudent2(with name: String) -> Double? {
    return studentsByName[name]?.rating
}
