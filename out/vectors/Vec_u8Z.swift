
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A dynamically-allocated array of u8s of arbitrary size.
			/// This corresponds to std::vector in C++
			internal typealias Vec_u8Z = Bindings.Vec_u8Z

			extension Bindings {

				/// A dynamically-allocated array of u8s of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_u8Z: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_u8Z?

					internal init(cType: LDKCVec_u8Z) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCVec_u8Z, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(array: [UInt8]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						

						

						let dataContainer = UnsafeMutablePointer<UInt8>.allocate(capacity: array.count)
						dataContainer.initialize(from: array, count: array.count)

        				let vector = LDKCVec_u8Z(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> [UInt8] {

						var array = [UInt8]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_u8Z_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Vec_u8Z {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Vec_u8Z \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Vec_u8Z \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		