
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_NetAddressDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::msgs::NetAddress on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_NetAddressDecodeErrorZ = Bindings.Result_NetAddressDecodeErrorZ

			extension Bindings {

				/// A CResult_NetAddressDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::msgs::NetAddress on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_NetAddressDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_NetAddressDecodeErrorZ?

					public init(cType: LDKCResult_NetAddressDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_NetAddressDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_NetAddressDecodeErrorZ in the success state.
					public class func initWithOk(o: NetAddress) -> Result_NetAddressDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NetAddressDecodeErrorZ_ok(o.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_NetAddressDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_NetAddressDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_NetAddressDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NetAddressDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_NetAddressDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_NetAddressDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NetAddressDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_NetAddressDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_NetAddressDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_NetAddressDecodeErrorZ>) in
				CResult_NetAddressDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_NetAddressDecodeErrorZ(cType: nativeCallResult)
						

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
					

					
					public func getValue() -> NetAddress? {
						if self.cType?.result_ok == true {
							return NetAddress(cType: self.cType!.contents.result.pointee, anchor: self)
						}
						return nil
					}
					

					internal func dangle() -> Result_NetAddressDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		