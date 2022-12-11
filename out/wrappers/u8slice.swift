
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation // necessary for Data for Strings

			/// A "slice" referencing some byte array. This is simply a length-tagged pointer which does not
			/// own the memory pointed to by data.
			internal typealias u8slice = Bindings.u8slice

			extension Bindings {

				/// A "slice" referencing some byte array. This is simply a length-tagged pointer which does not
				/// own the memory pointed to by data.
				internal class u8slice: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKu8slice?

					public init(cType: LDKu8slice) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKu8slice, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(value: [UInt8]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						
						let dataContainer = UnsafeMutablePointer<UInt8>.allocate(capacity: value.count)
						dataContainer.initialize(from: value, count: value.count)
						self.cType = LDKu8slice(data: dataContainer, datalen: UInt(value.count))
				

						super.init(conflictAvoidingVariableName: 0)
					}

					

					public func getValue() -> [UInt8] {
						
						var array = [UInt8]()
						for index in 0..<Int(self.cType!.datalen) {
							let currentEntry = self.cType!.data[index]
							array.append(currentEntry)
						}
						return array
				
					}

					internal func dangle() -> u8slice {
        				self.dangling = true
						return self
					}

										

				}

			}
		