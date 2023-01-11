
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation // necessary for Data for Strings

			/// A serialized witness.
			internal typealias Witness = Bindings.Witness

			extension Bindings {

				/// A serialized witness.
				internal class Witness: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKWitness?

					internal init(cType: LDKWitness) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.data_is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKWitness, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.data_is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(value: [UInt8]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						
						let dataContainer = UnsafeMutablePointer<UInt8>.allocate(capacity: value.count)
						dataContainer.initialize(from: value, count: value.count)
						self.cType = LDKWitness(data: dataContainer, datalen: UInt(value.count), data_is_owned: true)
				
							self.initialCFreeability = self.cType!.data_is_owned
			

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Frees the data pointed to by data
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Witness_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					public func getValue() -> [UInt8] {
						
						var array = [UInt8]()
						for index in 0..<Int(self.cType!.datalen) {
							let currentEntry = self.cType!.data[index]
							array.append(currentEntry)
						}
						return array
				
					}

					internal func dangle(_ shouldDangle: Bool = true) -> Witness {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func setCFreeability(freeable: Bool) -> Witness {
						self.cType!.data_is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> Witness {
						self.dangling = self.cType!.data_is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Witness \(self.instanceNumber).")
							
							if !self.initialCFreeability {
								// only set to freeable if it was originally false
								// Bindings.print("Setting Witness \(self.instanceNumber)'s data_is_owned: \(self.cType!.data_is_owned) -> true")
								// self.cType!.data_is_owned = true
							}
					
							self.free()
						} else {
							Bindings.print("Not freeing Witness \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		