//
//  ViewController.swift
//  AnimationTransform
//
//  Created by Shogo Nobuhara on 2021/02/03.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        // フラワーを作る
        let flower = UIImageView(image: UIImage(named: "flower"))
        // 透明度を0にする
        flower.alpha = 0
        
        // 0.2倍サイズにする
        let scaleTransform = CGAffineTransform(scaleX: 0.2, y:0.2)
        // -Py/2回転する
        let rotationTransform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
        // トランスフォームを足し合わせる
        let transform = scaleTransform.concatenating(rotationTransform)
        // flowerを変形させる
        flower.transform = transform
        
        // タップされた座標にflowerを追加する
        flower.center = sender.location(in: self.view)
        view.addSubview(flower)
        
        // アニメーション
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       options: [.curveEaseInOut],
                       animations: {
                        // 透明度を1にする
                        flower.alpha = 1.0
                        // 変形を戻す
                        flower.transform = .identity
                       },
                       completion: { (finished:Bool)in
                        // フェードインが完了したら実行する
                        self.fadeoutAndRemove(flower)
                       })
        
    }
    
    // フェードアウトが完了したら取り除く
    func fadeoutAndRemove(_ view:UIView) {
        // フェードアウトする
        UIView.animate(
            withDuration: 2.0, // 2.0秒間かかって消える
            delay: 3.0, // 3秒後に消え始める
            options: UIView.AnimationOptions(),
            animations: {
                // 消える
                view.alpha = 0.0
        },
            completion:{(finished:Bool) in
                // ビューから取り除く
                view.removeFromSuperview()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

