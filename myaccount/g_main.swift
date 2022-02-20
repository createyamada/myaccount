//
//  main.swift
//  myaccount


import UIKit
import RealmSwift

class g_main: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var TableView: UITableView!
    
    //テーブルビューセクション項目    //テーブルビューセクション項目
    let sectionContens = ["代表取締役情報","キャッシュフロー入力","会社要項ページ"]
    //代表取締役セル
    let contents1 = ["代表取締役"]
    //キャッシュフロー入力セル
    let contents2 = ["収入","支出"]
    //テーブルビューセル項目（会社要項ページ）
    let contents3 = ["マイ決算書","貯金偏差値","固定費変更","設定"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //データソースを指定するため
        TableView.dataSource = self
        TableView.delegate = self
        TableView.rowHeight = 60
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //セクションを数を返すメソッド
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionContens.count
    }
    
    //セクションの名前を返すメソッド
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionContens[section]
    }
    
    //セクション内に表示するセルの個数を返すメソッド
    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return contents1.count
        case 1:
            return contents2.count
        case 2:
            return contents3.count
        default:
            return 0
        }
    }
    
    //セクション内に表示するセルのテキストを返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt IndexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "cell", for: IndexPath)
        switch IndexPath.section {
        case 0:
            cell.textLabel?.text = contents1[IndexPath.row]
        case 1:
            cell.textLabel?.text = contents2[IndexPath.row]
        case 2
        :
            cell.textLabel?.text = contents3[IndexPath.row]
        default:
            break
        }
        return cell
    }
    
    
    //タップされたセルに応じて画面遷移を行う
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // セルの選択を解除
            tableView.deselectRow(at: indexPath, animated: true)
            //セクションが代表取締役の時
        if indexPath.section == 0 {
                switch indexPath.row {
                case 0 :
                    //代表取締役セルタップ時
                    //メイン画面に遷移
                    //次画面のストーリーボードを指定
                    let storyboard: UIStoryboard = self.storyboard!
                    //遷移先のコントローラーを指定
                    let nextView = storyboard.instantiateViewController(withIdentifier: "ceo") as! ceo
                    //遷移を行う
                    self.present(nextView, animated: true, completion: nil)
                default:
                    break
                }
            }
            //セクションがキャッシュフロー入力の時
        if indexPath.section == 1 {
                
                switch indexPath.row {
                case 0:
                    //収入セルタップ時
                    //メイン画面に遷移
                    //次画面のストーリーボードを指定
                    let storyboard: UIStoryboard = self.storyboard!
                    //遷移先のコントローラーを指定
                    let nextView = storyboard.instantiateViewController(withIdentifier: "income") as! income
                    //遷移を行う
                    self.present(nextView, animated: true, completion: nil)
                case 1:
                    //支出セルタップ時
                    //メイン画面に遷移
                    //次画面のストーリーボードを指定
                    let storyboard: UIStoryboard = self.storyboard!
                    //遷移先のコントローラーを指定
                    let nextView = storyboard.instantiateViewController(withIdentifier: "out") as! out
                    //遷移を行う
                    self.present(nextView, animated: true, completion: nil)
                default:
                    break
                }
            }
            //セクションが会社要項の時
        if indexPath.section == 2 {
                switch indexPath.row {
                
                case 0:
                    //マイ決算書セルタップ時
                    //次画面のストーリーボードを指定
                    let storyboard: UIStoryboard = self.storyboard!
                    //遷移先のコントローラーを指定
                    let nextView = storyboard.instantiateViewController(withIdentifier: "calendar") as! calendar
                    //ナビゲーションコントローラ読み込み
                    let navi = UINavigationController(rootViewController: nextView)
                    //遷移を行う
                    self.present(navi, animated: true, completion: nil)
                case 1:
                    //貯金偏差値セルタップ時
                    //次画面のストーリーボードを指定
                    let storyboard: UIStoryboard = self.storyboard!
                    //遷移先のコントローラーを指定
                    let nextView = storyboard.instantiateViewController(withIdentifier: "SavingsDeviationValue") as! SavingsDeviationValue
                    //遷移を行う
                    self.present(nextView, animated: true, completion: nil)
                case 2:
                    //固定費変更セルタップ
                    //次画面のストーリーボードを指定
                    let storyboard: UIStoryboard = self.storyboard!
                    //遷移先のコントローラーを指定
                    let nextView = storyboard.instantiateViewController(withIdentifier: "fixedFee") as! fixedFee
                    //遷移を行う
                    self.present(nextView, animated: true, completion: nil)
                case 3:
                    //設定セルタップ
                    //次画面のストーリーボードを指定
                    let storyboard: UIStoryboard = self.storyboard!
                    //遷移先のコントローラーを指定
                    _ = storyboard.instantiateViewController(withIdentifier: "fixedFee") as! fixedFee
                default:
                    break
                }
                
            }
        print("セクション\(indexPath.section)番目セル\(indexPath.row)番目の行が選択されました。") }
      }


