
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A dynamically-allocated array of crate::c_types::derived::C2Tuple_usizeTransactionZs of arbitrary size.
			/// This corresponds to std::vector in C++
			internal typealias Vec_C2Tuple_usizeTransactionZZ = Bindings.Vec_C2Tuple_usizeTransactionZZ

			extension Bindings {

				/// A dynamically-allocated array of crate::c_types::derived::C2Tuple_usizeTransactionZs of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_C2Tuple_usizeTransactionZZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_C2Tuple_usizeTransactionZZ?

					public init(cType: LDKCVec_C2Tuple_usizeTransactionZZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCVec_C2Tuple_usizeTransactionZZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(array: [(UInt, [UInt8])]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						
						let rustArray = array.map { (currentValueDepth1) in
							
						let currentValueDepth1Tuple = Tuple_usizeTransactionZ(tuple: currentValueDepth1)
				
							return currentValueDepth1Tuple.cType!
						}
				

						

						let dataContainer = UnsafeMutablePointer<LDKC2Tuple_usizeTransactionZ>.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_C2Tuple_usizeTransactionZZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> [(UInt, [UInt8])] {

						var array = [LDKC2Tuple_usizeTransactionZ]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType) in
Tuple_usizeTransactionZ(cType: currentCType).getValue()
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_C2Tuple_usizeTransactionZZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					internal func dangle() -> Vec_C2Tuple_usizeTransactionZZ {
        				self.dangling = true
						return self
					}

					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Vec_C2Tuple_usizeTransactionZZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Vec_C2Tuple_usizeTransactionZZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		