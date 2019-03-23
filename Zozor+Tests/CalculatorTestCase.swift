@testable import CountOnMe
import XCTest

class CalculatorTestCase: XCTestCase {

    var calculator: Calculator!

    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }

    func testGivenEmptyExpression_WhenAddNumber_ThenTheNumberIsAdded() {
        calculator.addNewNumber(1)

        XCTAssertEqual(calculator.getText(), "1")
    }

    func testGivenEmptyExpression_WhenCallCanAddOperator_ThenShouldReturnFalse() {
        XCTAssertFalse(calculator.canAddOperator)
        XCTAssertEqual(calculator.getText(), "")
    }

    func testGivenNumberExpression_WhenCallCanAddOperator_ThenShouldReturnTrue() {
        calculator.addNewNumber(1)

        XCTAssertTrue(calculator.canAddOperator)
    }

    func testGivenGoodExpression_WhenCheckExpression_ThenShouldReturnTrue() {
        calculator.addNewNumber(1)
        calculator.addOperator("+")
        calculator.addNewNumber(1)

        XCTAssertTrue(calculator.isExpressionCorrect)
        XCTAssertEqual(calculator.getText(), "1+1")
    }

    func testGivenBadExpression_WhenCheckExpression_ThenShouldReturnFalse() {
        calculator.addNewNumber(1)
        calculator.addOperator("+")

        XCTAssertFalse(calculator.isExpressionCorrect)
        XCTAssertEqual(calculator.getText(), "1+")
    }

    func testGivenEmptyExpression_WhenCheckExpression_ThenShouldReturnFalse() {
        XCTAssertFalse(calculator.isExpressionCorrect)
        XCTAssertEqual(calculator.getText(), "")
    }

    func testGivenGoodPlusExpression_WhenGetTotal_ThenShouldReturnTotal() {
        calculator.addNewNumber(1)
        calculator.addOperator("+")
        calculator.addNewNumber(1)

        XCTAssertEqual(calculator.calculateTotal(), 2)
    }

    func testGivenGoodMinusExpression_WhenGetTotal_ThenShouldReturnTotal() {
        calculator.addNewNumber(1)
        calculator.addOperator("-")
        calculator.addNewNumber(1)

        XCTAssertEqual(calculator.calculateTotal(), 0)
    }

    func testGivenGoodDivideExpression_WhenGetTotal_ThenShouldReturnTotal() {
        calculator.addNewNumber(10)
        calculator.addOperator("/")
        calculator.addNewNumber(5)

        XCTAssertEqual(calculator.calculateTotal(), 2)
    }

    func testGivenDivideBy0Expression_WhenGetTotal_ThenShouldDoResetExpression() {
        calculator.addNewNumber(10)
        calculator.addOperator("/")
        calculator.addNewNumber(0)

        XCTAssertFalse(calculator.isExpressionCorrect)
    }

    func testGivenGoodMultiplyExpression_WhenGetTotal_ThenShouldReturnTotal() {
        calculator.addNewNumber(10)
        calculator.addOperator("X")
        calculator.addNewNumber(10)

        XCTAssertEqual(calculator.calculateTotal(), 100)
    }

    func testGivenExpressionWithoutOperator_WhenGetTotal_ThenShouldReturnSameNumber() {
        calculator.addNewNumber(1)
        calculator.addNewNumber(1)

        XCTAssertEqual(calculator.calculateTotal(), 11)
    }
}
