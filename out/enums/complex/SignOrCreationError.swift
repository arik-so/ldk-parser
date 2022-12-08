
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias SignOrCreationError = Bindings.SignOrCreationError

			extension Bindings {

				/// When signing using a fallible method either an user-supplied `SignError` or a `CreationError`
				/// may occur.
				public class SignOrCreationError: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKSignOrCreationError?

					public init(cType: LDKSignOrCreationError) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKSignOrCreationError, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum SignOrCreationErrorType {
						
						/// An error occurred during signing
						case SignError
			
						/// An error occurred while building the transaction
						case CreationError
			
					}

					public func getValueType() -> SignOrCreationErrorType? {
						switch self.cType!.tag {
							case LDKSignOrCreationError_SignError:
								return .SignError
			
							case LDKSignOrCreationError_CreationError:
								return .CreationError
			
							default:
								return nil
						}
		
					}

					
					/// Frees any resources used by the SignOrCreationError
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = SignOrCreationError_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a copy of the SignOrCreationError
					internal func clone() -> SignOrCreationError {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKSignOrCreationError>) in
				SignOrCreationError_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = SignOrCreationError(cType: nativeCallResult)

						return returnValue
					}
		
					/// Utility method to constructs a new SignError-variant SignOrCreationError
					public init() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = SignOrCreationError_sign_error()

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = SignOrCreationError(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new CreationError-variant SignOrCreationError
					public init(a: CreationError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = SignOrCreationError_creation_error(a.getCValue())

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = SignOrCreationError(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Checks if two SignOrCreationErrors contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKSignOrCreationError>) in
				
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKSignOrCreationError>) in
				SignOrCreationError_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Get the string representation of a SignOrCreationError object
					public func toStr() -> String {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKSignOrCreationError>) in
				SignOrCreationError_to_str(oPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Str(cType: nativeCallResult).getValue()

						return returnValue
					}
		

					
					public func getValueAsCreationError() -> CreationError? {
						if self.cType?.tag != LDKSignOrCreationError_CreationError {
							return nil
						}

						return CreationError(value: self.cType!.creation_error)
					}
			

					internal func dangle() -> SignOrCreationError {
        				self.dangling = true
						return self
					}

					
					internal func danglingClone() -> SignOrCreationError {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing SignOrCreationError \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing SignOrCreationError \(self.instanceNumber) due to dangle.")
						}
					}
			

					

				}

			}
		