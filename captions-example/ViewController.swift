import Captions
import UIKit

let textSegments = """
  A glimpse through an interstice caught,
  Of a crowd of workmen and drivers in a bar-room around the stove late of a winter night, and I unremark’d seated in a corner,
  Of a youth who loves me and whom I love, silently approaching and seating himself near, that he may hold me by the hand,
  A long while amid the noises of coming and going, of drinking and oath and smutty jest,
  There we two, content, happy in being together, speaking little, perhaps not a word.
"""
.components(separatedBy: .whitespacesAndNewlines)
.enumerated()
.map { x in CaptionTextSegment(duration: 0.5, timestamp: CFTimeInterval(x.offset) * 0.5, text: x.element) }

class ViewController: UIViewController {
  private let captionLayer = CALayer()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .black
    captionLayer.frame = CGRect(
      origin: CGPoint(x: 0, y: (view.frame.height - 85) / 2),
      size: CGSize(width: view.frame.width, height: 85)
    )
    view.layer.addSublayer(captionLayer)

    renderCaptions(
      layer: captionLayer,
      style: CaptionStyle(
        wordStyle: .animated,
        lineStyle: .fadeInOut(numberOfLines: 2),
        textAlignment: .center,
        backgroundStyle: .none,
        backgroundColor: .white,
        font: UIFont.systemFont(ofSize: 27),
        textColor: .white
      ),
      textSegments: textSegments,
      duration: CFTimeInterval(textSegments.count) * 0.5,
      backgroundHeight: 85
    )
  }
}
