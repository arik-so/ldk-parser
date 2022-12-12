
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_SignatureNoneZ represents the result of a fallible operation,
			/// containing a crate::c_types::Signature on success and a () on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_SignatureNoneZ = Bindings.Result_SignatureNoneZ

			extension Bindings {

				/// A CResult_SignatureNoneZ represents the result of a fallible operation,
				/// containing a crate::c_types::Signature on success and a () on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_SignatureNoneZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_SignatureNoneZ?

					public init(cType: LDKCResult_SignatureNoneZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_SignatureNoneZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_SignatureNoneZ in the success state.
					public class func initWithOk(o: [UInt8]) -> Result_SignatureNoneZ {
						// native call variable prep
						
						let oPrimitiveWrapper = Signature(value: o)
				

						// native method call
						let nativeCallResult = CResult_SignatureNoneZ_ok(oPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						oPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_SignatureNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_SignatureNoneZ in the error state.
					public class func initWithErr() -> Result_SignatureNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_SignatureNoneZ_err()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_SignatureNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_SignatureNoneZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_SignatureNoneZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_SignatureNoneZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_SignatureNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_SignatureNoneZ>) in
				CResult_SignatureNoneZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_SignatureNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					/*
					public func getError() -> Void? {
						if self.cType?.result_ok == false {
							return self.cType!.contents.err.pointee
						}
						return nil
					}
					*/

					
					public func getValue() -> [UInt8]? {
						if self.cType?.result_ok == true {
							return Signature(cType: self.cType!.contents.result.pointee, anchor: self).getValue()
						}
						return nil
					}
					

					internal func dangle() -> Result_SignatureNoneZ {
        				self.dangling = true
						return self
					}

					
					internal func danglingClone() -> Result_SignatureNoneZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_SignatureNoneZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_SignatureNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		