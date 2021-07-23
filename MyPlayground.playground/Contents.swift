import UIKit
import Foundation

func correct(_ timeString: String?) -> String? {
  
    //array that contains each number in timeString
    var arrTime = timeString?.components(separatedBy: ":").compactMap{ Int($0) } ?? [0,0,0]
  
    //logic to format valid time string numbers if > 59
    if arrTime != [0,0,0] && timeString != ""  && arrTime != [] {
    for i in 1..<arrTime.count {
        if arrTime[i] > 59 && arrTime.count != 1{
        arrTime[i] = arrTime[i] - 60
        arrTime[i - 1] = arrTime[i - 1] + 1
        }
    //second pass if any carry over should result in another carry over
       for i in 1..<arrTime.count {
        if arrTime[i] > 59 && arrTime.count != 1{
        arrTime[i] = arrTime[i] - 60
        arrTime[i - 1] = arrTime[i - 1] + 1
        }
    }
}
     //logic to format hours
    if arrTime[0] >= 24 {
    arrTime[0] = arrTime[0] % 24
        }
    }
    // placeholder for final return value
    let result = arrTime.map {String(format: "%02d",$0)}.joined(separator: ":")

   if timeString == "" {
       return ""
   }else if timeString == nil || arrTime.count == 1 || arrTime == [] {
       return nil
   }else{
       return result
   }
}

correct("19:01:99")
