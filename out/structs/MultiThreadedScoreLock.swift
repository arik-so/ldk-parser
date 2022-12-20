
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A locked `MultiThreadedLockableScore`.
			public typealias MultiThreadedScoreLock = Bindings.MultiThreadedScoreLock

			extension Bindings {
		

				/// A locked `MultiThreadedLockableScore`.
				public class MultiThreadedScoreLock: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKMultiThreadedScoreLock?

					internal init(cType: LDKMultiThreadedScoreLock) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKMultiThreadedScoreLock, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the MultiThreadedScoreLock, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MultiThreadedScoreLock_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new Score which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned Score must be freed before this_arg is
					public func asScore() -> Score {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKMultiThreadedScoreLock>) in
				MultiThreadedScoreLock_as_Score(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedScore(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Serialize the MultiThreadedScoreLock object into a byte array which can be read by MultiThreadedScoreLock_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKMultiThreadedScoreLock>) in
				MultiThreadedScoreLock_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> MultiThreadedScoreLock {
						self.dangling = shouldDangle
						return self
					}

					
					internal func setCFreeability(freeable: Bool) -> MultiThreadedScoreLock {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> MultiThreadedScoreLock {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing MultiThreadedScoreLock \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing MultiThreadedScoreLock \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		