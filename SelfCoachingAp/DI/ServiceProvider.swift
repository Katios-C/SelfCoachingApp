
import Foundation

public class ServiceProvider {
    fileprivate var service: [String : Any] = [:]
    
    public static let shared = ServiceProvider()
    
  
    
    fileprivate init() {}
    
    public func addDependency<T>(dependency: T) {
        let typeName = String(describing: T.self)
        if service[typeName] == nil {
            service[typeName] = dependency
        }
    }
    
    public func getDependency<T>(type: T.Type) -> T? {
        let typeName = String(describing: T.self)
        return service[typeName] as? T
    }
}
