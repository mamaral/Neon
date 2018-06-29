internal enum _Corner {
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
}

internal extension Corner {
    internal func toInternal(_ view: Frameable) -> _Corner {
        switch self {
        case .topLeft:
            return .topLeft
        case .topRight:
            return .topRight
        case .bottomLeft:
            return .bottomLeft
        case .bottomRight:
            return .bottomRight
        case .topLeading:
            return view.isRightToLeft ? .topRight : .topLeft
        case .topTrailing:
            return view.isRightToLeft ? .topLeft : .topRight
        case .bottomLeading:
            return view.isRightToLeft ? .bottomRight : .bottomLeft
        case .bottomTrailing:
            return view.isRightToLeft ? .bottomLeft : .bottomRight
        }
    }
}


internal enum _Edge {
    case top
    case left
    case bottom
    case right
}

internal extension Edge {
    internal func toInternal(_ view: Frameable) -> _Edge {
        switch self {
        case .top:
            return .top
        case .left:
            return .left
        case .bottom:
            return .bottom
        case .right:
            return .right
        case .leading:
            return view.isRightToLeft ? .right : .left
        case .trailing:
            return view.isRightToLeft ? .left : .right
        }
    }
}


internal enum _Align {
    case toTheRightMatchingTop
    case toTheRightMatchingBottom
    case toTheRightCentered
    case toTheLeftMatchingTop
    case toTheLeftMatchingBottom
    case toTheLeftCentered
    case underMatchingLeft
    case underMatchingRight
    case underCentered
    case aboveMatchingLeft
    case aboveMatchingRight
    case aboveCentered
}

internal extension Align {

    internal func toInternal(_ view: Frameable) -> _Align {
        switch self {
        case .toTheRightMatchingTop:
            return .toTheRightMatchingTop

        case .toTheRightMatchingBottom:
            return .toTheRightMatchingBottom

        case .toTheRightCentered:
            return .toTheRightCentered

        case .toTheLeftMatchingTop:
            return .toTheLeftMatchingTop

        case .toTheLeftMatchingBottom:
            return .toTheLeftMatchingBottom

        case .toTheLeftCentered:
            return .toTheLeftCentered

        case .underMatchingLeft:
            return .underMatchingLeft

        case .underMatchingRight:
            return .underMatchingRight

        case .underCentered:
            return .underCentered

        case .aboveMatchingLeft:
            return .aboveMatchingLeft

        case .aboveMatchingRight:
            return .aboveMatchingRight

        case .aboveCentered:
            return .aboveCentered


        case .toTheLeadingMatchingTop:
            return view.isRightToLeft ? .toTheRightMatchingTop : .toTheLeftMatchingTop

        case .toTheTrailingMatchingTop:
            return view.isRightToLeft ? .toTheLeftMatchingTop : .toTheRightMatchingTop

        case .toTheLeadingMatchingBottom:
            return view.isRightToLeft ? .toTheRightMatchingBottom : .toTheLeftMatchingBottom

        case .toTheTrailingMatchingBottom:
            return view.isRightToLeft ? .toTheLeftMatchingBottom : .toTheRightMatchingBottom

        case .toTheLeadingCentered:
            return view.isRightToLeft ? .toTheRightCentered : .toTheLeftCentered

        case .toTheTrailingCentered:
            return view.isRightToLeft ? .toTheLeftCentered : .toTheRightCentered

        case .underMatchingLeading:
            return view.isRightToLeft ? .underMatchingRight : .underMatchingLeft

        case .underMatchingTrailing:
            return view.isRightToLeft ? .underMatchingLeft : .underMatchingRight

        case .aboveMatchingLeading:
            return view.isRightToLeft ? .aboveMatchingRight : .aboveMatchingLeft

        case .aboveMatchingTrailing:
            return view.isRightToLeft ? .aboveMatchingLeft : .aboveMatchingRight
        }
    }
}
