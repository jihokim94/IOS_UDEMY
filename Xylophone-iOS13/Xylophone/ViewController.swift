import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        
        print(sender.backgroundColor!)
        print(sender.currentTitle!)
        let tappedSound : String = sender.currentTitle!
        sender.alpha = 0.5 // 버튼 이벤트 발생시 클릭시 음영 효과
        
        //시간을 딜레이 주고 이벤트 발생 현재시간(이벤트 발생시간)에서0.2초후 다시 원래의 음영으로 돌린다
        // 작업 항목을 실행 관리하는 클래스라는데 공식문서로 확인해봐야겠다.
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
            sender.alpha = 1.0
        }
        
        playSound(choice : tappedSound)
    }
    
    func playSound(choice : String) {
        let url = Bundle.main.url(forResource: choice, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}

