//
//  SettingTableViewController.swift
//  TableViewPractice
//
//  Created by 여성은 on 5/23/24.
//

import UIKit

enum SettingOptions: Int, CaseIterable {
    case total, personal, others
    
    var mainOptions: String {
        switch self {
        case .total:
            return "전체 설정"
        case .personal:
            return "개인 설정"
        case .others:
            return "기타"
            
        }
    }
    
    var subOptions: [String] {
        switch self {
        case .total:
            return ["공지사항", "실험실", "버전 정보"]
        case .personal:
            return ["개인/보안", "알림", "채팅", "멀티프로필"]
        case .others:
            return ["고객센터/도움말"]
        }
    }
}

class SettingTableViewController: UITableViewController {
    
    let settings = SettingOptions.allCases

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "설정"
  
    }

    // 섹션의 개수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }
    
    // 섹션 타이틀 지정
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return settings[section].mainOptions
    }
    
    // 섹션 별 셀 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].subOptions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        // 데이터 담아주기
        cell.textLabel?.text = settings[indexPath.section].subOptions[indexPath.row]
        
        // 디자인 설정
        cell.textLabel?.font = .systemFont(ofSize: 14)
        
        return cell
    }
    

}
