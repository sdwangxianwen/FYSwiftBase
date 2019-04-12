//
//  FYSubOrderViewController.swift
//  qhm
//
//  Created by wang on 2019/4/12.
//  Copyright © 2019 wang. All rights reserved.
//

import UIKit
import JXSegmentedView

@objc protocol FYSubOrderViewControllerDelegate {
  @objc optional func suborderAction()
}

class FYSubOrderViewController: UIViewController {
    weak var delegate: FYSubOrderViewControllerDelegate?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColorRandom()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        
        
//        self.nav?.popViewController(animated: true)
//        if self.delegate != nil {
//            self.delegate?.suborderAction?()
//        }
    }
    
}

extension FYSubOrderViewController : JXSegmentedListContainerViewListDelegate {
    func listView() -> UIView {
        return view
    }
}
