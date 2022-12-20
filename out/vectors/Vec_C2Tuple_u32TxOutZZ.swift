
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A dynamically-allocated array of crate::c_types::derived::C2Tuple_u32TxOutZs of arbitrary size.
			/// This corresponds to std::vector in C++
			internal typealias Vec_C2Tuple_u32TxOutZZ = Bindings.Vec_C2Tuple_u32TxOutZZ

			extension Bindings {

				/// A dynamically-allocated array of crate::c_types::derived::C2Tuple_u32TxOutZs of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_C2Tuple_u32TxOutZZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_C2Tuple_u32TxOutZZ?

					internal init(cType: LDKCVec_C2Tuple_u32TxOutZZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCVec_C2Tuple_u32TxOutZZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(array: [(UInt32, TxOut)]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						
						let rustArray = array.map { (currentValueDepth1: (UInt32, TxOut)) -> LDKC2Tuple_u32TxOutZ in
							
						let currentValueDepth1Tuple = Tuple_u32TxOutZ(tuple: currentValueDepth1).danglingClone()
				
							return currentValueDepth1Tuple.cType!
						}
				

						

						let dataContainer = UnsafeMutablePointer<LDKC2Tuple_u32TxOutZ>.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_C2Tuple_u32TxOutZZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> [(UInt32, TxOut)] {

						var array = [LDKC2Tuple_u32TxOutZ]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType: LDKC2Tuple_u32TxOutZ) -> (UInt32, TxOut) in
Tuple_u32TxOutZ(cType: currentCType).dangle().getValue()
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_C2Tuple_u32TxOutZZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Vec_C2Tuple_u32TxOutZZ {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Vec_C2Tuple_u32TxOutZZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Vec_C2Tuple_u32TxOutZZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		