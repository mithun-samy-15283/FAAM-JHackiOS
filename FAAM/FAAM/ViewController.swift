//
//  ViewController.swift
//  FAAM
//
//  Created by Mithun-15283 on 06/08/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   

    func fetchPrediction(data: [String: Any]) {
        let url = URL(string: "https://your-backend-url/predict")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body = try? JSONSerialization.data(withJSONObject: data)
        request.httpBody = body

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            if let result = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                print("Result: \(result)")
            }
        }

        task.resume()
    }




}

