
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_PingDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::msgs::Ping on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_PingDecodeErrorZ = Bindings.Result_PingDecodeErrorZ

			extension Bindings {

				/// A CResult_PingDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::msgs::Ping on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_PingDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_PingDecodeErrorZ?

					public init(cType: LDKCResult_PingDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_PingDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_PingDecodeErrorZ in the success state.
					public class func initWithOk(o: Ping) -> Result_PingDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PingDecodeErrorZ_ok(o.clone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PingDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_PingDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_PingDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PingDecodeErrorZ_err(e.clone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PingDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_PingDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PingDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_PingDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_PingDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_PingDecodeErrorZ>) in
				CResult_PingDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PingDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> DecodeError? {
						if self.cType?.result_ok == false {
							return DecodeError(cType: self.cType!.contents.err.pointee, anchor: self).dangle()
						}
						return nil
					}
					

					
					public func getValue() -> Ping? {
						if self.cType?.result_ok == true {
							return Ping(cType: self.cType!.contents.result.pointee, anchor: self).dangle()
						}
						return nil
					}
					

					internal func dangle() -> Result_PingDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		