//
//  ViewController.swift
//  10_04_24_DispatchQueueDemo
//
//  Created by Vishal Jagtap on 31/05/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        basicsOfConcurrentQueue()
        //basicsOfDispatchQueue()
    }
    
    func basicsOfConcurrentQueue(){
        let concurrentQueue1 = DispatchQueue(label: "concurrentQueue1", attributes: .concurrent)
        concurrentQueue1.sync {
            for i in 1...400000{
                print("Task 1 .... \(Thread.description()) -- \(Thread.isMainThread) -- \(Thread.current) -- \(Thread.threadPriority())")
            }
        }
        
        concurrentQueue1.async {
            print("Deepali is working on task1 \(Thread.description()) -- \(Thread.isMainThread) -- \(Thread.current) -- \(Thread.threadPriority())")
        }
        
        concurrentQueue1.async {
            print("Shreya is working on task2 \(Thread.description()) -- \(Thread.isMainThread) -- \(Thread.current) -- \(Thread.threadPriority())")
        }
        
        concurrentQueue1.async {
            print("Krishna is performing task3 \(Thread.description()) -- \(Thread.isMainThread) -- \(Thread.current) -- \(Thread.threadPriority())")
        }
        
        let concurrentQueue2 = DispatchQueue(label: "concurrentQueue2", attributes: .concurrent)
        
        concurrentQueue2.sync {
            print("Task 1 on concurrentQueue2 \(Thread.description()) -- \(Thread.isMainThread) -- \(Thread.current) -- \(Thread.threadPriority())")
        }
        
        concurrentQueue2.sync {
            print("Task 2 on concurrentQueue2 \(Thread.description()) -- \(Thread.isMainThread) -- \(Thread.current) -- \(Thread.threadPriority())")
        }
        
        concurrentQueue2.async {
            print("Task 3 on concurrentQueue2 \(Thread.description()) -- \(Thread.isMainThread) -- \(Thread.current) -- \(Thread.threadPriority())")
        }
    }
    
    func basicsOfDispatchQueue(){
        let queue1 = DispatchQueue(label: "queue1 ")
        
        queue1.async {
            for i in 1...1000{
                print("The task 1 is performed \(i) -- async mode \(Thread.current) -- \(Thread.threadPriority()) --       isMainThread -- \(Thread.isMainThread)")
            }
            print("sub task \(Thread.current) -- \(Thread.threadPriority()) --       isMainThread -- \(Thread.isMainThread)")
        }
        
        queue1.async {
            print("The task 2 is getting performed -- async mode \(Thread.current) -- \(Thread.threadPriority()) --       isMainThread -- \(Thread.isMainThread)")
        }
        
        queue1.sync {
            for i in 1...500000{
                print("The task 3 is getting performed -- sync mode \(Thread.current) -- \(Thread.threadPriority()) --       isMainThread -- \(Thread.isMainThread)")
            }
        }
    }
    
    @IBAction func btn1Clicked(_ sender: Any) {
        print("Btn1 Clicked")
    }
    
    @IBAction func btn2Clicked(_ sender: Any) {
        print("Btn2 Clicked")
    }
}
