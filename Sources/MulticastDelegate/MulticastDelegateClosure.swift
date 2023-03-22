import Foundation

public struct MulticastDelegateClosure<T> {
    private class Binder<T> {
        var action: (T) -> Void
        
        init(action: @escaping (T) -> Void) {
            self.action = action
        }
    }
    
    private var delegates = NSMapTable<AnyObject, Binder<T>>.weakToStrongObjects()

    public init() {}

    public var isEmpty: Bool {
        return delegates.count == 0
    }

    public func add(on anyClass: AnyObject, action: @escaping (T) -> Void) {
        delegates.setObject(Binder<T>(action: action), forKey: anyClass)
    }

    public func remove(anyClass: AnyObject) {
        delegates.removeObject(forKey: anyClass)
    }

    public func invoke(_ invocation: ((T) -> Void) -> Void) {
        for binder in self.delegates.objectEnumerator()!.allObjects {
                invocation((binder as! Binder<T>).action)
        }
    }

    public func dispatch(on queue: DispatchQueue, invocation: @escaping ((T) -> Void) -> ()) {
        queue.async {
            for delegate in self.delegates.objectEnumerator()!.allObjects {
                invocation((delegate as! Binder<T>).action)
            }
        }
    }
}

