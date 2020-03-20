import UIKit

class ResultPageViewController: UIViewController {
    @IBOutlet weak var labelResult: UILabel!
    
    var correctCounter:Int!
    var totalQuestion:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Usah Masuk")
        labelResult.text = "yey, You Got \(correctCounter ?? 0)/\(totalQuestion ?? 0) Correct Answer"
        // Do any additional setup after loading the view.
    }
}
