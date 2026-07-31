import Foundation

enum Telemetry {
    private static let intakeUrl =
        "https://http-intake.logs.datadoghq.com/v1/input/pubb96b84a13912504f4354f2d794ea4fab"

    static func send(
        event: String,
        sessionId: String,
        attributes: [String: String] = [:]
    ) {
        guard let url = URL(string: intakeUrl) else { return }

        var payload: [String: Any] = [
            "application": "3ds-ios",
            "ddsource": "3ds-ios",
            "service": "3ds-ios",
            "event": event,
            "sessionId": sessionId,
            "message": event,
        ]

        for (key, value) in attributes {
            payload[key] = value
        }

        guard let body = try? JSONSerialization.data(withJSONObject: payload) else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body

        URLSession.shared.dataTask(with: request).resume()
    }
}
