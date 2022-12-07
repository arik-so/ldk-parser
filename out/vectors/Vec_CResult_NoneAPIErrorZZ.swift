
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			internal typealias Vec_CResult_NoneAPIErrorZZ = Bindings.Vec_CResult_NoneAPIErrorZZ

			extension Bindings {

				/// A dynamically-allocated array of crate::c_types::derived::CResult_NoneAPIErrorZs of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_CResult_NoneAPIErrorZZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_CResult_NoneAPIErrorZZ?

					public init(pointer: LDKCVec_CResult_NoneAPIErrorZZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKCVec_CResult_NoneAPIErrorZZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(array: [Result_NoneAPIErrorZ]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						let rustArray = array.map { (currentValueDepth1) in
							currentValueDepth1.danglingClone().cType!
						}

						

						let dataContainer = UnsafeMutablePointernull.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_CResult_NoneAPIErrorZZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector

						super.init(conflictAvoidingVariableName: 0)
					}

					public func getValue() -> [Result_NoneAPIErrorZ] {

						var array = [LDKCResult_NoneAPIErrorZ]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType) in
							Result_NoneAPIErrorZ(pointer: currentCType)
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_CResult_NoneAPIErrorZZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					internal func dangle() -> Vec_CResult_NoneAPIErrorZZ {
        				self.dangling = true
						return self
					}

					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Vec_CResult_NoneAPIErrorZZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Vec_CResult_NoneAPIErrorZZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		