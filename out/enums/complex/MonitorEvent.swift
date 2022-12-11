
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// 
			public typealias MonitorEvent = Bindings.MonitorEvent

			extension Bindings {

				/// An event to be processed by the ChannelManager.
				public class MonitorEvent: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKMonitorEvent?

					public init(cType: LDKMonitorEvent) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKMonitorEvent, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum MonitorEventType {
						
						/// A monitor event containing an HTLCUpdate.
						case HTLCEvent
			
						/// A monitor event that the Channel's commitment transaction was confirmed.
						case CommitmentTxConfirmed
			
						/// Indicates a [`ChannelMonitor`] update has completed. See
						/// [`ChannelMonitorUpdateStatus::InProgress`] for more information on how this is used.
						/// 
						/// [`ChannelMonitorUpdateStatus::InProgress`]: super::ChannelMonitorUpdateStatus::InProgress
						case Completed
			
						/// Indicates a [`ChannelMonitor`] update has failed. See
						/// [`ChannelMonitorUpdateStatus::PermanentFailure`] for more information on how this is used.
						/// 
						/// [`ChannelMonitorUpdateStatus::PermanentFailure`]: super::ChannelMonitorUpdateStatus::PermanentFailure
						case UpdateFailed
			
					}

					public func getValueType() -> MonitorEventType {
						switch self.cType!.tag {
							case LDKMonitorEvent_HTLCEvent:
								return .HTLCEvent
			
							case LDKMonitorEvent_CommitmentTxConfirmed:
								return .CommitmentTxConfirmed
			
							case LDKMonitorEvent_Completed:
								return .Completed
			
							default:
								return .UpdateFailed
			
					}

					
					/// Frees any resources used by the MonitorEvent
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MonitorEvent_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the MonitorEvent
					internal func clone() -> MonitorEvent {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKMonitorEvent>) in
				MonitorEvent_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = MonitorEvent(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new HTLCEvent-variant MonitorEvent
					public class func initWithHtlcevent(a: Bindings.HTLCUpdate) -> MonitorEvent {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MonitorEvent_htlcevent(a.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = MonitorEvent(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new CommitmentTxConfirmed-variant MonitorEvent
					public class func initWithCommitmentTxConfirmed(a: Bindings.OutPoint) -> MonitorEvent {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MonitorEvent_commitment_tx_confirmed(a.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = MonitorEvent(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new Completed-variant MonitorEvent
					public class func initWithCompleted(fundingTxo: Bindings.OutPoint, monitorUpdateId: UInt64) -> MonitorEvent {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MonitorEvent_completed(fundingTxo.dynamicallyDangledClone().cType!, monitorUpdateId)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = MonitorEvent(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new UpdateFailed-variant MonitorEvent
					public class func initWithUpdateFailed(a: Bindings.OutPoint) -> MonitorEvent {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MonitorEvent_update_failed(a.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = MonitorEvent(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two MonitorEvents contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					public func eq() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (aPointer: UnsafePointer<LDKMonitorEvent>) in
				
						withUnsafePointer(to: self.cType!) { (bPointer: UnsafePointer<LDKMonitorEvent>) in
				MonitorEvent_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the MonitorEvent object into a byte array which can be read by MonitorEvent_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKMonitorEvent>) in
				MonitorEvent_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()
						

						return returnValue
					}
		
					/// Read a MonitorEvent from a byte array, created by MonitorEvent_write
					public class func read(ser: [UInt8]) -> Result_COption_MonitorEventZDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = MonitorEvent_read(serPrimitiveWrapper.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_COption_MonitorEventZDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					
					public func getValueAsHtlcEvent() -> Bindings.HTLCUpdate? {
						if self.cType?.tag != LDKMonitorEvent_HTLCEvent {
							return nil
						}

						return HTLCUpdate(cType: self.cType!.htlc_event, anchor: self).dangle()
					}
			
					public func getValueAsCommitmentTxConfirmed() -> Bindings.OutPoint? {
						if self.cType?.tag != LDKMonitorEvent_CommitmentTxConfirmed {
							return nil
						}

						return OutPoint(cType: self.cType!.commitment_tx_confirmed, anchor: self).dangle()
					}
			
					public func getValueAsCompleted() -> Completed? {
						if self.cType?.tag != LDKMonitorEvent_Completed {
							return nil
						}

						return MonitorEvent_LDKCompleted_Body(cType: self.cType!.completed, anchor: self).dangle()
					}
			
					public func getValueAsUpdateFailed() -> Bindings.OutPoint? {
						if self.cType?.tag != LDKMonitorEvent_UpdateFailed {
							return nil
						}

						return OutPoint(cType: self.cType!.update_failed, anchor: self).dangle()
					}
			

					internal func dangle() -> MonitorEvent {
        				self.dangling = true
						return self
					}

					
					internal func danglingClone() -> MonitorEvent {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing MonitorEvent \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing MonitorEvent \(self.instanceNumber) due to dangle.")
						}
					}
			

					
					
					/// 
					internal typealias MonitorEvent_LDKCompleted_Body = Completed
			

					/// 
					public class Completed: NativeTypeWrapper {

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKMonitorEvent_LDKCompleted_Body?

						fileprivate init(cType: LDKMonitorEvent_LDKCompleted_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
						}

						fileprivate init(cType: LDKMonitorEvent_LDKCompleted_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The funding outpoint of the [`ChannelMonitor`] that was updated
						public func getFundingTxo() -> Bindings.OutPoint {
							// return value (do some wrapping)
							let returnValue = Bindings.OutPoint(cType: self.cType!.funding_txo, anchor: self).dangle()

							return returnValue;
						}
		
						/// The Update ID from [`ChannelMonitorUpdate::update_id`] which was applied or
						/// [`ChannelMonitor::get_latest_update_id`].
						/// 
						/// Note that this should only be set to a given update's ID if all previous updates for the
						/// same [`ChannelMonitor`] have been applied and persisted.
						public func getMonitorUpdateId() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.monitor_update_id

							return returnValue;
						}
		

						internal func dangle() -> Completed {
							self.dangling = true
							return self
						}

											

					}

					
		

				}

			}
		