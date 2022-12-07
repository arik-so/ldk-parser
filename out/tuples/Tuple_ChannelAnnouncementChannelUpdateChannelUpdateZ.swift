
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			internal typealias Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ = Bindings.Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ

			extension Bindings {

				/// A tuple of 3 elements. See the individual fields for the types contained.
				internal class Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ?

					public init(cType: LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal convenience init(tuple: (ChannelAnnouncement, ChannelUpdate, ChannelUpdate)) {
						self.init(a: tuple.0, b: tuple.1, c: tuple.2)
					}

					
					/// Creates a new tuple which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ>) in
			C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Creates a new C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ from the contained elements.
					public init(a: ChannelAnnouncement, b: ChannelUpdate, c: ChannelUpdate) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ_new(a.cType!, b.cType!, c.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ(cType: nativeCallResult).getValue()

						self.cType = nativeCallResult
					}
		
					/// Frees any resources used by the C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					public func getValue() -> (ChannelAnnouncement, ChannelUpdate, ChannelUpdate) {
						return (self.getA(), self.getB(), self.getC())
					}

					
					/// The element at position 0
					public func getA() -> ChannelAnnouncement {
						// return value (do some wrapping)
						let returnValue = ChannelAnnouncement(cType: self.cType!.a)

						return returnValue;
					}
		
					/// The element at position 1
					public func getB() -> ChannelUpdate {
						// return value (do some wrapping)
						let returnValue = ChannelUpdate(cType: self.cType!.b)

						return returnValue;
					}
		
					/// The element at position 2
					public func getC() -> ChannelUpdate {
						// return value (do some wrapping)
						let returnValue = ChannelUpdate(cType: self.cType!.c)

						return returnValue;
					}
		

					internal func dangle() -> Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}
			}
		