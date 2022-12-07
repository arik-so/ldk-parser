
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			internal typealias Vec_C2Tuple_u32ScriptZZ = Bindings.Vec_C2Tuple_u32ScriptZZ

			extension Bindings {

				/// A dynamically-allocated array of crate::c_types::derived::C2Tuple_u32ScriptZs of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_C2Tuple_u32ScriptZZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_C2Tuple_u32ScriptZZ?

					public init(cType: LDKCVec_C2Tuple_u32ScriptZZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCVec_C2Tuple_u32ScriptZZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(array: [(UInt32, [UInt8])]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						let rustArray = array.map { (currentValueDepth1) in
							currentValueDepth1.danglingClone().cType!
						}

						

						let dataContainer = UnsafeMutablePointernull.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_C2Tuple_u32ScriptZZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector

						super.init(conflictAvoidingVariableName: 0)
					}

					public func getValue() -> [(UInt32, [UInt8])] {

						var array = [LDKC2Tuple_u32ScriptZ]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType) in
							Tuple_u32ScriptZ(cType: currentCType).getValue()
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_C2Tuple_u32ScriptZZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					internal func dangle() -> Vec_C2Tuple_u32ScriptZZ {
        				self.dangling = true
						return self
					}

					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Vec_C2Tuple_u32ScriptZZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Vec_C2Tuple_u32ScriptZZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		