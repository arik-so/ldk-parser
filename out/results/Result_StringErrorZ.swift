
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_StringErrorZ represents the result of a fallible operation,
			/// containing a crate::c_types::Str on success and a crate::c_types::Secp256k1Error on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_StringErrorZ = Bindings.Result_StringErrorZ

			extension Bindings {

				/// A CResult_StringErrorZ represents the result of a fallible operation,
				/// containing a crate::c_types::Str on success and a crate::c_types::Secp256k1Error on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_StringErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_StringErrorZ?

					public init(cType: LDKCResult_StringErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_StringErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_StringErrorZ in the success state.
					public class func initWithOk(o: String) -> Result_StringErrorZ {
						// native call variable prep
						
						let oPrimitiveWrapper = Str(value: o).dangle()
				
						oPrimitiveWrapper.cType!.chars_is_owned = false
					

						// native method call
						let nativeCallResult = CResult_StringErrorZ_ok(oPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						oPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_StringErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_StringErrorZ in the error state.
					public class func initWithErr(e: Secp256k1Error) -> Result_StringErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_StringErrorZ_err(e.getCValue())

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_StringErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_StringErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_StringErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_StringErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_StringErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_StringErrorZ>) in
				CResult_StringErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_StringErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> Secp256k1Error? {
						if self.cType?.result_ok == false {
							return Secp256k1Error(value: self.cType!.contents.err.pointee)
						}
						return nil
					}
					

					
					public func getValue() -> String? {
						if self.cType?.result_ok == true {
							return Str(cType: self.cType!.contents.result.pointee).dangle().getValue()
						}
						return nil
					}
					

					internal func dangle() -> Result_StringErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		