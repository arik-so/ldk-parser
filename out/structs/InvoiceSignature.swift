
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Recoverable signature
			public typealias InvoiceSignature = Bindings.InvoiceSignature

			extension Bindings {
		

				/// Recoverable signature
				public class InvoiceSignature: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKInvoiceSignature?

					public init(cType: LDKInvoiceSignature) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKInvoiceSignature, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the InvoiceSignature, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = InvoiceSignature_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a copy of the InvoiceSignature
					internal func clone() -> InvoiceSignature {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKInvoiceSignature>) in
				InvoiceSignature_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = InvoiceSignature(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two InvoiceSignatures contain equal inner contents.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKInvoiceSignature>) in
				InvoiceSignature_hash(oPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Checks if two InvoiceSignatures contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKInvoiceSignature>) in
				
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKInvoiceSignature>) in
				InvoiceSignature_eq(aPointer, bPointer)
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
		

					internal func dangle() -> InvoiceSignature {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> InvoiceSignature {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing InvoiceSignature \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing InvoiceSignature \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		