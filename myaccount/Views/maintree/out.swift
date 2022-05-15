//
//  out.swift
//  myaccount


import UIKit

var outSelectdate:String?

class out: UIViewController ,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    @IBOutlet weak var collection: UICollectionView!
    private let photos = ["photo0","photo1","photo2","photo3","photo4","photo5","photo6","photo7"]
    let contents = ["飲食費","交通費","雑貨","日用品","趣味","医療費","衣類","その他"]
    var selectdate:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outSelectdate = selectdate
        //ナビゲーションを表示させる
        //navigationController?.popViewController(animated: true)
        
        //        //レイアウト設定
        let
        layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15.0, left: 15.0, bottom: 15.0, right: 15.0)
        collection.collectionViewLayout =
        layout
        
    }
    //１行あたりのアイテム数
    let itemsPerRow: CGFloat = 3
    //１つのセクションの中に表示するセル（要素）の数
    func collectionView(_ collctionView: UICollectionView, numberOfItemsInSection: Int) -> Int {
        return photos.count
    }
    //セルに表示する内容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        //Tag番号を使ってインスタンスを作る
        //Tag1=アイコン部分
        let photoImageView = cell.contentView.viewWithTag(1) as! UIImageView
        let photoImage = UIImage(named: photos[indexPath.row])
        photoImageView.image = photoImage
        //Tag2=文字部分
        let contenslabel = cell.contentView.viewWithTag(2) as! UILabel
        contenslabel.text = contents[indexPath.row]
        
        return cell
        
    }
    //スクリーンサイズに応じたセルサイズを返す
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = view.frame.width
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem )
    }
    
    //値を渡す処理
    //選択されてたラベル値を受ける
    var selecttxt:String?
    var selectedImage :UIImage?
    var r_selectdate:String?
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // [indexPath.row] から画像名を探し、UImage を設定
        selectedImage = UIImage(named: photos[indexPath.row])
        
        
        if selectedImage != nil {
            //タップされた画像に応じてsegueで送るテキストを選択する
            switch photos[indexPath.row]{
            case "photo0": selecttxt = contents[0]
            case "photo1": selecttxt = contents[1]
            case "photo2": selecttxt = contents[2]
            case "photo3": selecttxt = contents[3]
            case "photo4": selecttxt = contents[4]
            case "photo5": selecttxt = contents[5]
            case "photo6": selecttxt = contents[6]
            case "photo7": selecttxt = contents[7]
                
            default:
                break
            }
            
            //            // SubViewController へ遷移するために Segue を呼び出す
            self.performSegue(withIdentifier: "outregister",sender: nil)
        }
    }
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "outregister") {
            let out = (segue.destination as? outregister)!
            
            // SubViewController のselectedImgに選択された画像を設定する
            out.selectedImg = selectedImage
            out.selecttext = selecttxt
            out.r_selectdate = outSelectdate
        }
    }
    
}




