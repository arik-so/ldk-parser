
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A tuple of 2 elements. See the individual fields for the types contained.
			internal typealias Tuple_usizeTransactionZ = Bindings.Tuple_usizeTransactionZ

			extension Bindings {

				/// A tuple of 2 elements. See the individual fields for the types contained.
				internal class Tuple_usizeTransactionZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKC2Tuple_usizeTransactionZ?

					public init(cType: LDKC2Tuple_usizeTransactionZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKC2Tuple_usizeTransactionZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal convenience init(tuple: (UInt, [UInt8])) {
						self.init(a: tuple.0, b: tuple.1)
					}

					
					/// Creates a new tuple which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Tuple_usizeTransactionZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKC2Tuple_usizeTransactionZ>) in
				C2Tuple_usizeTransactionZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Tuple_usizeTransactionZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new C2Tuple_usizeTransactionZ from the contained elements.
					public init(a: UInt, b: [UInt8]) {
						// native call variable prep
						
						let bPrimitiveWrapper = Transaction(value: b).dangle()
				
						bPrimitiveWrapper.cType!.data_is_owned = false
					

						// native method call
						let nativeCallResult = C2Tuple_usizeTransactionZ_new(a, bPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						bPrimitiveWrapper.noOpRetain()
				

						/*
						// return value (do some wrapping)
						let returnValue = Tuple_usizeTransactionZ(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Frees any resources used by the C2Tuple_usizeTransactionZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = C2Tuple_usizeTransactionZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					public func getValue() -> (UInt, [UInt8]) {
						return (self.getA(), self.getB())
					}

					
					/// The element at position 0
					public func getA() -> UInt {
						// return value (do some wrapping)
						let returnValue = self.cType!.a

						return returnValue;
					}
		
					/// The element at position 1
					public func getB() -> [UInt8] {
						// return value (do some wrapping)
						let returnValue = Transaction(cType: self.cType!.b).dangle().getValue()

						return returnValue;
					}
		

					internal func dangle() -> Tuple_usizeTransactionZ {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> Tuple_usizeTransactionZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Tuple_usizeTransactionZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Tuple_usizeTransactionZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}
			}
		