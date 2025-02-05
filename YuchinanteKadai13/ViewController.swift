//
//  ViewController.swift
//  
//  
//  Created by Yuchinante on 2024/04/09
//  
//

import UIKit

class ViewController: UITableViewController {

    // UserDefaultsに保存するキー名
    let KeyName = "Name"
    let KeyCheck = "Check"

    // テーブルビューに表示するアイテムの配列
    var items: [Dictionary<String,Any>] = []

    // 画面がロードされた時の処理
    override func viewDidLoad() {
        super.viewDidLoad()

        // アイテムの初期化
        self.items = [
            [KeyName:"りんご", KeyCheck:false],
            [KeyName:"みかん", KeyCheck:true],
            [KeyName:"バナナ", KeyCheck:false],
            [KeyName:"パイナップル", KeyCheck:true],
        ]
    }

    // セクションの数を返すメソッド
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // セルの数を返すメソッド
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    // セルを構築するメソッド
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得し、カスタムセルにダウンキャスト
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! TableViewCell

        // アイテムを取得
        let item = items[indexPath.row]

        // アイテムのチェック状態に応じてセルの表示を変更
        if item[KeyCheck] as? Bool == true {
            cell.checkImageView.image = UIImage(named: "check")
        } else {
            cell.checkImageView.image = nil
        }

        // アイテムの名前をセルのラベルに表示
        cell.nameLabel.text = (item[KeyName] as? String) ?? ""

        return cell
    }
}
