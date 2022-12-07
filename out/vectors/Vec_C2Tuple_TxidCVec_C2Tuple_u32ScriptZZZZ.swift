
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			internal typealias Vec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ = Bindings.Vec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ

			extension Bindings {

				/// A dynamically-allocated array of crate::c_types::derived::C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZs of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ?

					public init(cType: LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(array: [([UInt8], [(UInt32, [UInt8])])]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						let rustArray = array.map { (currentValueDepth1) in

				
						let currentValueDepth1Tuple = Tuple_TxidCVec_C2Tuple_u32ScriptZZZ(tuple: currentValueDepth1)
				
				return currentValueDepth1Tuple.cType!
			
						}

						

						let dataContainer = UnsafeMutablePointer<LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ>.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector

						super.init(conflictAvoidingVariableName: 0)
					}

					public func getValue() -> [([UInt8], [(UInt32, [UInt8])])] {

						var array = [LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType) in
							Tuple_TxidCVec_C2Tuple_u32ScriptZZZ(cType: currentCType).getValue()
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					internal func dangle() -> Vec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ {
        				self.dangling = true
						return self
					}

					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Vec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Vec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		