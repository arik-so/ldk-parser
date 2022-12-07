
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias DefaultRouter = Bindings.DefaultRouter

			extension Bindings {
		

				/// A [`Router`] implemented using [`find_route`].
				public class DefaultRouter: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKDefaultRouter?

					public init(cType: LDKDefaultRouter) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKDefaultRouter, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the DefaultRouter, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = DefaultRouter_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new router using the given [`NetworkGraph`], a [`Logger`], and a randomness source
					/// `random_seed_bytes`.
					public init(networkGraph: NetworkGraph, logger: Logger, randomSeedBytes: [UInt8], scorer: LockableScore) {
						// native call variable prep
						
						let randomSeedBytesPrimitiveWrapper = ThirtyTwoBytes(value: randomSeedBytes)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: networkGraph.cType!) { (networkGraphPointer: UnsafePointer<LDKNetworkGraph>) in
			DefaultRouter_new(networkGraphPointer, logger.activate().cType!, randomSeedBytesPrimitiveWrapper.cType!, scorer.activate().cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = DefaultRouter(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Constructs a new Router which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned Router must be freed before this_arg is
					public func asRouter() -> Router {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKDefaultRouter>) in
			DefaultRouter_as_Router(thisArgPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = NativelyImplementedRouter(cType: nativeCallResult, anchor: self)

						return returnValue
					}
		

					
					/// Indicates that this is the only struct which contains the same pointer.
					/// Rust functions which take ownership of an object provided via an argument require
					/// this to be true and invalidate the object pointed to by inner.
					public func isOwned() -> Bool {
						// return value (do some wrapping)
						let returnValue = self.cType!.is_owned

						return returnValue;
					}
		

					internal func dangle() -> DefaultRouter {
						self.dangling = true
						return self
					}

					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing DefaultRouter \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing DefaultRouter \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		