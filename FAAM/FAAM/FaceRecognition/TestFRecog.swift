//
//  TestFaceRecognition.swift
//  FAAM
//
//  Created by Mithun-15283 on 06/08/24.
//

import SwiftUI
import Vision
import VisionKit

struct TestFaceRecognition: View {
    @State var expressionRecognizer = VNFaceExpressionRecognizer()
    
    var body: some View {
        VStack {
            Image("face")
                .resizable()
                .frame(width: 300, height: 300)
                .onAppear {
                    self.expressionRecognizer.expressions = [.happiness, .sadness, .anger, .surprise]
                }
                .onTapGesture {
                    let request = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
                    
                    do {
                        try request.perform([self.expressionRecognizer])
                        
                        let results = self.expressionRecognizer.results as? [VNFaceExpressionObservation]
                        
                        if let results = results {
                            for result in results {
                                let expression = result.expression
                                print(expression)
                            }
                        }
                    } catch {
                        print(error)
                    }
                }
        }
        
    }
}
