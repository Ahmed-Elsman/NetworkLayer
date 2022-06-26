public enum HTTPStatusCode: Int, Error {

    enum ResponseType {

        /// - informational: This class of status code indicates a provisional response, consisting only of the Status-Line and optional headers, and is terminated by an empty line.
        case informational

        /// - success: This class of status codes indicates the action requested by the client was received, understood, accepted, and processed successfully.
        case success

        /// - redirection: This class of status code indicates the client must take additional action to complete the request.
        case redirection

        /// - clientError: This class of status code is intended for situations in which the client seems to have erred.
        case clientError

        /// - serverError: This class of status code indicates the server failed to fulfill an apparently valid request.
        case serverError

        /// - undefined: The class of the status code cannot be resolved.
        case undefined
    }

    // 100 Informational
    case `continue` = 100
    case switchingProtocols
    case processing
    // 200 Success
    case ok = 200
    case created
    case accepted
    case nonAuthoritativeInformation
    case noContent
    case resetContent
    case partialContent
    case multiStatus
    case alreadyReported
    case iMUsed = 226
    // 300 Redirection
    case multipleChoices = 300
    case movedPermanently
    case found
    case seeOther
    case notModified
    case useProxy
    case switchProxy
    case temporaryRedirect
    case permanentRedirect
    // 400 Client Error
    case badRequest = 400
    case unauthorized
    case paymentRequired
    case forbidden
    case notFound
    case methodNotAllowed
    case notAcceptable
    case proxyAuthenticationRequired
    case requestTimeout
    case conflict
    case gone
    case lengthRequired
    case preconditionFailed
    case payloadTooLarge
    case uriTooLong
    case unsupportedMediaType
    case rangeNotSatisfiable
    case expectationFailed
    case imATeapot
    case misdirectedRequest = 421
    case unprocessableEntity
    case locked
    case failedDependency
    case upgradeRequired = 426
    case preconditionRequired = 428
    case tooManyRequests
    case requestHeaderFieldsTooLarge = 431
    case unavailableForLegalReasons = 451
    // 500 Server Error
    case internalServerError = 500
    case notImplemented
    case badGateway
    case serviceUnavailable
    case gatewayTimeout
    case httpVersionNotSupported
    case variantAlsoNegotiates
    case insufficientStorage
    case loopDetected
    case notExtended = 510
    case networkAuthenticationRequired

    var responseType: ResponseType {

        switch rawValue {

        case 100..<200:
            return .informational

        case 200..<300:
            return .success

        case 300..<400:
            return .redirection

        case 400..<500:
            return .clientError

        case 500..<600:
            return .serverError

        default:
            return .undefined

        }

    }

}

import Foundation

extension HTTPURLResponse {

    var status: HTTPStatusCode? {
        return HTTPStatusCode(rawValue: statusCode)
    }

}
