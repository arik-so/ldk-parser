
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias Bech32Error = Bindings.Bech32Error

			extension Bindings {

				/// Represents an error returned from the bech32 library during validation of some bech32 data
				public class Bech32Error: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKBech32Error?

					public init(pointer: LDKBech32Error) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKBech32Error, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum Bech32ErrorType {
						
						/// String does not contain the separator character
						case MissingSeparator
			
						/// The checksum does not match the rest of the data
						case InvalidChecksum
			
						/// The data or human-readable part is too long or too short
						case InvalidLength
			
						/// Some part of the string contains an invalid character
						case InvalidChar
			
						/// Some part of the data has an invalid value
						case InvalidData
			
						/// The bit conversion failed due to a padding issue
						case InvalidPadding
			
						/// The whole string must be of one case
						case MixedCase
			
					}

					public func getValueType() -> Bech32ErrorType? {
						switch self.cType!.tag {
							case LDKBech32Error_MissingSeparator:
								return .MissingSeparator
			
							case LDKBech32Error_InvalidChecksum:
								return .InvalidChecksum
			
							case LDKBech32Error_InvalidLength:
								return .InvalidLength
			
							case LDKBech32Error_InvalidChar:
								return .InvalidChar
			
							case LDKBech32Error_InvalidData:
								return .InvalidData
			
							case LDKBech32Error_InvalidPadding:
								return .InvalidPadding
			
							case LDKBech32Error_MixedCase:
								return .MixedCase
			
							default:
								return nil
						}
		
					}

					
					/// Creates a new Bech32Error which has the same data as `orig`
					internal func clone() -> Bech32Error {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBech32Error>) in
			Bech32Error_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Bech32Error(pointer: nativeCallResult)

						return returnValue
					}
		
					/// Releases any memory held by the given `Bech32Error` (which is currently none)
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Bech32Error_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		

					
					public func getValueAsInvalidChar() -> UInt32? {
						if self.cType?.tag != LDKBech32Error_InvalidChar {
							return nil
						}

						return self.cType!.invalid_char
					}
			
					public func getValueAsInvalidData() -> UInt8? {
						if self.cType?.tag != LDKBech32Error_InvalidData {
							return nil
						}

						return self.cType!.invalid_data
					}
			

					internal func dangle() -> Bech32Error {
        				self.dangling = true
						return self
					}

					
					internal func danglingClone() -> Bech32Error {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Bech32Error \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Bech32Error \(self.instanceNumber) due to dangle.")
						}
					}
			

					

				}

			}
		