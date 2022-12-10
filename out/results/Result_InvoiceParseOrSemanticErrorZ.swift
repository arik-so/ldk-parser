
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_InvoiceParseOrSemanticErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning_invoice::Invoice on success and a crate::lightning_invoice::ParseOrSemanticError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_InvoiceParseOrSemanticErrorZ = Bindings.Result_InvoiceParseOrSemanticErrorZ

			extension Bindings {

				/// A CResult_InvoiceParseOrSemanticErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning_invoice::Invoice on success and a crate::lightning_invoice::ParseOrSemanticError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_InvoiceParseOrSemanticErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_InvoiceParseOrSemanticErrorZ?

					public init(cType: LDKCResult_InvoiceParseOrSemanticErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_InvoiceParseOrSemanticErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_InvoiceParseOrSemanticErrorZ in the success state.
					public class func initWithOk(o: Invoice) -> Result_InvoiceParseOrSemanticErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_InvoiceParseOrSemanticErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_InvoiceParseOrSemanticErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_InvoiceParseOrSemanticErrorZ in the error state.
					public class func initWithErr(e: ParseOrSemanticError) -> Result_InvoiceParseOrSemanticErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_InvoiceParseOrSemanticErrorZ_err(e.clone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_InvoiceParseOrSemanticErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_InvoiceParseOrSemanticErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_InvoiceParseOrSemanticErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_InvoiceParseOrSemanticErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_InvoiceParseOrSemanticErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_InvoiceParseOrSemanticErrorZ>) in
				CResult_InvoiceParseOrSemanticErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_InvoiceParseOrSemanticErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> ParseOrSemanticError? {
						if self.cType?.result_ok == false {
							return ParseOrSemanticError(cType: self.cType!.contents.err.pointee, anchor: self).dangle()
						}
						return nil
					}
					

					
					public func getValue() -> Invoice? {
						if self.cType?.result_ok == true {
							return Invoice(cType: self.cType!.contents.result.pointee, anchor: self).dangle()
						}
						return nil
					}
					

					internal func dangle() -> Result_InvoiceParseOrSemanticErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		