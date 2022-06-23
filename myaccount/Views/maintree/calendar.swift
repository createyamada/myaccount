//
//  calendar.swift
//  myaccount


import UIKit
import RealmSwift
import FSCalendar
import CalculateCalendarLogic

class calendar: UIViewController, FSCalendarDataSource, FSCalendarDelegate,FSCalendarDelegateAppearance {
    
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var calendar: FSCalendar!
    
    @IBOutlet weak var labelDate: UILabel!
    var datesWithEvents: Set<String> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //デリゲートの設定
        self.calendar.dataSource = self
        self.calendar.delegate = self
        TableView.delegate = self
        TableView.dataSource = self
        
        labelDate.text = getToday(format:"yyyy年MM月dd日")
        //ナビゲーションを表示させる
        navigationController?.popViewController(animated: true)
        
        
        
    }
    
    //**********************************
    //
    //      カレンダー製造
    //
    //**********************************
    
    
    
    func getToday(format:String = "yyyy/MM/dd HH:mm:ss") -> String {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: now as Date)
    }
    
    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    fileprivate lazy var  dateFormatter: DateFormatter = { let formatter = DateFormatter();formatter.dateFormat = "yyyy年mm月dd日"
        return formatter
    }()
    
    //祝日判定を行い結果を返すメソッド（true:祝日）
    func justHoliday(_ date : Date) -> Bool {
        //祝日判定用のカレンダークラスのインスタンス
        let tempCalendar = Calendar(identifier: .gregorian)
        
        //祝日判定を行う日にちの年、月、日を取得
        let year = tempCalendar.component(.year, from: date)
        let month = tempCalendar.component(.month, from: date)
        let day = tempCalendar.component(.day, from: date)
        
        //CalculateCalendarLogic() :祝日判定のインスタンスの生成
        let holiday = CalculateCalendarLogic()
        
        return holiday.judgeJapaneseHoliday(year: year, month: month, day: day)
    }
    //date型　-> 年月日をIntで取得
    func getday(_ date: Date) -> (Int,Int,Int){
        let tempCalendar = Calendar(identifier: .gregorian)
        let year = tempCalendar.component(.year, from: date)
        let month = tempCalendar.component(.month, from: date)
        let day = tempCalendar.component(.day, from: date)
        return (year,month,day)
    }
    
    //曜日判定(日曜日：１　〜　土曜日：７)
    func getWeekIdx(_ date: Date) -> Int {
        let tempCalendar = Calendar(identifier: .gregorian)
        return tempCalendar.component(.weekday, from: date)
    }
    
    //土日や祝日の日の文字色を変える
    func calendar(_ calendsar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        //祝日判定をする（祝日は赤色で表示する）
        if self.justHoliday(date){
            return UIColor.red
        }
        
        //土日の判定を行う（土曜日は青色、日曜日は赤色で表示する）
        let weekday = self.getWeekIdx(date)
        //日曜日
        if weekday == 1 {
            return UIColor.red
        }
        //土曜日
        else if weekday == 7 {
            return UIColor.blue
        }
        
        return nil
        
    }
    
    
    //選択日付を表示する
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        //選択日付をフォーマット
        let tmpDate = Calendar(identifier: .gregorian)
        let year = String(tmpDate.component(.year, from: date))
        var month = String(tmpDate.component(.month, from: date))
        var day = String(tmpDate.component(.day, from: date))
        //月、日の桁数が１なら先頭に０を追加
        var formatDate:String?
        if(String(month).count == 1){
           month = "0" + month
        }
        if(String(day).count == 1){
            day = "0" + day
        }

        
        formatDate = getFormattedDateString(dateString: "\(year)\(month)\(day)")
        
        labelDate.text = formatDate
        TableView.reloadData()
    }
    
    func getFormattedDateString(dateString: String, from fromFormat: String = "yyyyMMdd", to toFormat: String = "yyyy年MM月dd日") -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.dateFormat = fromFormat
        guard let date = dateFormatter.date(from: dateString) else { return nil }
        dateFormatter.dateFormat = toFormat
        return dateFormatter.string(from: date)
    }
    
    // 任意の日付に点マークをつける
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int{

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        let calendarDay = formatter.string(from: date)

        // Realmオブジェクトの生成
        let realm = try! Realm()
        // 参照（全データを取得）
        let todos = realm.objects(calender.self)

        if todos.count > 0 {
            for i in 0..<todos.count {
                if i == 0 {
                    datesWithEvents = [todos[i].date]
                } else {
                    datesWithEvents.insert(todos[i].date)
                }
            }
        } else {
            datesWithEvents = []
        }
        return datesWithEvents.contains(calendarDay) ? 1 : 0
    }
    
    var selectdate:String?
    //プラスボタンクリック
    @IBAction func plusBottun(_ sender: Any) {
        
        selectdate = labelDate.text
        //画面遷移(スケジュール登録ページ)
        // SubViewController へ遷移するために Segue を呼び出す
        performSegue(withIdentifier: "income",sender: nil)
    }
    
    
    
    @IBAction func MinusButton(_ sender: Any) {
        selectdate = labelDate.text
        //画面遷移(スケジュール登録ページ)
        // SubViewController へ遷移するために Segue を呼び出す
        performSegue(withIdentifier: "out",sender: nil)
    }
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        //プラスボタンクリック時
        if (segue.identifier == "out"){
            let calender = (segue.destination as? out)!
            //選択した日付けを次画面へ
            calender.selectdate = selectdate
        } else if (segue.identifier == "income") {
            let calender = (segue.destination as? income)!
            calender.selectdate = selectdate
        }
    }
    
    
    
    //データベース上に保存されているデータを配列に格納する。
    func getModel(date:String) ->  [[String:String]] {
        let realm = try! Realm()
        let results = realm.objects(calender.self).filter("date == %@",date)
        var param: [[String:String]] = []
        for result in results {
            param.append(["reason": result.reason,
                          "money": String(result.AmountOfMoney),
                          "date": result.date,
                          "flag": result.flag
                         ])
            
        }
        return param
    }
    
    //セルの編集許可
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }

        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let action = UIContextualAction(style: .destructive,
                                            title: "削除") { (action, view, completionHandler) in
                self.showAlert(deleteIndexPath: indexPath)
                completionHandler(true)
            }
            action.backgroundColor = .red
            let configuration = UISwipeActionsConfiguration(actions: [action])
            return configuration
        }
        
        func showAlert(deleteIndexPath indexPath: IndexPath) {
            let date = labelDate.text!
            let dialog = UIAlertController(title: "削除",
                                           message: "削除してよろしいですか？",
                                           preferredStyle: .alert)
            var array = getModel(date: date)
            dialog.addAction(UIAlertAction(title: "削除", style: .default, handler: { (_) in
                array.remove(at: indexPath.row)
                self.deleteModel(selectedDate: date, indexPath: indexPath.row)
                self.TableView.deleteRows(at: [indexPath], with: .automatic)

            }))
            dialog.addAction(UIAlertAction(title: "やめる", style: .cancel, handler: nil))
            self.present(dialog, animated: true, completion: nil)
        }
}

extension calendar: UITableViewDelegate, UITableViewDataSource {
    //セルの個数を返すメソッド
    func tableView(_ tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        let length:Int = getModel(date: labelDate.text!).count
        return length
        

    }
    
    //セクション内に表示するセルのテキストを返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt IndexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "calendarCell", for: IndexPath)
        let data = getModel(date: labelDate.text!)[IndexPath.row]
        let reasonLabel = cell.contentView.viewWithTag(1) as! UILabel
        let dateLabel = cell.contentView.viewWithTag(2) as! UILabel
        let moneyLabel = cell.contentView.viewWithTag(3) as! UILabel
        //支出なら色を変える
        if(data["flag"] == "0"){
            reasonLabel.textColor = UIColor.red
            dateLabel.textColor = UIColor.red
            moneyLabel.textColor = UIColor.red
        }
        if let reason =  data["reason"]?.description,
              let date = data["date"]?.description,
           let money = data["money"]?.description {
            reasonLabel.text = reason
            dateLabel.text = date
            moneyLabel.text = "\(money)円"
        }

        return cell
    }
    
    
  

    

    
    func deleteModel(selectedDate: String, indexPath: Int) {
        let realm = try! Realm()
        let results = realm.objects(calender.self).filter("date == '\(selectedDate)'")
        do {
            try realm.write {
                realm.delete(results[indexPath])
                getModel(date: labelDate.text!)
            }
        } catch {
            print("delete data error.")
        }
    }
}
