import UIKit

class ViewController: UIViewController {

    // MARK: Attribute

    let calculator = Calculator()

    // MARK: - Outlet

    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    // MARK: - Action

    @IBAction func didTapNumberButton(_ sender: UIButton) {
        calculator.addNewNumber(sender.tag)

        updateDisplay()
    }

    @IBAction func didTapOperatorButton(_ sender: UIButton) {
        guard calculator.canAddOperator else {
            return presentAlert(title: "Zéro!", message: "Expression incorrecte !")
        }

        calculator.addOperator(sender.titleLabel!.text!)

        updateDisplay()
    }

    @IBAction func didTapEqualButton() {
        guard calculator.isExpressionCorrect else {
            return presentAlert(title: "Zéro!", message: "Entre une expression correcte ou démarre un nouveau calcul !")
        }

        textView.text += "=\(calculator.calculateTotal())"
    }

    // MARK: - Method

    private func updateDisplay() {
        textView.text = calculator.getText()
    }

    private func presentAlert(title: String, message: String) {
        let alertVC = UIAlertController(
            title: title, message: message, preferredStyle: .alert
        )
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))

        self.present(alertVC, animated: true, completion: nil)
    }
}
