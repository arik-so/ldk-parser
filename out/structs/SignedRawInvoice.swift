
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias SignedRawInvoice = Bindings.SignedRawInvoice

			extension Bindings {
		

				/// Represents a signed `RawInvoice` with cached hash. The signature is not checked and may be
				/// invalid.
				/// 
				/// # Invariants
				/// The hash has to be either from the deserialized invoice or from the serialized `raw_invoice`.
				public class SignedRawInvoice: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKSignedRawInvoice?

					public init(cType: LDKSignedRawInvoice) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKSignedRawInvoice, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the SignedRawInvoice, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = SignedRawInvoice_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Checks if two SignedRawInvoices contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKSignedRawInvoice>) in
			
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKSignedRawInvoice>) in
			SignedRawInvoice_eq(aPointer, bPointer)
						}
			
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a copy of the SignedRawInvoice
					internal func clone() -> SignedRawInvoice {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKSignedRawInvoice>) in
			SignedRawInvoice_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = SignedRawInvoice(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if two SignedRawInvoices contain equal inner contents.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKSignedRawInvoice>) in
			SignedRawInvoice_hash(oPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Disassembles the `SignedRawInvoice` into its three parts:
					/// 1. raw invoice
					/// 2. hash of the raw invoice
					/// 3. signature
					public func intoParts() -> (RawInvoice, [UInt8], InvoiceSignature) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = SignedRawInvoice_into_parts(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Tuple_RawInvoice_u832InvoiceSignatureZ(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// The `RawInvoice` which was signed.
					public func rawInvoice() -> RawInvoice {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKSignedRawInvoice>) in
			SignedRawInvoice_raw_invoice(thisArgPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = RawInvoice(cType: nativeCallResult)

						return returnValue
					}
		
					/// InvoiceSignature for the invoice.
					public func signature() -> InvoiceSignature {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKSignedRawInvoice>) in
			SignedRawInvoice_signature(thisArgPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = InvoiceSignature(cType: nativeCallResult)

						return returnValue
					}
		
					/// Recovers the public key used for signing the invoice from the recoverable signature.
					public func recoverPayeePubKey() -> Result_PayeePubKeyErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKSignedRawInvoice>) in
			SignedRawInvoice_recover_payee_pub_key(thisArgPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PayeePubKeyErrorZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Checks if the signature is valid for the included payee public key or if none exists if it's
					/// valid for the recovered signature (which should always be true?).
					public func checkSignature() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKSignedRawInvoice>) in
			SignedRawInvoice_check_signature(thisArgPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Read a SignedRawInvoice object from a string
					public class func fromStr(s: String) -> Result_SignedRawInvoiceParseErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = SignedRawInvoice_from_str(s.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_SignedRawInvoiceParseErrorZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Get the string representation of a SignedRawInvoice object
					public func toStr() -> String {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKSignedRawInvoice>) in
			SignedRawInvoice_to_str(oPointer)
						}
			

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
		

					internal func dangle() -> SignedRawInvoice {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> SignedRawInvoice {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing SignedRawInvoice \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing SignedRawInvoice \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		