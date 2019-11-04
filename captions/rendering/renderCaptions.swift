import AVFoundation

fileprivate let BAR_SPACE_HEIGHT_FACTOR = CGFloat(1.25)

public func renderCaptions(
  layer: CALayer,
  style: CaptionStyle,
  textSegments: [CaptionTextSegment],
  duration: CFTimeInterval,
  backgroundHeight: Float
) {
  let rowKeys: [CaptionRowKey] = [.a, .b]
  let rowSize = CGSize(width: layer.frame.width, height: style.font.lineHeight)
  let map = makeCaptionStringsMap(
    textSegments: textSegments,
    size: rowSize,
    style: style,
    keys: rowKeys
  )
  let stringSegmentLines = makeCaptionStringSegmentLines(
    textSegments: textSegments,
    size: rowSize,
    style: style,
    numberOfLines: rowKeys.count
  )
  renderCaptionLines(
    style: style,
    layer: layer,
    duration: duration,
    rowSize: rowSize,
    numberOfLines: rowKeys.count,
    stringSegmentLines: stringSegmentLines
  )
  renderCapionBackground(
    captionStyle: style,
    layer: layer,
    backgroundHeight: backgroundHeight,
    map: map,
    timestampOfFirstSegment: stringSegmentLines.first?.first?.timestamp ?? 0,
    getSizeOfRow: { (_: CaptionRowKey) -> CGSize in
      rowSize
    }
  )
}
