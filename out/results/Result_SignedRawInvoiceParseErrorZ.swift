
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_SignedRawInvoiceParseErrorZ = Bindings.Result_SignedRawInvoiceParseErrorZ

			extension Bindings {

				/// A CResult_SignedRawInvoiceParseErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning_invoice::SignedRawInvoice on success and a crate::lightning_invoice::ParseError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_SignedRawInvoiceParseErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_SignedRawInvoiceParseErrorZ?

					public init(cType: LDKCResult_SignedRawInvoiceParseErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_SignedRawInvoiceParseErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_SignedRawInvoiceParseErrorZ in the success state.
					public init(o: SignedRawInvoice) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_SignedRawInvoiceParseErrorZ_ok(o.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_SignedRawInvoiceParseErrorZ(cType: nativeCallResult)

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a new CResult_SignedRawInvoiceParseErrorZ in the error state.
					public init(e: ParseError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_SignedRawInvoiceParseErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_SignedRawInvoiceParseErrorZ(cType: nativeCallResult)

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Frees any resources used by the CResult_SignedRawInvoiceParseErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_SignedRawInvoiceParseErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_SignedRawInvoiceParseErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_SignedRawInvoiceParseErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_SignedRawInvoiceParseErrorZ>) in
				CResult_SignedRawInvoiceParseErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_SignedRawInvoiceParseErrorZ(cType: nativeCallResult)

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> ParseError? {
						if self.cType?.result_ok == false {
							return ParseError(cType: self.cType!.contents.err.pointee)
						}
						return nil
					}
					

					
					public func getValue() -> SignedRawInvoice? {
						if self.cType?.result_ok == true {
							return SignedRawInvoice(cType: self.cType!.contents.result.pointee)
						}
						return nil
					}
					

					internal func dangle() -> Result_SignedRawInvoiceParseErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		