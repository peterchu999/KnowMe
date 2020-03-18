import Foundation
import UIKit

@IBDesignable
open class InGameButton: UIButton {

    public override init(frame: CGRect) {
        super.init(frame:frame)
        initRoundAndShadow()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initRoundAndShadow()
    }
    
    private func initRoundAndShadow(){
        let layer = self.layer
        layer.cornerRadius = 15
        let shadowLayer = self.layer
        shadowLayer.shadowPath =
              UIBezierPath(roundedRect: self.bounds,
              cornerRadius: layer.cornerRadius).cgPath
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOpacity = 0.5
        shadowLayer.shadowOffset = CGSize(width: 0, height: 10)
        shadowLayer.shadowRadius = 10
    }
    
}
