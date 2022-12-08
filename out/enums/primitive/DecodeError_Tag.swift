
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// An error in decoding a message or struct.
			public typealias DecodeError_Tag = Bindings.DecodeError_Tag

			extension Bindings {

				/// An error in decoding a message or struct.
				public enum DecodeError_Tag {

					
					/// A version byte specified something we don't know how to handle.
					/// Includes unknown realm byte in an OnionHopData packet
					case LDKDecodeError_UnknownVersion
			
					/// Unknown feature mandating we fail to parse message (eg TLV with an even, unknown type)
					case LDKDecodeError_UnknownRequiredFeature
			
					/// Value was invalid, eg a byte which was supposed to be a bool was something other than a 0
					/// or 1, a public key/private key/signature was invalid, text wasn't UTF-8, TLV was
					/// syntactically incorrect, etc
					case LDKDecodeError_InvalidValue
			
					/// Buffer too short
					case LDKDecodeError_ShortRead
			
					/// A length descriptor in the packet didn't describe the later data correctly
					case LDKDecodeError_BadLengthDescriptor
			
					/// Error from std::io
					case LDKDecodeError_Io
			
					/// The message included zlib-compressed values, which we don't support.
					case LDKDecodeError_UnsupportedCompression
			

					internal init (value: LDKDecodeError_Tag) {

						// TODO: remove this initial assumption somehow
						self = .LDKDecodeError_UnsupportedCompression

						
						// LDKDecodeError_UnknownVersion
						if value.rawValue == 0 {
							self = .LDKDecodeError_UnknownVersion
						}
			
						// LDKDecodeError_UnknownRequiredFeature
						if value.rawValue == 1 {
							self = .LDKDecodeError_UnknownRequiredFeature
						}
			
						// LDKDecodeError_InvalidValue
						if value.rawValue == 2 {
							self = .LDKDecodeError_InvalidValue
						}
			
						// LDKDecodeError_ShortRead
						if value.rawValue == 3 {
							self = .LDKDecodeError_ShortRead
						}
			
						// LDKDecodeError_BadLengthDescriptor
						if value.rawValue == 4 {
							self = .LDKDecodeError_BadLengthDescriptor
						}
			
						// LDKDecodeError_Io
						if value.rawValue == 5 {
							self = .LDKDecodeError_Io
						}
			
						// LDKDecodeError_UnsupportedCompression
						if value.rawValue == 6 {
							self = .LDKDecodeError_UnsupportedCompression
						}
			
					}

					internal func getCValue() -> LDKDecodeError_Tag {
						switch self {
							
							case .LDKDecodeError_UnknownVersion:
								// return LDKDecodeError_UnknownVersion
								return LDKDecodeError_Tag(0)
			
							case .LDKDecodeError_UnknownRequiredFeature:
								// return LDKDecodeError_UnknownRequiredFeature
								return LDKDecodeError_Tag(1)
			
							case .LDKDecodeError_InvalidValue:
								// return LDKDecodeError_InvalidValue
								return LDKDecodeError_Tag(2)
			
							case .LDKDecodeError_ShortRead:
								// return LDKDecodeError_ShortRead
								return LDKDecodeError_Tag(3)
			
							case .LDKDecodeError_BadLengthDescriptor:
								// return LDKDecodeError_BadLengthDescriptor
								return LDKDecodeError_Tag(4)
			
							case .LDKDecodeError_Io:
								// return LDKDecodeError_Io
								return LDKDecodeError_Tag(5)
			
							case .LDKDecodeError_UnsupportedCompression:
								// return LDKDecodeError_UnsupportedCompression
								return LDKDecodeError_Tag(6)
			
						}
					}

				}

			}
		