
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias ErrorAction = Bindings.ErrorAction

			extension Bindings {

				/// Used to put an error message in a LightningError
				public class ErrorAction: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKErrorAction?

					public init(pointer: LDKErrorAction) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(pointer: LDKErrorAction, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = pointer
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum ErrorActionType {
						
						/// The peer took some action which made us think they were useless. Disconnect them.
						case DisconnectPeer
			
						/// The peer did something harmless that we weren't able to process, just log and ignore
						case IgnoreError
			
						/// The peer did something harmless that we weren't able to meaningfully process.
						/// If the error is logged, log it at the given level.
						case IgnoreAndLog
			
						/// The peer provided us with a gossip message which we'd already seen. In most cases this
						/// should be ignored, but it may result in the message being forwarded if it is a duplicate of
						/// our own channel announcements.
						case IgnoreDuplicateGossip
			
						/// The peer did something incorrect. Tell them.
						case SendErrorMessage
			
						/// The peer did something incorrect. Tell them without closing any channels.
						case SendWarningMessage
			
					}

					public func getValueType() -> ErrorActionType? {
						switch self.cType!.tag {
							case LDKErrorAction_DisconnectPeer:
								return .DisconnectPeer
			
							case LDKErrorAction_IgnoreError:
								return .IgnoreError
			
							case LDKErrorAction_IgnoreAndLog:
								return .IgnoreAndLog
			
							case LDKErrorAction_IgnoreDuplicateGossip:
								return .IgnoreDuplicateGossip
			
							case LDKErrorAction_SendErrorMessage:
								return .SendErrorMessage
			
							case LDKErrorAction_SendWarningMessage:
								return .SendWarningMessage
			
							default:
								return nil
						}
		
					}

					
					/// Frees any resources used by the ErrorAction
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ErrorAction_free(self.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Creates a copy of the ErrorAction
					internal func clone() -> ErrorAction {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKErrorAction>) in
			ErrorAction_clone(origPointer)
						}
			

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ErrorAction(pointer: nativeCallResult)

						return returnValue
					}
		
					/// Utility method to constructs a new DisconnectPeer-variant ErrorAction
					public init(msg: ErrorMessage) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ErrorAction_disconnect_peer(msg.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ErrorAction(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new IgnoreError-variant ErrorAction
					public init() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ErrorAction_ignore_error()

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ErrorAction(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new IgnoreAndLog-variant ErrorAction
					public init(a: Level) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ErrorAction_ignore_and_log(a.getCValue())

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ErrorAction(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new IgnoreDuplicateGossip-variant ErrorAction
					public init() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ErrorAction_ignore_duplicate_gossip()

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ErrorAction(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new SendErrorMessage-variant ErrorAction
					public init(msg: ErrorMessage) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ErrorAction_send_error_message(msg.cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ErrorAction(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		
					/// Utility method to constructs a new SendWarningMessage-variant ErrorAction
					public init(msg: WarningMessage, logLevel: Level) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ErrorAction_send_warning_message(msg.cType!, logLevel.getCValue())

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ErrorAction(pointer: nativeCallResult)

						self.cType = nativeCallResult
					}
		

					
					public func getValueAsDisconnectPeer() -> DisconnectPeer? {
						if self.cType?.tag != LDKErrorAction_DisconnectPeer {
							return nil
						}

						return ErrorAction_LDKDisconnectPeer_Body(pointer: self.cType!.disconnect_peer)
					}
			
					public func getValueAsIgnoreAndLog() -> Level? {
						if self.cType?.tag != LDKErrorAction_IgnoreAndLog {
							return nil
						}

						return Level(value: self.cType!.ignore_and_log)
					}
			
					public func getValueAsSendErrorMessage() -> SendErrorMessage? {
						if self.cType?.tag != LDKErrorAction_SendErrorMessage {
							return nil
						}

						return ErrorAction_LDKSendErrorMessage_Body(pointer: self.cType!.send_error_message)
					}
			
					public func getValueAsSendWarningMessage() -> SendWarningMessage? {
						if self.cType?.tag != LDKErrorAction_SendWarningMessage {
							return nil
						}

						return ErrorAction_LDKSendWarningMessage_Body(pointer: self.cType!.send_warning_message)
					}
			

					internal func dangle() -> ErrorAction {
        				self.dangling = true
						return self
					}

					
					internal func danglingClone() -> ErrorAction {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if !self.dangling {
							Bindings.print("Freeing ErrorAction \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ErrorAction \(self.instanceNumber) due to dangle.")
						}
					}
			

					
					

					/// 
					public class DisconnectPeer: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKErrorAction_LDKDisconnectPeer_Body?

						fileprivate init(pointer: LDKErrorAction_LDKDisconnectPeer_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = pointer
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(pointer: LDKErrorAction_LDKDisconnectPeer_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = pointer
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// An error message which we should make an effort to send before we disconnect.
						/// 
						/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
						public func getMsg() -> ErrorMessage {
							// return value (do some wrapping)
							let returnValue = ErrorMessage(pointer: self.cType!.msg)

							return returnValue;
						}
		

						internal func dangle() -> DisconnectPeer {
							self.dangling = true
							return self
						}

											

					}

					
		
					

					/// 
					public class SendErrorMessage: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKErrorAction_LDKSendErrorMessage_Body?

						fileprivate init(pointer: LDKErrorAction_LDKSendErrorMessage_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = pointer
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(pointer: LDKErrorAction_LDKSendErrorMessage_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = pointer
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The message to send.
						public func getMsg() -> ErrorMessage {
							// return value (do some wrapping)
							let returnValue = ErrorMessage(pointer: self.cType!.msg)

							return returnValue;
						}
		

						internal func dangle() -> SendErrorMessage {
							self.dangling = true
							return self
						}

											

					}

					
		
					

					/// 
					public class SendWarningMessage: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKErrorAction_LDKSendWarningMessage_Body?

						fileprivate init(pointer: LDKErrorAction_LDKSendWarningMessage_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = pointer
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(pointer: LDKErrorAction_LDKSendWarningMessage_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = pointer
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The message to send.
						public func getMsg() -> WarningMessage {
							// return value (do some wrapping)
							let returnValue = WarningMessage(pointer: self.cType!.msg)

							return returnValue;
						}
		
						/// The peer may have done something harmless that we weren't able to meaningfully process,
						/// though we should still tell them about it.
						/// If this event is logged, log it at the given level.
						public func getLogLevel() -> Level {
							// return value (do some wrapping)
							let returnValue = Level(value: self.cType!.log_level)

							return returnValue;
						}
		

						internal func dangle() -> SendWarningMessage {
							self.dangling = true
							return self
						}

											

					}

					
		

				}

			}
		