
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A Rust str object, ie a reference to a UTF8-valid string.
			/// This is *not* null-terminated so cannot be used directly as a C string!
			internal typealias Str = Bindings.Str

			extension Bindings {

				/// A Rust str object, ie a reference to a UTF8-valid string.
				/// This is *not* null-terminated so cannot be used directly as a C string!
				internal class Str: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKStr?

					public init(cType: LDKStr) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKStr, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(value: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						self.cType = LDKStr(chars: Bindings.string_to_unsafe_uint8_pointer(string: value), len: UInt(value.count), chars_is_owned: false)

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Frees the data buffer, if chars_is_owned is set and len > 0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Str_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					public func getValue() -> String {
						
						var array = [UInt8]()
						for index in 0..<Int(self.cType!.len) {
							let currentEntry = self.cType!.chars[index]
							array.append(currentEntry)
						}
						let data = Data(bytes: array)
						return String(data: data, encoding: .utf8)!
				
					}

					internal func dangle() -> Str {
        				self.dangling = true
						return self
					}

					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Str \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Str \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		