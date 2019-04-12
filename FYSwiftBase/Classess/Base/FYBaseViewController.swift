//
//  FYBaseViewController.swift
//  qhm
//
//  Created by wang on 2019/4/12.
//  Copyright © 2019 wang. All rights reserved.
//

import UIKit

class FYBaseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupNav()
        setupLayout()
    }
    
    /// 标题
    open var navTitle = "" {
        didSet{
            customNavBar.titleLable.text = navTitle
        }
    }
    ///标题颜色
    open var navTitleColor = UIColor.black {
        didSet{
            customNavBar.titleLable.textColor = navTitleColor
        }
    }
    ///nav的背景色
    open var navBgColor = UIColor.white {
        didSet{
            customNavBar.backgroundColor = navBgColor
        }
    }
    /// 设置右边按钮的宽度，默认宽度64
    open var rightBtnWidthConstraint = NSLayoutConstraint()
    
    func setupNav() {
        // 添加导航栏
        view.addSubview(self.customNavBar)
        // 右边按钮
        self.customNavBar.addSubview(self.rightBtn)
        self.customNavBar.addSubview(self.rightBtnTwo)
        self.customNavBar.addSubview(self.backBtn)
        
        // 多层push才显示返回按钮
        if self.navigationController != nil {
            if ((self.navigationController?.children.count)!>1){
                self.backBtn.isHidden = false
            } else {
                self.backBtn.isHidden = true
            }
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.view.bringSubviewToFront(self.customNavBar)
        }
    }
    
    func setupLayout() {
        let titleY: CGFloat = isPhoneX() ? 40:20
        self.customNavBar.translatesAutoresizingMaskIntoConstraints = false
        self.rightBtnTwo.translatesAutoresizingMaskIntoConstraints = false
        self.rightBtn.translatesAutoresizingMaskIntoConstraints = false
        self.backBtn.translatesAutoresizingMaskIntoConstraints = false
        
        // 导航栏
        self.customNavBar.addConstraint(NSLayoutConstraint.init(item: self.customNavBar, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 0, constant: NavBarHeight))
        self.view.addConstraints([
            NSLayoutConstraint.init(item: self.customNavBar, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self.customNavBar, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self.customNavBar, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)
            ])
        // 右边的按钮
        self.rightBtnWidthConstraint = NSLayoutConstraint.init(item: self.rightBtn, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 0, constant: 64)
        self.rightBtn.addConstraint(NSLayoutConstraint.init(item: self.rightBtn, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 0, constant: 44))
        self.rightBtn.addConstraint(self.rightBtnWidthConstraint)
        self.customNavBar.addConstraints([
            NSLayoutConstraint.init(item: self.rightBtn, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.customNavBar, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: titleY),
            NSLayoutConstraint.init(item: self.rightBtn, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.customNavBar, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 0)
            ])
        
        // 返回按钮
        self.backBtn.addConstraint(NSLayoutConstraint.init(item: self.backBtn, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 0, constant: 44))
        self.backBtn.addConstraint(NSLayoutConstraint.init(item: self.backBtn, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 0, constant: 44))
        self.customNavBar.addConstraints([
            NSLayoutConstraint.init(item: self.backBtn, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.customNavBar, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: titleY),
            NSLayoutConstraint.init(item: self.backBtn, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.customNavBar, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
            ])
        
        
        // rightBtnTwo
        self.rightBtnTwo.addConstraint(NSLayoutConstraint.init(item: self.rightBtnTwo, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 0, constant: 44))
        self.rightBtnTwo.addConstraint(NSLayoutConstraint.init(item: self.rightBtnTwo, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 0, constant: 64))
        self.customNavBar.addConstraints([
            NSLayoutConstraint.init(item: self.rightBtnTwo, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.rightBtn, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: self.rightBtnTwo, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.rightBtn, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
            ])
    }
    
    @objc open func rightBtnTwoClick() {
        
    }
    
    @objc open func rightBtnClick(){
        
    }
    @objc open func backBtnclick(){
        let VCArr = self.navigationController?.viewControllers
        if VCArr == nil {
            self.dismiss(animated: true, completion: nil)
            return
        }
        if VCArr!.count > 1 {
            self.navigationController!.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    //状态栏颜色默认为黑色
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    //MARK:tableview的代理方法 和数据源
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell  = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        }
        return cell!
    }
    

    lazy var mainTableView:UITableView = {
        let mainTableView = UITableView.init(frame: CGRect.zero, style: UITableView.Style.plain)
        mainTableView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeigth)
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.showsVerticalScrollIndicator = false
        mainTableView.showsHorizontalScrollIndicator = false
        if #available(iOS 11.0, *) {
            mainTableView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        return mainTableView
    }()

    /// 自定义导航栏
    open lazy var customNavBar: FYNavView = {
        let nav = FYNavView()
        nav.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: NavBarHeight)
        nav.backgroundColor = UIColor.white
        return nav
    }()
    /// 右边第一个按钮
    open lazy var rightBtn: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect.zero
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(FYBaseViewController.rightBtnClick), for: UIControl.Event.touchUpInside)
        return btn
    }()
    /// 右边第二个按钮
    open lazy var rightBtnTwo: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect.zero
        btn.adjustsImageWhenHighlighted = false
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        btn.addTarget(self, action: #selector(FYBaseViewController.rightBtnTwoClick), for: UIControl.Event.touchUpInside)
        return btn
    }()
    // 返回按钮
    open lazy var backBtn: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect.zero
        btn.addTarget(self, action: #selector(FYBaseViewController.backBtnclick), for: .touchUpInside)
        btn.setImage(UIImage.init(named: "btn_back"), for: .normal)
        return btn
    }()
}

