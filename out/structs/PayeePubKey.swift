
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias PayeePubKey = Bindings.PayeePubKey

			extension Bindings {
		

				/// Payee public key
				public class PayeePubKey: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKPayeePubKey?

					public init(cType: LDKPayeePubKey) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKPayeePubKey, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the PayeePubKey, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PayeePubKey_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// 
					public func getA() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPayeePubKey>) in
			PayeePubKey_get_a(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult)

						return returnValue
					}
		
					/// 
					public func setA(val: [UInt8]) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKPayeePubKey>) in
			PayeePubKey_set_a(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new PayeePubKey given each field
					public init(aArg: [UInt8]) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PayeePubKey_new(aArg.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PayeePubKey(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a copy of the PayeePubKey
					internal func clone() -> PayeePubKey {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKPayeePubKey>) in
			PayeePubKey_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PayeePubKey(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two PayeePubKeys contain equal inner contents.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKPayeePubKey>) in
			PayeePubKey_hash(oPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Checks if two PayeePubKeys contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKPayeePubKey>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKPayeePubKey>) in
			PayeePubKey_eq(aPointer, bPointer)
						}
			
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
		

					internal func dangle() -> PayeePubKey {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> PayeePubKey {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing PayeePubKey \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing PayeePubKey \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		