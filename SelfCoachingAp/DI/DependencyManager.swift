class DependencyManager {
    private let myDependency: LoginViewModel
    private let mytTmerViewModelShared: TimerViewModel
    
    init() {
        self.myDependency = LoginViewModel()
        self.mytTmerViewModelShared = TimerViewModel()
        addDependencies()
    }
    
    private func addDependencies() {
        let resolver = Resolver.shared
        resolver.add(myDependency)
        resolver.add(mytTmerViewModelShared)
    }
}
