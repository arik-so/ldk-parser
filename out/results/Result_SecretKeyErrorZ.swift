
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_SecretKeyErrorZ represents the result of a fallible operation,
			/// containing a crate::c_types::SecretKey on success and a crate::c_types::Secp256k1Error on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_SecretKeyErrorZ = Bindings.Result_SecretKeyErrorZ

			extension Bindings {

				/// A CResult_SecretKeyErrorZ represents the result of a fallible operation,
				/// containing a crate::c_types::SecretKey on success and a crate::c_types::Secp256k1Error on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_SecretKeyErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_SecretKeyErrorZ?

					public init(cType: LDKCResult_SecretKeyErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_SecretKeyErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_SecretKeyErrorZ in the success state.
					public class func initWithOk(o: [UInt8]) -> Result_SecretKeyErrorZ {
						// native call variable prep
						
						let oPrimitiveWrapper = SecretKey(value: o)
				

						// native method call
						let nativeCallResult = CResult_SecretKeyErrorZ_ok(oPrimitiveWrapper.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_SecretKeyErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_SecretKeyErrorZ in the error state.
					public class func initWithErr(e: Secp256k1Error) -> Result_SecretKeyErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_SecretKeyErrorZ_err(e.getCValue())

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_SecretKeyErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_SecretKeyErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_SecretKeyErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_SecretKeyErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_SecretKeyErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_SecretKeyErrorZ>) in
				CResult_SecretKeyErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_SecretKeyErrorZ(cType: nativeCallResult)
						

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
					

					
					public func getValue() -> [UInt8]? {
						if self.cType?.result_ok == true {
							return SecretKey(cType: self.cType!.contents.result.pointee).dangle().getValue()
						}
						return nil
					}
					

					internal func dangle() -> Result_SecretKeyErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		