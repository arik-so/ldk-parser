
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_PublicKeyErrorZ represents the result of a fallible operation,
			/// containing a crate::c_types::PublicKey on success and a crate::c_types::Secp256k1Error on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_PublicKeyErrorZ = Bindings.Result_PublicKeyErrorZ

			extension Bindings {

				/// A CResult_PublicKeyErrorZ represents the result of a fallible operation,
				/// containing a crate::c_types::PublicKey on success and a crate::c_types::Secp256k1Error on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_PublicKeyErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_PublicKeyErrorZ?

					public init(cType: LDKCResult_PublicKeyErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_PublicKeyErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_PublicKeyErrorZ in the success state.
					public class func initWithOk(o: [UInt8]) -> Result_PublicKeyErrorZ {
						// native call variable prep
						
						let oPrimitiveWrapper = PublicKey(value: o)
				

						// native method call
						let nativeCallResult = CResult_PublicKeyErrorZ_ok(oPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						oPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_PublicKeyErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_PublicKeyErrorZ in the error state.
					public class func initWithErr(e: Secp256k1Error) -> Result_PublicKeyErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PublicKeyErrorZ_err(e.getCValue())

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PublicKeyErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_PublicKeyErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PublicKeyErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_PublicKeyErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_PublicKeyErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_PublicKeyErrorZ>) in
				CResult_PublicKeyErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PublicKeyErrorZ(cType: nativeCallResult)
						

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
							return PublicKey(cType: self.cType!.contents.result.pointee).dangle().dangle().getValue()
						}
						return nil
					}
					

					internal func dangle() -> Result_PublicKeyErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		