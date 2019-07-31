//
//  ViewController.swift
//  Calendar2019
//
//  Created by Julia Wang on 2019/7/30.
//  Copyright © 2019 Julia Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var calendarImageVIew: UIImageView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var yearSlider: UISlider!
    
    //宣告常數：dateFormatter、及月曆的圖片
    let dateFormatter = DateFormatter()
    let monthimage = ["Jan","Feb","Mar","Apr","May","Jen","Jul","Aug","Sep","Oct","Nev","Dev"]
    //宣告變數：日期、數圖片、slider
    var dateString:String = ""
    var timer:Timer?
    var monthcount = 0
    var slidervalue = 0
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 建立 dateFormatter
        time()
        datePicker.locale = Locale(identifier: "zh_TW")
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
    }
    //比對陣列內的月曆圖片
    func compare(){
        if monthcount >= monthimage.count{
            monthcount = 0
            chooseImage(num2:monthcount)
            calendarImageVIew.image = UIImage(named: monthimage[monthcount])
        }else{
            chooseImage(num2:monthcount)
            calendarImageVIew.image = UIImage(named: monthimage[monthcount])
        }
        //Slider跟著動
        yearSlider.value = Float(monthcount)
        monthcount += 1
    }
    func time(){
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){(timer)in self.compare()}
    }
    
    
    //DatePicker Action
    @IBAction func changeImageDatePicker(_ sender: UIDatePicker){
        let ImageDate = datePicker.date
        let dateComponents = Calendar.current.dateComponents(in: TimeZone.current, from: ImageDate)

        var month = dateComponents.month!
        month -= 1
        calendarImageVIew.image = UIImage(named: monthimage[month])
       
    }
    
    
    //Slider Action
    @IBAction func changeValueSlider(_ sender: UISlider) {
        sender.value.round()
        slidervalue = Int(sender.value)
        calendarImageVIew.image = UIImage(named: monthimage[slidervalue])
    }
    
    //Switch Action
    @IBAction func autoplaySwitch(_ sender: UISwitch) {
        if sender .isOn{
            time()
            monthcount = slidervalue
            yearSlider.value = Float(monthcount)
        }else{
            timer?.invalidate()
        }
    }
    //選月曆
    func chooseImage(num2:Int){
        switch num2 {
        case 0:
                dateString = "2019/01/01"
        case 1:
                dateString = "2019/02/01"
        case 2:
                dateString = "2019/03/01"
        case 3:
                dateString = "2019/04/01"
        case 4:
                dateString = "2019/05/01"
        case 5:
                dateString = "2019/06/01"
        case 6:
                dateString = "2019/07/01"
        case 7:
                dateString = "2019/08/01"
        case 8:
                dateString = "2019/09/01"
        case 9:
                dateString = "2019/10/01"
        case 10:
                dateString = "2019/11/01"
        default:
                dateString = "2019/12/01"
    }
    //修改datapicker顯示日期
        let date = dateFormatter.date(from: dateString)
        datePicker.date = date!
        
}
override func viewDidDisappear(_ animated: Bool) {
        timer?.invalidate()
    }

}



