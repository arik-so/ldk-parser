
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_SiPrefixParseErrorZ = Bindings.Result_SiPrefixParseErrorZ

			extension Bindings {

				/// A CResult_SiPrefixParseErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning_invoice::SiPrefix on success and a crate::lightning_invoice::ParseError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_SiPrefixParseErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_SiPrefixParseErrorZ?

					public init(pointer: LDKCResult_SiPrefixParseErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKCResult_SiPrefixParseErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_SiPrefixParseErrorZ in the success state.
					public init(o: SiPrefix) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_SiPrefixParseErrorZ_ok(o.getCValue())

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_SiPrefixParseErrorZ(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a new CResult_SiPrefixParseErrorZ in the error state.
					public init(e: ParseError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_SiPrefixParseErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_SiPrefixParseErrorZ(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the CResult_SiPrefixParseErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_SiPrefixParseErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_SiPrefixParseErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_SiPrefixParseErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_SiPrefixParseErrorZ>) in
			CResult_SiPrefixParseErrorZ_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_SiPrefixParseErrorZ(pointer: nativeCallResult)

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					public func getError() -> ParseError? {
						if self.cType?.result_ok == false {
							return ParseError(pointer: self.cType!.contents.err.pointee)
						}
						return nil
					}

					public func getValue() -> SiPrefix? {
						if self.cType?.result_ok == true {
							return SiPrefix(value: self.cType!.contents.result.pointee)
						}
						return nil
					}

					internal func dangle() -> Result_SiPrefixParseErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		