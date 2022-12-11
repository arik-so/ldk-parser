
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias ParseOrSemanticError = Bindings.ParseOrSemanticError

			extension Bindings {

				/// Indicates that something went wrong while parsing or validating the invoice. Parsing errors
				/// should be mostly seen as opaque and are only there for debugging reasons. Semantic errors
				/// like wrong signatures, missing fields etc. could mean that someone tampered with the invoice.
				public class ParseOrSemanticError: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKParseOrSemanticError?

					public init(cType: LDKParseOrSemanticError) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKParseOrSemanticError, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum ParseOrSemanticErrorType {
						
						/// The invoice couldn't be decoded
						case ParseError
			
						/// The invoice could be decoded but violates the BOLT11 standard
						case SemanticError
			
					}

					public func getValueType() -> ParseOrSemanticErrorType {
						switch self.cType!.tag {
							case LDKParseOrSemanticError_ParseError:
								return .ParseError
			
							case LDKParseOrSemanticError_SemanticError:
								return .SemanticError
			
							default:
								Bindings.print("Error: Invalid value type for ParseOrSemanticError! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the ParseOrSemanticError
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ParseOrSemanticError_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the ParseOrSemanticError
					internal func clone() -> ParseOrSemanticError {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKParseOrSemanticError>) in
				ParseOrSemanticError_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ParseOrSemanticError(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new ParseError-variant ParseOrSemanticError
					public class func initWithParseError(a: ParseError) -> ParseOrSemanticError {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ParseOrSemanticError_parse_error(a.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ParseOrSemanticError(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new SemanticError-variant ParseOrSemanticError
					public class func initWithSemanticError(a: SemanticError) -> ParseOrSemanticError {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ParseOrSemanticError_semantic_error(a.getCValue())

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ParseOrSemanticError(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two ParseOrSemanticErrors contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKParseOrSemanticError>) in
				
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKParseOrSemanticError>) in
				ParseOrSemanticError_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Get the string representation of a ParseOrSemanticError object
					public func toStr() -> String {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKParseOrSemanticError>) in
				ParseOrSemanticError_to_str(oPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Str(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		

					
					public func getValueAsParseError() -> ParseError? {
						if self.cType?.tag != LDKParseOrSemanticError_ParseError {
							return nil
						}

						return ParseError(cType: self.cType!.parse_error, anchor: self).dangle()
					}
			
					public func getValueAsSemanticError() -> SemanticError? {
						if self.cType?.tag != LDKParseOrSemanticError_SemanticError {
							return nil
						}

						return SemanticError(value: self.cType!.semantic_error)
					}
			

					internal func dangle() -> ParseOrSemanticError {
        				self.dangling = true
						return self
					}

					
					internal func danglingClone() -> ParseOrSemanticError {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing ParseOrSemanticError \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ParseOrSemanticError \(self.instanceNumber) due to dangle.")
						}
					}
			

					

				}

			}
		