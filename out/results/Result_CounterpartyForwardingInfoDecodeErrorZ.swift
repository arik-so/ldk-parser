
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_CounterpartyForwardingInfoDecodeErrorZ = Bindings.Result_CounterpartyForwardingInfoDecodeErrorZ

			extension Bindings {

				/// A CResult_CounterpartyForwardingInfoDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::channelmanager::CounterpartyForwardingInfo on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_CounterpartyForwardingInfoDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_CounterpartyForwardingInfoDecodeErrorZ?

					public init(cType: LDKCResult_CounterpartyForwardingInfoDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_CounterpartyForwardingInfoDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_CounterpartyForwardingInfoDecodeErrorZ in the success state.
					public init(o: CounterpartyForwardingInfo) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_CounterpartyForwardingInfoDecodeErrorZ_ok(o.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_CounterpartyForwardingInfoDecodeErrorZ(cType: nativeCallResult)

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a new CResult_CounterpartyForwardingInfoDecodeErrorZ in the error state.
					public init(e: DecodeError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_CounterpartyForwardingInfoDecodeErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_CounterpartyForwardingInfoDecodeErrorZ(cType: nativeCallResult)

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Frees any resources used by the CResult_CounterpartyForwardingInfoDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_CounterpartyForwardingInfoDecodeErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new CResult_CounterpartyForwardingInfoDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_CounterpartyForwardingInfoDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_CounterpartyForwardingInfoDecodeErrorZ>) in
				CResult_CounterpartyForwardingInfoDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_CounterpartyForwardingInfoDecodeErrorZ(cType: nativeCallResult)

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> DecodeError? {
						if self.cType?.result_ok == false {
							return DecodeError(cType: self.cType!.contents.err.pointee)
						}
						return nil
					}
					

					
					public func getValue() -> CounterpartyForwardingInfo? {
						if self.cType?.result_ok == true {
							return CounterpartyForwardingInfo(cType: self.cType!.contents.result.pointee)
						}
						return nil
					}
					

					internal func dangle() -> Result_CounterpartyForwardingInfoDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		