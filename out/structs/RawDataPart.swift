
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias RawDataPart = Bindings.RawDataPart

			extension Bindings {
		

				/// Data of the `RawInvoice` that is encoded in the data part
				public class RawDataPart: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKRawDataPart?

					public init(cType: LDKRawDataPart) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKRawDataPart, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the RawDataPart, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = RawDataPart_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// generation time of the invoice
					public func getTimestamp() -> PositiveTimestamp {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRawDataPart>) in
			RawDataPart_get_timestamp(thisPtrPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PositiveTimestamp(cType: nativeCallResult)

						return returnValue
					}
		
					/// generation time of the invoice
					public func setTimestamp(val: PositiveTimestamp) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRawDataPart>) in
			RawDataPart_set_timestamp(thisPtrPointer, val.cType!)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Checks if two RawDataParts contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKRawDataPart>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKRawDataPart>) in
			RawDataPart_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a copy of the RawDataPart
					internal func clone() -> RawDataPart {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKRawDataPart>) in
			RawDataPart_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = RawDataPart(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two RawDataParts contain equal inner contents.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKRawDataPart>) in
			RawDataPart_hash(oPointer)
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
		

					internal func dangle() -> RawDataPart {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> RawDataPart {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing RawDataPart \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing RawDataPart \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		