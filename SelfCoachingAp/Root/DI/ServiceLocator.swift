class ServiceLocator {
    
    fileprivate var services: [String : Any] = [:]
    static var shared = ServiceLocator()
    private init() {}
    
    func addDependancy<T> (object: T) {
        services[String(describing: T.self)] = object
    }
    
    
    func getDependency<T>(typeObject: T.Type) -> T! {
        let typeName = String(describing: T.self)
        return services[typeName] as? T
    }
    
    func getDependency1<T: AnyObject>(typeObject: T) -> T?  {
        let typeName = String(describing: T.self)
        return services[typeName] as? T
    }
}
