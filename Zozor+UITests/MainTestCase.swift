import XCTest

class MainTestCase: XCTestCase {

    var app: XCUIApplication = XCUIApplication()

    override func setUp() {
        super.setUp()
        app.launchArguments = ["enable-testing"]

        app.launch()
    }

    func testSimplePlusOperation() {
        tapOnButtons(operation: "2+8=")

        XCTAssertEqual(app.textViews["screenView"].value as? String, "2+8=10")
    }

    func testSimpleMinusOperation() {
        tapOnButtons(operation: "3-7=")

        XCTAssertEqual(app.textViews["screenView"].value as? String, "3-7=-4")
    }

    func testComplexeOperation() {
        tapOnButtons(operation: "34/2X10+95=")

        XCTAssertEqual(app.textViews["screenView"].value as? String, "34/2X10+95=265")
    }

    func testEqualOnBadOperation_ShouldPopupAlert() {
        tapOnButtons(operation: "2+9+=")

        XCTAssertTrue(
            app.alerts.element.staticTexts["Entre une expression correcte ou démarre un nouveau calcul !"].exists
        )
    }

    func testInsertOperatorInFirst_ShouldPopupAlert() {
        tapOnButtons(operation: "+")

        XCTAssertTrue(app.alerts.element.staticTexts["Expression incorrecte !"].exists)
    }

    func testEqualInFirst_ShouldPopupAlert() {
        tapOnButtons(operation: "=")

        XCTAssertTrue(
            app.alerts.element.staticTexts["Entre une expression correcte ou démarre un nouveau calcul !"].exists
        )
    }

    func testDivideByZero_ShouldPopupAlert() {
        tapOnButtons(operation: "10/0=")

        XCTAssertTrue(
            app.alerts.element.staticTexts["Entre une expression correcte ou démarre un nouveau calcul !"].exists
        )
    }

    private func tapOnButtons(operation: String) {
        operation.forEach({ app.buttons["\($0)"].tap() })
    }
}
