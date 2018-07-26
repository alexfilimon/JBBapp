//
//  JBBApp
//
//  Created by Александр Филимонов on 15/07/2018.
//  Copyright © 2018 Alex Filimonov. All rights reserved.
//

import UIKit

class CustomSlider: UISlider {
    
    var sliderIdentifier: Int!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        sliderIdentifier = 0
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        sliderIdentifier = 0
    }
    
}
