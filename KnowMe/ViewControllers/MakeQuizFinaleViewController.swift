import UIKit

class MakeQuizFinaleViewController: UIViewController {
    var data:String!
    @IBOutlet weak var labelCode: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelCode.text = data
    }
}
