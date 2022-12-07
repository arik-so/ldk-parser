
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

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

						
						if value == LDKDecodeError_UnknownVersion {
							self = .LDKDecodeError_UnknownVersion
						}
			
						if value == LDKDecodeError_UnknownRequiredFeature {
							self = .LDKDecodeError_UnknownRequiredFeature
						}
			
						if value == LDKDecodeError_InvalidValue {
							self = .LDKDecodeError_InvalidValue
						}
			
						if value == LDKDecodeError_ShortRead {
							self = .LDKDecodeError_ShortRead
						}
			
						if value == LDKDecodeError_BadLengthDescriptor {
							self = .LDKDecodeError_BadLengthDescriptor
						}
			
						if value == LDKDecodeError_Io {
							self = .LDKDecodeError_Io
						}
			
						if value == LDKDecodeError_UnsupportedCompression {
							self = .LDKDecodeError_UnsupportedCompression
						}
			
					}

					internal func getCValue() -> LDKDecodeError_Tag {
						switch self {
							
							case .LDKDecodeError_UnknownVersion:
								return LDKDecodeError_UnknownVersion
			
							case .LDKDecodeError_UnknownRequiredFeature:
								return LDKDecodeError_UnknownRequiredFeature
			
							case .LDKDecodeError_InvalidValue:
								return LDKDecodeError_InvalidValue
			
							case .LDKDecodeError_ShortRead:
								return LDKDecodeError_ShortRead
			
							case .LDKDecodeError_BadLengthDescriptor:
								return LDKDecodeError_BadLengthDescriptor
			
							case .LDKDecodeError_Io:
								return LDKDecodeError_Io
			
							case .LDKDecodeError_UnsupportedCompression:
								return LDKDecodeError_UnsupportedCompression
			
						}
					}

				}

			}
		