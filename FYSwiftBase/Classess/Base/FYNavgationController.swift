//
//  FYNavgationController.swift
//  qhm
//
//  Created by wang on 2019/4/12.
//  Copyright © 2019 wang. All rights reserved.
//

import UIKit

class FYNavgationController: UINavigationController {
    
    var isEnableEdegePan : Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer?.delegate = self
        self.delegate = self
        
        // 导航栏样式
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = UIColor.orange
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]

    }
    
    /// 启用、禁用屏幕边缘侧滑手势
    func enableScreenEdgePanGestureRecognizer(_ isEnable: Bool) {
        isEnableEdegePan = isEnable
    }
    /// 获取屏幕边缘侧滑手势
    func getScreenEdgePanGestureRecognizer() -> UIScreenEdgePanGestureRecognizer? {
        var edgePan: UIScreenEdgePanGestureRecognizer?
        if let recognizers = view.gestureRecognizers, recognizers.count > 0 {
            for recognizer in recognizers {
                if recognizer is UIScreenEdgePanGestureRecognizer {
                    edgePan = recognizer as? UIScreenEdgePanGestureRecognizer
                    break
                }
            }
        }
        return edgePan
    }
    // 导航栏返回按钮点击
    @objc fileprivate func backBtnClicked() {
        popViewController(animated: true)
    }
}

// MARK: - delegate
extension FYNavgationController: UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if !isEnableEdegePan { // 禁用边缘侧滑手势
            return false
        }
        return children.count > 1
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.viewControllers.count == 0 {
            return super.pushViewController(viewController, animated: true)
        } else {
            viewController.hidesBottomBarWhenPushed = true
            let backBtn = BackButton(target: self, action: #selector(backBtnClicked))
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: backBtn)
            
        }
        super.pushViewController(viewController, animated: animated)
    }
}


/// 导航栏左侧返回按钮
class BackButton: UIButton {
    
    init(target: Any, action: Selector) {
        super.init(frame: CGRect(x: 0, y: 0, width: 21, height: 21))
        commonInit(target: target, action: action)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(target: Any, action: Selector) {
        
        self.adjustsImageWhenHighlighted = false
        self.setBackgroundImage(UIImage(named: "fanhui_new"), for: UIControl.State.normal)
        self.setBackgroundImage(UIImage(named: "fanhui_yin_new"), for: UIControl.State.highlighted)
        self.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -(self.fy_width > 20 ? self.fy_width - 20 : self.fy_width), bottom: 0, right:0)
        self.addTarget(target, action: action, for: .touchUpInside)
    }
}
