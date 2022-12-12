
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_ShutdownDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::msgs::Shutdown on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_ShutdownDecodeErrorZ = Bindings.Result_ShutdownDecodeErrorZ

			extension Bindings {

				/// A CResult_ShutdownDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::msgs::Shutdown on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_ShutdownDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_ShutdownDecodeErrorZ?

					public init(cType: LDKCResult_ShutdownDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_ShutdownDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_ShutdownDecodeErrorZ in the success state.
					public class func initWithOk(o: Shutdown) -> Result_ShutdownDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ShutdownDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_ShutdownDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_ShutdownDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_ShutdownDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ShutdownDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_ShutdownDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_ShutdownDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ShutdownDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_ShutdownDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_ShutdownDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_ShutdownDecodeErrorZ>) in
				CResult_ShutdownDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_ShutdownDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> DecodeError? {
						if self.cType?.result_ok == false {
							return DecodeError(cType: self.cType!.contents.err.pointee, anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> Shutdown? {
						if self.cType?.result_ok == true {
							return Shutdown(cType: self.cType!.contents.result.pointee, anchor: self)
						}
						return nil
					}
					

					internal func dangle() -> Result_ShutdownDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		