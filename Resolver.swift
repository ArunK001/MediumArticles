import Resolver

// Define protocols for services
protocol UserService {
    func getUser() -> User
}

protocol PostService {
    func getPosts() -> [Post]
}

// Concrete implementations of services
class UserServiceImpl: UserService {
    func getUser() -> User {
        // Implementation to fetch user data
    }
}

class PostServiceImpl: PostService {
    func getPosts() -> [Post] {
        // Implementation to fetch posts
    }
}

// Register services with Resolver
extension Resolver {
    static func registerServices() {
        register { UserServiceImpl() as UserService }
        register { PostServiceImpl() as PostService }
    }
}

// View models
class UserViewModel: ObservableObject {
    @Injected var userService: UserService
    
    // ViewModel logic using userService
}

class PostViewModel: ObservableObject {
    @Injected var userService: UserService
    @Injected var postService: PostService
    
    // ViewModel logic using userService and postService
}

// Application setup
@main
struct MyApp: App {
    @Environment(\.resolver) private var resolver

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.resolver, Resolver.appScope.container)
        }
    }
}
