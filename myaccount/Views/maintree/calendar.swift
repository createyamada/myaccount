//
//  calendar.swift
//  myaccount


import UIKit
import FSCalendar
import CalculateCalendarLogic

class calendar: UIViewController, FSCalendarDataSource, FSCalendarDelegate,FSCalendarDelegateAppearance {

    @IBOutlet weak var calendar: FSCalendar!

    @IBOutlet weak var labelDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //デリゲートの設定
        self.calendar.dataSource = self
        self.calendar.delegate = self
        
        labelDate.text = getToday(format:"yyyy年MM月dd日")
        //ナビゲーションを表示させる
        navigationController?.popViewController(animated: true)

    }
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
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let tmpDate = Calendar(identifier: .gregorian)
        let year = tmpDate.component(.year, from: date)
        let month = tmpDate.component(.month, from: date)
        let day = tmpDate.component(.day, from: date)
        labelDate.text = "\(year)年\(month)月\(day)日"
    }
    
    
    var selectdate:String?
    //プラスボタンクリック
    @IBAction func plusBottun(_ sender: Any) {
        
        selectdate = labelDate.text
        //画面遷移(スケジュール登録ページ)
        // SubViewController へ遷移するために Segue を呼び出す
        performSegue(withIdentifier: "out",sender: nil)
        }
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {

        if (segue.identifier == "out") {
            let calender = (segue.destination as? out)!
            
            // SubViewController のselectedImgに選択された画像を設定する
            calender.selectdate = selectdate
        }
    }
}
