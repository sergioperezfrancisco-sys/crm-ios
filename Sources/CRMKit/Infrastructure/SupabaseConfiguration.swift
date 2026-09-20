import Foundation

public struct SupabaseConfiguration: Sendable, Equatable {
    public let url: URL
    public let anonKey: String

    public init(url: URL, anonKey: String) {
        self.url = url
        self.anonKey = anonKey
    }

    public static func fromEnvironment(
        environment: [String: String] = ProcessInfo.processInfo.environment
    ) -> SupabaseConfiguration? {
        guard
            let rawURL = environment["SUPABASE_URL"],
            let url = URL(string: rawURL),
            let anonKey = environment["SUPABASE_ANON_KEY"],
            !anonKey.isEmpty
        else {
            return nil
        }
        return SupabaseConfiguration(url: url, anonKey: anonKey)
    }

    public static func fromPlist(
        bundle: Bundle = .main,
        resource: String = "Supabase.local"
    ) -> SupabaseConfiguration? {
        guard
            let path = bundle.path(forResource: resource, ofType: "plist"),
            let values = NSDictionary(contentsOfFile: path) as? [String: Any],
            let rawURL = values["SUPABASE_URL"] as? String,
            let url = URL(string: rawURL),
            let anonKey = values["SUPABASE_ANON_KEY"] as? String,
            !anonKey.isEmpty
        else {
            return nil
        }
        return SupabaseConfiguration(url: url, anonKey: anonKey)
    }
}
