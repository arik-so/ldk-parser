
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Description = Bindings.Description

			extension Bindings {
		

				/// Description string
				/// 
				/// # Invariants
				/// The description can be at most 639 __bytes__ long
				public class Description: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKDescription?

					public init(cType: LDKDescription) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKDescription, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the Description, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Description_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a copy of the Description
					internal func clone() -> Description {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKDescription>) in
			Description_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Description(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two Descriptions contain equal inner contents.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKDescription>) in
			Description_hash(oPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Checks if two Descriptions contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKDescription>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKDescription>) in
			Description_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new `Description` if `description` is at most 1023 __bytes__ long,
					/// returns `CreationError::DescriptionTooLong` otherwise
					/// 
					/// Please note that single characters may use more than one byte due to UTF8 encoding.
					public class func new(description: String) -> Result_DescriptionCreationErrorZ {
						// native call variable prep
						
						let descriptionPrimitiveWrapper = Str(value: description)
				

						// native method call
						let nativeCallResult = Description_new(descriptionPrimitiveWrapper.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_DescriptionCreationErrorZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Returns the underlying description `String`
					public func intoInner() -> String {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Description_into_inner(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Str(cType: nativeCallResult)

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
		

					internal func dangle() -> Description {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> Description {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Description \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Description \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		