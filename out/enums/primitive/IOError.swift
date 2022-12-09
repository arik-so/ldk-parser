
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Represents an IO Error. Note that some information is lost in the conversion from Rust.
			public typealias IOError = Bindings.IOError

			extension Bindings {

				/// Represents an IO Error. Note that some information is lost in the conversion from Rust.
				public enum IOError {

					
					/// 
					case NotFound
			
					/// 
					case PermissionDenied
			
					/// 
					case ConnectionRefused
			
					/// 
					case ConnectionReset
			
					/// 
					case ConnectionAborted
			
					/// 
					case NotConnected
			
					/// 
					case AddrInUse
			
					/// 
					case AddrNotAvailable
			
					/// 
					case BrokenPipe
			
					/// 
					case AlreadyExists
			
					/// 
					case WouldBlock
			
					/// 
					case InvalidInput
			
					/// 
					case InvalidData
			
					/// 
					case TimedOut
			
					/// 
					case WriteZero
			
					/// 
					case Interrupted
			
					/// 
					case Other
			
					/// 
					case UnexpectedEof
			

					internal init (value: LDKIOError) {

						// TODO: remove this initial assumption somehow
						// self = .UnexpectedEof

						switch value {
							
							// LDKIOError_NotFound
							// if value.rawValue == 0 {
							case LDKIOError_NotFound: // {
								self = .NotFound
							// }
			
							// LDKIOError_PermissionDenied
							// if value.rawValue == 1 {
							case LDKIOError_PermissionDenied: // {
								self = .PermissionDenied
							// }
			
							// LDKIOError_ConnectionRefused
							// if value.rawValue == 2 {
							case LDKIOError_ConnectionRefused: // {
								self = .ConnectionRefused
							// }
			
							// LDKIOError_ConnectionReset
							// if value.rawValue == 3 {
							case LDKIOError_ConnectionReset: // {
								self = .ConnectionReset
							// }
			
							// LDKIOError_ConnectionAborted
							// if value.rawValue == 4 {
							case LDKIOError_ConnectionAborted: // {
								self = .ConnectionAborted
							// }
			
							// LDKIOError_NotConnected
							// if value.rawValue == 5 {
							case LDKIOError_NotConnected: // {
								self = .NotConnected
							// }
			
							// LDKIOError_AddrInUse
							// if value.rawValue == 6 {
							case LDKIOError_AddrInUse: // {
								self = .AddrInUse
							// }
			
							// LDKIOError_AddrNotAvailable
							// if value.rawValue == 7 {
							case LDKIOError_AddrNotAvailable: // {
								self = .AddrNotAvailable
							// }
			
							// LDKIOError_BrokenPipe
							// if value.rawValue == 8 {
							case LDKIOError_BrokenPipe: // {
								self = .BrokenPipe
							// }
			
							// LDKIOError_AlreadyExists
							// if value.rawValue == 9 {
							case LDKIOError_AlreadyExists: // {
								self = .AlreadyExists
							// }
			
							// LDKIOError_WouldBlock
							// if value.rawValue == 10 {
							case LDKIOError_WouldBlock: // {
								self = .WouldBlock
							// }
			
							// LDKIOError_InvalidInput
							// if value.rawValue == 11 {
							case LDKIOError_InvalidInput: // {
								self = .InvalidInput
							// }
			
							// LDKIOError_InvalidData
							// if value.rawValue == 12 {
							case LDKIOError_InvalidData: // {
								self = .InvalidData
							// }
			
							// LDKIOError_TimedOut
							// if value.rawValue == 13 {
							case LDKIOError_TimedOut: // {
								self = .TimedOut
							// }
			
							// LDKIOError_WriteZero
							// if value.rawValue == 14 {
							case LDKIOError_WriteZero: // {
								self = .WriteZero
							// }
			
							// LDKIOError_Interrupted
							// if value.rawValue == 15 {
							case LDKIOError_Interrupted: // {
								self = .Interrupted
							// }
			
							// LDKIOError_Other
							// if value.rawValue == 16 {
							case LDKIOError_Other: // {
								self = .Other
							// }
			
							// LDKIOError_UnexpectedEof
							// if value.rawValue == 17 {
							default: // {
								self = .UnexpectedEof
							// }
			
						}
					}

					internal func getCValue() -> LDKIOError {
						switch self {
							
							case .NotFound:
								return LDKIOError_NotFound
								// return LDKIOError(0)
			
							case .PermissionDenied:
								return LDKIOError_PermissionDenied
								// return LDKIOError(1)
			
							case .ConnectionRefused:
								return LDKIOError_ConnectionRefused
								// return LDKIOError(2)
			
							case .ConnectionReset:
								return LDKIOError_ConnectionReset
								// return LDKIOError(3)
			
							case .ConnectionAborted:
								return LDKIOError_ConnectionAborted
								// return LDKIOError(4)
			
							case .NotConnected:
								return LDKIOError_NotConnected
								// return LDKIOError(5)
			
							case .AddrInUse:
								return LDKIOError_AddrInUse
								// return LDKIOError(6)
			
							case .AddrNotAvailable:
								return LDKIOError_AddrNotAvailable
								// return LDKIOError(7)
			
							case .BrokenPipe:
								return LDKIOError_BrokenPipe
								// return LDKIOError(8)
			
							case .AlreadyExists:
								return LDKIOError_AlreadyExists
								// return LDKIOError(9)
			
							case .WouldBlock:
								return LDKIOError_WouldBlock
								// return LDKIOError(10)
			
							case .InvalidInput:
								return LDKIOError_InvalidInput
								// return LDKIOError(11)
			
							case .InvalidData:
								return LDKIOError_InvalidData
								// return LDKIOError(12)
			
							case .TimedOut:
								return LDKIOError_TimedOut
								// return LDKIOError(13)
			
							case .WriteZero:
								return LDKIOError_WriteZero
								// return LDKIOError(14)
			
							case .Interrupted:
								return LDKIOError_Interrupted
								// return LDKIOError(15)
			
							case .Other:
								return LDKIOError_Other
								// return LDKIOError(16)
			
							case .UnexpectedEof:
								return LDKIOError_UnexpectedEof
								// return LDKIOError(17)
			
						}
					}

				}

			}
		