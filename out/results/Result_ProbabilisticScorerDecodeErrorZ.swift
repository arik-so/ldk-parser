
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Result_ProbabilisticScorerDecodeErrorZ = Bindings.Result_ProbabilisticScorerDecodeErrorZ

			extension Bindings {

				/// A CResult_ProbabilisticScorerDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::routing::scoring::ProbabilisticScorer on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_ProbabilisticScorerDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_ProbabilisticScorerDecodeErrorZ?

					public init(pointer: LDKCResult_ProbabilisticScorerDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKCResult_ProbabilisticScorerDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_ProbabilisticScorerDecodeErrorZ in the success state.
					public init(o: ProbabilisticScorer) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ProbabilisticScorerDecodeErrorZ_ok(o.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_ProbabilisticScorerDecodeErrorZ(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Creates a new CResult_ProbabilisticScorerDecodeErrorZ in the error state.
					public init(e: DecodeError) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ProbabilisticScorerDecodeErrorZ_err(e.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_ProbabilisticScorerDecodeErrorZ(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the CResult_ProbabilisticScorerDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ProbabilisticScorerDecodeErrorZ_free(self.cType!)

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
							return DecodeError(pointer: self.cType!.contents.err.pointee)
						}
						return nil
					}

					public func getValue() -> ProbabilisticScorer? {
						if self.cType?.result_ok == true {
							return ProbabilisticScorer(pointer: self.cType!.contents.result.pointee)
						}
						return nil
					}

					internal func dangle() -> Result_ProbabilisticScorerDecodeErrorZ {
        				self.dangling = true
						return self
					}

										

				}

			}
		