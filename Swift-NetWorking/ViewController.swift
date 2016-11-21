//
//  ViewController.swift
//  Swift-NetWorking
//
//  Created by FlyElephant on 16/11/19.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON

typealias CompleteBlock = (Int,Int)->(Int);

class ViewController: UIViewController {
    @IBOutlet weak var btnAction: UIButton!
    
    var updateBlock:((Int,Int)->(Int))?

    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.blue
        
//        int  (^addBlock)(int a,int b)=^(int a,int b){

//        
//        NSLog(@"addBlock的结果:%d",addBlock(90,72));
        
        var emptyStr : String = " "//声明一个空字符串
        var str : String = "Hello World"//定义变量类型为String
        var str1 = "Hello World"//未定义变量类型，在swift中会根据值推测变量的类型为String
        
//        var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//        airports["test"] = "FlyElephant"
//        for (airportCode, airportName) in airports {
//            print("\(airportCode): \(airportName)")
//        }
        var params:[String: String] = [:]
        params["名字"] = "FlyElephant"
        params["年龄"] = "26"
        print("\(params)")
        let add:(Int,Int)->(Int) = {
            (a,b) in
            return a+b
        }
        let result = add(100,300)
        print("add返回结果:\(result)")
        
        let addBlock:CompleteBlock = { (a,b) in
            return a+b
        }
        let addResult = addBlock(300,400)
        print("typealias返回的结果:\(addResult)")
        
        
//        requestData1(urlString: "") { (data) -> (Void) in
//            
//        }
//        
//        // 调用函数requestData函数
//        requestData2(urlString: "http://www.baidu.com", succeed: { (data) -> (Void) in
//            
//            //成功的回调
//            guard let result = data as? Data else{
//                return;
//            }
//            
//            let str =  NSString(data: result, encoding: String.Encoding.utf8.rawValue);
//            
//            print(str!)
//            
//        }) { (error) -> (Void) in
//            //失败的的回调
//            print(error);
//        }
//        
//        requestData3(urlString: "", succeed: { (data) -> (Void) in
//            print("FlyElephant---成功")
//            }, failure: { (error) -> (Void) in
//            print("失败1")
//        }) { (erro1) -> (Void) in
//            print("失败")
//        }

        
//        self.deserialization()
        self.studyDeserialization()
        
        let pay:PayManager = PayManager.sharedInstance
        print("\(pay)")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "PayManagerNotification"), object: nil, userInfo: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func requestData1(urlString:String,succeed: ((Any?)->(Void))?){
        
        let request = URLRequest(url: URL(string: urlString)!);
        
        //发送网络请求
        NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue()) { (_, data, error) in
            if error == nil {
                //请求成功，执行成功的回调，并把数据传递出去
                succeed?(data);
            }
        }
    }
    
    /// - parameter urlString: 请求接口    String
    /// - parameter succeed:   成功的回调  可选闭包
    /// - parameter failure:   失败的回调  可选闭包
    func requestData2(urlString:String,succeed: ((Any?)->(Void))?,failure:((Any?)->(Void))?){
        
        let request = URLRequest(url: URL(string: urlString)!);
        
        //发送网络请求
        NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue()) { (_, data, error) in
            if error == nil {
                //请求成功，执行成功的回调，并把数据传递出去
                succeed?(data);
            }else{
                //请求失败，执行失败的回调，并把错误传递出去
                failure?(error);
            }
        }
    }
    
    func requestData3(urlString:String,succeed: ((Any?)->(Void))?,failure:((Any?)->(Void))?,failure1:((Any?)->(Void))?){
        
        let request = URLRequest(url: URL(string: urlString)!);
        
        //发送网络请求
        NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue()) { (_, data, error) in
            if error == nil {
                //请求成功，执行成功的回调，并把数据传递出去
                succeed?(data);
            }else{
                //请求失败，执行失败的回调，并把错误传递出去
                failure?(error);
            }
        }
    }
    
    // 解析网络请求
    
    func studyDeserialization() -> Void {

///Users/FlyElephant/Desktop/Code/Swift/Swift-NetWorking/Swift-NetWorking/ViewController.swift:183:80: Cannot convert value of type 'Any' to expected argument type 'NSDictionary?'
        
        
//        Alamofire.request("http://assets.200h.com//course/mobile//1.5//ENG/Basic-structure.json?hash=4960e73ac5097a62a6af6b7e265050a9").responseString { response in
//            if let jsonString = response.result.value {
//                if let course = JSONDeserializer<Course>.deserializeFrom(json: jsonString) {
//                    let firstChapter: Chapter? = course.themes?.first?.chapters?.first
//                    let chapterCode:String? = firstChapter?.code
//                    print("第一个Chapter的编码:\(chapterCode!)")
//                    print("第一个Chapter:\(firstChapter!)")
//                }
//            }
//        }
        
        Alamofire.request("http://assets.200h.com//course/mobile//1.5//ENG/Basic-structure.json?hash=4960e73ac5097a62a6af6b7e265050a9").responseJSON { response in
            print("返回的结果:\(response.result.value)")
            if let JSON = response.result.value as? Dictionary<String,AnyObject> {
                print("返回结果------\(JSON)")
                if let course = JSONDeserializer<Course>.deserializeFrom(dict: JSON as NSDictionary?){
                        let firstChapter: Chapter? = course.themes?.first?.chapters?.first
                        let chapterCode:String? = firstChapter?.code
                        print("第一个Chapter的编码:\(chapterCode!)")
                        print("第一个Chapter的info:\(firstChapter?.chapter_url)")
                        print("第一个Chapter的info:\(firstChapter?.info)")
                    
                        if let jsonStr = JSONSerializer.serialize(model: firstChapter).toJSON() {
                            print("第一个Chapter的内容: ", jsonStr)
                        }
                }
            }
        }
    }
    
    //网络请求解析
    func deserialization() {
        enum Gender: String, HandyJSON {
            case Male = "Male"
            case Female = "Female"
            
            init() {
                self = .Male
            }
        }
        
        struct Teacher: HandyJSON {
            var name: String?
            var age: Int?
            var height: Int?
            var gender: Gender?
            
            mutating func mapping(mapper: HelpingMapper) {
                mapper.specify(property: &gender) {
                    return Gender(rawValue: $0)
                }
            }
        }
        
        struct Subject: HandyJSON {
            var name: String?
            var id: Int64?
            var credit: Int?
            var lessonPeriod: Int?
        }
        
        class Student: HandyJSON {
            var id: String?
            var name: String?
            var age: Int?
            var height: Int?
            var gender: Gender?
            var className: String?
            var teacher: Teacher?
            var subject: [Subject]?
            var seat: String?
            
            required init() {}
            
            func mapping(mapper: HelpingMapper) {
                mapper.specify(property: &gender) {
                    return Gender(rawValue: $0)
                }
            }
        }
        
        let jsonString = "{\"id\":\"77544\",\"name\":\"Tom Li\",\"age\":18,\"height\":180,\"gender\":\"Male\",\"className\":\"A\",\"teacher\":{\"name\":\"Lucy He\",\"age\":28,\"height\":172,\"gender\":\"Female\",},\"subject\":[{\"name\":\"math\",\"id\":18000324583,\"credit\":4,\"lessonPeriod\":48},{\"name\":\"computer\",\"id\":18000324584,\"credit\":8,\"lessonPeriod\":64}],\"seat\":\"4-3-23\"}"
        
        if let student = JSONDeserializer<Student>.deserializeFrom(json: jsonString) {
            print(student)
            print(student.id)
            print(student.name)
            print(student.age)
            print(student.height)
            print(student.gender)
            print(student.className)
            print(student.teacher?.name)
            print(student.teacher?.age)
            print(student.teacher?.height)
            print(student.teacher?.gender)
            print(student.subject?.first?.name)
            print(student.subject?.first?.id)
            print(student.subject?.first?.credit)
            print(student.subject?.first?.lessonPeriod)
            print(student.subject?.last?.name)
            print(student.subject?.last?.id)
            print(student.subject?.last?.credit)
            print(student.subject?.last?.lessonPeriod)
            print(student.seat)
        }
    }


}

