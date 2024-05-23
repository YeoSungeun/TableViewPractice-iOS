//
//  SettingTableViewController.swift
//  TableViewPractice
//
//  Created by 여성은 on 5/23/24.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    var allSettingList = ["공지사항", "실험실", "버전 정보"]
    var personalSettingList = ["개인/보안", "알림", "채팅", "멀티프로필"]
    var etcList = ["고객센터/도움말"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "설정"
  
    }

    // 섹션의 개수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // 섹션 타이틀 지정
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "전체 설정"
        } else if section == 1 {
            return "개인 설정"
        } else if section == 2 {
            return "기타"
        }
        
        return ""
    }
    
    // 섹션 별 셀 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return allSettingList.count
        } else if section == 1 {
            return personalSettingList.count
        } else if section == 2 {
            return etcList.count
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        // 데이터 담아주기
        if indexPath.section == 0 {
            cell.textLabel?.text = allSettingList[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel?.text = personalSettingList[indexPath.row]
        } else if indexPath.section == 2 {
            cell.textLabel?.text = etcList[indexPath.row]
        }
        
        // 디자인 설정
        cell.textLabel?.font = .systemFont(ofSize: 14)
        
        return cell
    }
    

}
