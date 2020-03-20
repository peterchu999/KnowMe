import UIKit

class MakeQuizCodeViewController: UIViewController {
    var quizData:Quiz!
    var key:String!

    @IBOutlet weak var textFieldCode: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
   
    @IBAction func edittingChange(_ sender: Any) {
        getDataFromField()
    }
    
    @IBAction func returnTrigger(_ sender: Any) {
        view.endEditing(true)
    }
    private func getDataFromField(){
        if(textFieldCode.text!.count == 6){
            key = textFieldCode.text
            quizData.key = textFieldCode.text!
            DataStore.getInstance().setQuiz(quizData)
            performSegue(withIdentifier: "makeFinish", sender: self)
            
        } else if (textFieldCode.text!.count > 6){
            textFieldCode.text = key
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "makeFinish" {
                if let destination = segue.destination as? MakeQuizFinaleViewController{
                    let data = sender as? MakeQuizCodeViewController
                    destination.data = data?.key
                    
                }
            }
        }
    }
}
