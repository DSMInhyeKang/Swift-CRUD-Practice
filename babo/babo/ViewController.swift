//
//  ViewController.swift
//  babo
//
//  Created by 강인혜 on 2022/06/14.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        postTest()
    }
    
    func postTest() {
        let url = "http://13.125.227.67:8080/post"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 10
        
        let params = ["Title": "제목",
                      "Content": "내용"] as Dictionary
        
        do {
            try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
        } catch {
            print("http Body Error")
        }
        
        AF.request(request).responseString { (response) in
            switch response.result {
            case .success:
                print("POST 성공")
            
            case .failure(let error):
                print("POST 실패")
            }
        }
    }

    
    var result: [postData] = []

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return result.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
            cell.lbTitle.text = "\(result[indexPath.row].title)"
            return cell
        }

}

