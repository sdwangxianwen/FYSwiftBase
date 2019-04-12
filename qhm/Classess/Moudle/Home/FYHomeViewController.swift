//
//  FYHomeViewController.swift
//  qhm
//
//  Created by wang on 2019/4/12.
//  Copyright © 2019 wang. All rights reserved.
//

import UIKit

class FYHomeViewController: FYBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.frame = CGRect(x: 0, y: NavBarHeight, width: kScreenWidth, height: kScreenHeigth - TabBarHeight)
        view.addSubview(mainTableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let meVC =  FYMeViewController.init()
        navigationController?.pushViewController(meVC, animated: true)
    }
}
