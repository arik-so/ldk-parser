
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A tuple of 2 elements. See the individual fields for the types contained.
			internal typealias Tuple_SignatureSignatureZ = Bindings.Tuple_SignatureSignatureZ

			extension Bindings {

				/// A tuple of 2 elements. See the individual fields for the types contained.
				internal class Tuple_SignatureSignatureZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKC2Tuple_SignatureSignatureZ?

					public init(cType: LDKC2Tuple_SignatureSignatureZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKC2Tuple_SignatureSignatureZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal convenience init(tuple: ([UInt8], [UInt8])) {
						self.init(a: tuple.0, b: tuple.1)
					}

					
					/// Creates a new tuple which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Tuple_SignatureSignatureZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKC2Tuple_SignatureSignatureZ>) in
				C2Tuple_SignatureSignatureZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Tuple_SignatureSignatureZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new C2Tuple_SignatureSignatureZ from the contained elements.
					public init(a: [UInt8], b: [UInt8]) {
						// native call variable prep
						
						let aPrimitiveWrapper = Signature(value: a)
				
						let bPrimitiveWrapper = Signature(value: b)
				

						// native method call
						let nativeCallResult = C2Tuple_SignatureSignatureZ_new(aPrimitiveWrapper.cType!, bPrimitiveWrapper.cType!)

						// cleanup
						

						/*
						// return value (do some wrapping)
						let returnValue = Tuple_SignatureSignatureZ(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Frees any resources used by the C2Tuple_SignatureSignatureZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = C2Tuple_SignatureSignatureZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					public func getValue() -> ([UInt8], [UInt8]) {
						return (self.getA(), self.getB())
					}

					
					/// The element at position 0
					public func getA() -> [UInt8] {
						// return value (do some wrapping)
						let returnValue = Signature(cType: self.cType!.a).dangle().getValue()

						return returnValue;
					}
		
					/// The element at position 1
					public func getB() -> [UInt8] {
						// return value (do some wrapping)
						let returnValue = Signature(cType: self.cType!.b).dangle().getValue()

						return returnValue;
					}
		

					internal func dangle() -> Tuple_SignatureSignatureZ {
						self.dangling = true
						return self
					}

					
					internal func danglingClone() -> Tuple_SignatureSignatureZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Tuple_SignatureSignatureZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Tuple_SignatureSignatureZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}
			}
		