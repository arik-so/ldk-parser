
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			internal typealias Option_C2Tuple_u64u64ZZ = Bindings.Option_C2Tuple_u64u64ZZ

			extension Bindings {

				/// An enum which can either contain a crate::c_types::derived::C2Tuple_u64u64Z or not
				internal class Option_C2Tuple_u64u64ZZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCOption_C2Tuple_u64u64ZZ?

					public init(cType: LDKCOption_C2Tuple_u64u64ZZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKCOption_C2Tuple_u64u64ZZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(some: (UInt64, UInt64)?) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						if let some = some {
							
							let someTuple = Tuple_u64u64Z(tuple: some)
				
							self.cType = COption_C2Tuple_u64u64ZZ_some(someTuple.cType!)
						} else {
							self.cType = COption_C2Tuple_u64u64ZZ_none()
						}

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Frees any resources associated with the crate::c_types::derived::C2Tuple_u64u64Z, if we are in the Some state
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = COption_C2Tuple_u64u64ZZ_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a new COption_C2Tuple_u64u64ZZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Option_C2Tuple_u64u64ZZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCOption_C2Tuple_u64u64ZZ>) in
			COption_C2Tuple_u64u64ZZ_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Option_C2Tuple_u64u64ZZ(cType: nativeCallResult)

						return returnValue
					}
		

					public func getValue() -> (UInt64, UInt64)? {
						if self.cType!.tag == LDKCOption_C2Tuple_u64u64ZZ_None {
							return nil
						}
						if self.cType!.tag == LDKCOption_C2Tuple_u64u64ZZ_Some {
							return Tuple_u64u64Z(cType: self.cType!.some).getValue()
						}
						assert(false, "invalid option enum value")
						return nil
					}

					internal func dangle() -> Option_C2Tuple_u64u64ZZ {
        				self.dangling = true
						return self
					}

					
					internal func danglingClone() -> Option_C2Tuple_u64u64ZZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Option_C2Tuple_u64u64ZZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Option_C2Tuple_u64u64ZZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		