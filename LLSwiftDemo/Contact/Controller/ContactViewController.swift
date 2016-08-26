//
//  ContactViewController.swift
//  LLSwiftDemo
//
//  Created by Keith on 16/7/16.
//  Copyright © 2016年 Keith. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var tableView : UITableView!
    
    var chats : NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "通讯录"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(self.onAdd))
        
        self.chats = [
            ["name":"Macgray","content":"好的","image":"ting","time":"19:59"],
            ["name":"zhu","content":"[图片]","image":"zhu","time":"17:59"],
            ["name":"李易峰","content":"http:www.baidu.com","image":"peng","time":"17:45"],
            ["name":"格蕾丝凯莉●文婷 美包行","content":"筛选条件其实可以到周、月的，我们再加上可以到当日，可以吗","image":"wen","time":"09:12"],
            ["name":"Keith","content":"赞成习大大的意见","image":"liang","time":"08:11"],
            ["name":"文件传输助手","content":"www.weixin.fewrf.com","image":"file","time":"昨天"],
            ["name":"微信运动","content":"[应用消息]","image":"sport","time":"星期一"],
            ["name":"湖惊涛","content":"[视频]","image":"2","time":"16/7/29"],
            ["name":"席精品","content":"哎","image":"yi","time":"16/7/29"]
        ]
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let searchBar:UISearchBar! = UISearchBar(frame: CGRectMake(0,0,view.frame.size.width,44))
        searchBar.placeholder = "搜索"
        searchBar.searchBarStyle = UISearchBarStyle.Minimal
        tableView.tableHeaderView = searchBar;
        
        tableView.registerNib(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onAdd(){
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.chats.count;
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat.min
        }
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "homeCell"
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(identifier)
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: identifier)
            cell.clipsToBounds = true
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
        let dict:NSDictionary! = chats[indexPath.row] as! NSDictionary
        cell.textLabel?.text = dict["name"] as? String
        cell.imageView?.image = UIImage(named: dict["image"] as! String);
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

}
