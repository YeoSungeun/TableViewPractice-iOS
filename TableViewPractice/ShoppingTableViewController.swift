//
//  ShoppingTableViewController.swift
//  TableViewPractice
//
//  Created by 여성은 on 5/24/24.
//

import UIKit

struct ShoppingItem {
    var item: String
    var check: Bool
    var favorite: Bool
}

class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet var addTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var shoppingList = [
        ShoppingItem(item: "안경 새로 맞추기", check: false, favorite: true),
        ShoppingItem(item: "트레이닝바지", check: false, favorite: false),
        ShoppingItem(item: "슬리퍼", check: false, favorite: false),
        ShoppingItem(item: "틴트 색상 정하고 구매", check: true, favorite: true),
        ShoppingItem(item: "다회용 빨대", check: false, favorite: false),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setAddTextField()
        setAddButton()
        
        // 2.셀 높이
        tableView.rowHeight = 44

    }
    
    @IBAction func returnKeyTapped(_ sender: UITextField) {
        guard let item = addTextField.text, item.count > 0 else {
            print("검색어 입력 안됨")
            return
        }
        
        shoppingList.append(ShoppingItem(item: item, check: false, favorite: false))
        print(shoppingList)
        
        addTextField.text = ""
        view.endEditing(true)
        
        tableView.reloadData()
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        guard let item = addTextField.text, item.count > 0 else {
            print("검색어 입력 안됨")
            return
        }
        
        shoppingList.append(ShoppingItem(item: item, check: false, favorite: false))
        print(shoppingList)
        
        addTextField.text = ""
        view.endEditing(true)
        
        tableView.reloadData()
        
    }
    
    @IBAction func checkButtonClicked(_ sender: UIButton) {
        shoppingList[sender.tag].check.toggle()
        
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    
    @IBAction func favoriteButtonClicked(_ sender: UIButton) {
        shoppingList[sender.tag].favorite.toggle()
        
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    
    
    func setAddTextField() {
        addTextField.placeholder = "무엇을 구매하실 건가요?"
        addTextField.borderStyle = .none
        addTextField.backgroundColor = .lightGray.withAlphaComponent(0.1)
        addTextField.layer.cornerRadius = 10
        
        // 왼쪽 공백
        addTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: addTextField.frame.height))
        addTextField.leftViewMode = .always
    }
    func setAddButton() {
        addButton.setTitle("추가", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.backgroundColor = .lightGray.withAlphaComponent(0.2)
        addButton.layer.cornerRadius = 5
        
    }
     
    // 1. 셀개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    // 3. 셀 디자인/ 데이터 넣기
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        
        cell.shoppingItemLabel.text = shoppingList[indexPath.row].item
        
        let checkImageName = shoppingList[indexPath.row].check ? "checkmark.square.fill" : "checkmark.square"
        let checkImage = UIImage(systemName: checkImageName)
        cell.checkButton.setImage(checkImage, for: .normal)
        cell.checkButton.tintColor = .black
        cell.checkButton.setTitle("", for: .normal)
        // sender.tag = indexPath.row 설정해주기~!
        cell.checkButton.tag = indexPath.row
        
        
        let favoriteImageName = shoppingList[indexPath.row].favorite ? "star.fill" : "star"
        let favoriteImage = UIImage(systemName: favoriteImageName)
        cell.favoriteButton.setImage(favoriteImage, for: .normal)
        cell.favoriteButton.setTitle("", for: .normal)
        cell.favoriteButton.tintColor = .black
        cell.favoriteButton.tag = indexPath.row
        
        
        return cell
    }
    
}

