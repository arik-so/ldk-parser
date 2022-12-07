
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ = Bindings.Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ

			extension Bindings {

				/// A CResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::c_types::derived::C2Tuple_BlockHashChannelManagerZ on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ?

					public init(cType: LDKCResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ in the success state.
					public init(o: ([UInt8], ChannelManager)) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ_ok(o.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a new CResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ in the error state.
					public init(e: DecodeError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ(cType: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the CResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

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

					public func getValue() -> ([UInt8], ChannelManager)? {
						if self.cType?.result_ok == true {
							return Tuple_BlockHashChannelManagerZ(cType: self.cType!.contents.result.pointee).getValue()
						}
						return nil
					}

					internal func dangle() -> Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		