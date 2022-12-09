
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A simple future which can complete once, and calls some callback(s) when it does so.
			public typealias Future = Bindings.Future

			extension Bindings {
		

				/// A simple future which can complete once, and calls some callback(s) when it does so.
				public class Future: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKFuture?

					public init(cType: LDKFuture) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKFuture, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the Future, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Future_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Registers a callback to be called upon completion of this future. If the future has already
					/// completed, the callback will be called immediately.
					public func registerCallbackFn(callback: FutureCallback) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKFuture>) in
				Future_register_callback_fn(thisArgPointer, callback.activate().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

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
		

					internal func dangle() -> Future {
						self.dangling = true
						return self
					}

					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Future \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Future \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		