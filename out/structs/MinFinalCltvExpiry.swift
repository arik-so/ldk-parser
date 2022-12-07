
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias MinFinalCltvExpiry = Bindings.MinFinalCltvExpiry

			extension Bindings {
		

				/// `min_final_cltv_expiry` to use for the last HTLC in the route
				public class MinFinalCltvExpiry: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKMinFinalCltvExpiry?

					public init(cType: LDKMinFinalCltvExpiry) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKMinFinalCltvExpiry, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the MinFinalCltvExpiry, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MinFinalCltvExpiry_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// 
					public func getA() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
			MinFinalCltvExpiry_get_a(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// 
					public func setA(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKMinFinalCltvExpiry>) in
			MinFinalCltvExpiry_set_a(thisPtrPointer, val)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Constructs a new MinFinalCltvExpiry given each field
					public init(aArg: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MinFinalCltvExpiry_new(aArg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = MinFinalCltvExpiry(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a copy of the MinFinalCltvExpiry
					internal func clone() -> MinFinalCltvExpiry {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
			MinFinalCltvExpiry_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = MinFinalCltvExpiry(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two MinFinalCltvExpirys contain equal inner contents.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
			MinFinalCltvExpiry_hash(oPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Checks if two MinFinalCltvExpirys contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
			MinFinalCltvExpiry_eq(aPointer, bPointer)
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
		

					internal func dangle() -> MinFinalCltvExpiry {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> MinFinalCltvExpiry {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing MinFinalCltvExpiry \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing MinFinalCltvExpiry \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		