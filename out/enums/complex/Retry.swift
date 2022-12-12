
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias Retry = Bindings.Retry

			extension Bindings {

				/// Strategies available to retry payment path failures for an [`Invoice`].
				public class Retry: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKRetry?

					public init(cType: LDKRetry) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKRetry, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum RetryType {
						
						/// Max number of attempts to retry payment.
						/// 
						/// Note that this is the number of *path* failures, not full payment retries. For multi-path
						/// payments, if this is less than the total number of paths, we will never even retry all of the
						/// payment's paths.
						case Attempts
			
						/// Time elapsed before abandoning retries for a payment.
						case Timeout
			
					}

					public func getValueType() -> RetryType {
						switch self.cType!.tag {
							case LDKRetry_Attempts:
								return .Attempts
			
							case LDKRetry_Timeout:
								return .Timeout
			
							default:
								Bindings.print("Error: Invalid value type for Retry! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the Retry
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Retry_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the Retry
					internal func clone() -> Retry {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKRetry>) in
				Retry_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Retry(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new Attempts-variant Retry
					public class func initWithAttempts(a: UInt) -> Retry {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Retry_attempts(a)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Retry(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new Timeout-variant Retry
					public class func initWithTimeout(a: UInt64) -> Retry {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Retry_timeout(a)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Retry(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two Retrys contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKRetry>) in
				
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKRetry>) in
				Retry_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if two Retrys contain equal inner contents.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKRetry>) in
				Retry_hash(oPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					
					public func getValueAsAttempts() -> UInt? {
						if self.cType?.tag != LDKRetry_Attempts {
							return nil
						}

						return self.cType!.attempts
					}
			
					public func getValueAsTimeout() -> UInt64? {
						if self.cType?.tag != LDKRetry_Timeout {
							return nil
						}

						return self.cType!.timeout
					}
			

					internal func dangle() -> Retry {
        				self.dangling = true
						return self
					}

					
					internal func danglingClone() -> Retry {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Retry \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Retry \(self.instanceNumber) due to dangle.")
						}
					}
			

					

				}

			}
		