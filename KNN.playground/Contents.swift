// MARK: KNN

import Foundation
let K = 5
let x:(Double,Double,Double) = (23, 3, 17)
let  nums:[(Double,Double,Double,String)] = [
    (45, 2, 9, "I"),
    (21, 17, 5, "I"),
    (54, 9, 11, "I"),
    (39, 0, 31, "I"),
    (5, 2, 57, "II"),
    (3, 2, 65, "II"),
    (2, 3, 55, "II"),
    (6, 4, 21, "II"),
    (7, 46, 4, "I"),
    (9, 39, 8, "II"),
    (9, 38, 2, "I"),
    (8, 34, 17, "II")]

//欧式距离计算
let someNums = nums.map { a -> (Double, String) in
    let dis = pow(x.0 - a.0, 2) + pow(x.1 - a.2, 2) + pow(x.2 - a.2, 2)
    return (sqrt(dis),a.3);
}

//排序 降序
let sortNumbers = someNums.sorted {(a, b) -> Bool in
    return a.0 > b.0
}

//取出前K个数据
let prefixList = [] + sortNumbers.prefix(K)

//字典计算个数
var dic: [String:Int] = [:]
for data in prefixList{
    let value = dic[data.1]
    dic.updateValue((value ?? 0) + 1, forKey: data.1)
}
//转换到元组
var results = [(Int,String)]()
for item in dic {
    results.append((item.value,item.key))
}

//元组排序
let Max = [] + results.sorted {(a, b) -> Bool in
    return a.0 > b.0;
}.prefix(1)
print("数据\(x) 按照\(K)取值 最后结果是:" + Max.first!.1 )


