import Foundation

class Calculator {

    // MARK: - Attribute

    var operators: [String] = ["+"]

    var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                clear()
                return false
            }
        }

        for (index, number) in stringNumbers.enumerated() {
            if number == "0" && operators[index] == "/" {
                clear()
                return false
            }
        }

        return true
    }

    private var index = 0
    private var stringNumbers: [String] = [String()]

    var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                return false
            }
        }
        return true
    }

    // MARK: - Method

    func addOperator(_ newOperator: String) {
        operators.append(newOperator)
        stringNumbers.append("")
    }

    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
    }

    func calculateTotal() -> Int {
        var total = 0

        for (key, stringNumber) in stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
                if operators[key] ==  "+" {
                    total += number
                } else if operators[key] ==  "-" {
                    total -= number
                } else if operators[key] ==  "/" {
                    total /= number
                } else if operators[key] ==  "X" {
                    total *= number
                }
            }
        }

        clear()

        return total
    }

    func getText() -> String {
        var text = ""

        for (key, stringNumber) in stringNumbers.enumerated() {
            // Add operator
            if key > 0 {
                text += operators[key]
            }
            // Add number
            text += stringNumber
        }

        return text
    }

    private func clear() {
        stringNumbers = [String()]
        operators = ["+"]
        index = 0
    }
}
