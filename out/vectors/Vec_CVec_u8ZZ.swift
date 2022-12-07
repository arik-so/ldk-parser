
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			internal typealias Vec_CVec_u8ZZ = Bindings.Vec_CVec_u8ZZ

			extension Bindings {

				/// A dynamically-allocated array of crate::c_types::derived::CVec_u8Zs of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_CVec_u8ZZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_CVec_u8ZZ?

					public init(pointer: LDKCVec_CVec_u8ZZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKCVec_CVec_u8ZZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(array: [[UInt8]]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						let rustArray = array.map { (currentValueDepth1) in
							currentValueDepth1.map { (currentValueDepth2) in
								currentValueDepth2.danglingClone().cType!
							}
						}

						
						var lowerDimension = [LDKCVec_u8Z]()
						for currentEntry in rustArray {
							let convertedEntry = Vec_u8Z(array: currentEntry)
							lowerDimension.append(convertedEntry.cType!)
							self.addAnchor(anchor: convertedEntry)
						}
			

						let dataContainer = UnsafeMutablePointer<LDKCVec_u8Z>.allocate(capacity: array.count)
						dataContainer.initialize(from: lowerDimension, count: array.count)

        				let vector = LDKCVec_CVec_u8ZZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector

						super.init(conflictAvoidingVariableName: 0)
					}

					public func getValue() -> [[UInt8]] {

						var array = [[UInt8]]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							
							var convertedEntry1 = [UInt8]()

							
							for index2 in 0..<Int(currentEntry1.datalen) {
								let currentEntry2 = currentEntry1.data[index2]
								convertedEntry1.append(currentEntry2)
							}
		

							array.append(convertedEntry1)
			
						}
		

						let swiftArray = array.map { (currentCType) in
							currentCType.map { (currentCType) in
								currentCType
							}
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_CVec_u8ZZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					internal func dangle() -> Vec_CVec_u8ZZ {
        				self.dangling = true
						return self
					}

					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Vec_CVec_u8ZZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Vec_CVec_u8ZZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		