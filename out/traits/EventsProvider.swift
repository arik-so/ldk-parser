
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			public typealias EventsProvider = Bindings.EventsProvider

			extension Bindings {

				/// A trait indicating an object may generate events.
				/// 
				/// Events are processed by passing an [`EventHandler`] to [`process_pending_events`].
				/// 
				/// # Requirements
				/// 
				/// When using this trait, [`process_pending_events`] will call [`handle_event`] for each pending
				/// event since the last invocation.
				/// 
				/// In order to ensure no [`Event`]s are lost, implementors of this trait will persist [`Event`]s
				/// and replay any unhandled events on startup. An [`Event`] is considered handled when
				/// [`process_pending_events`] returns, thus handlers MUST fully handle [`Event`]s and persist any
				/// relevant changes to disk *before* returning.
				/// 
				/// Further, because an application may crash between an [`Event`] being handled and the
				/// implementor of this trait being re-serialized, [`Event`] handling must be idempotent - in
				/// effect, [`Event`]s may be replayed.
				/// 
				/// Note, handlers may call back into the provider and thus deadlocking must be avoided. Be sure to
				/// consult the provider's documentation on the implication of processing events and how a handler
				/// may safely use the provider (e.g., see [`ChannelManager::process_pending_events`] and
				/// [`ChainMonitor::process_pending_events`]).
				/// 
				/// (C-not implementable) As there is likely no reason for a user to implement this trait on their
				/// own type(s).
				/// 
				/// [`process_pending_events`]: Self::process_pending_events
				/// [`handle_event`]: EventHandler::handle_event
				/// [`ChannelManager::process_pending_events`]: crate::ln::channelmanager::ChannelManager#method.process_pending_events
				/// [`ChainMonitor::process_pending_events`]: crate::chain::chainmonitor::ChainMonitor#method.process_pending_events
				open class EventsProvider: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKEventsProvider?

					public init(cType: LDKEventsProvider) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
					}

					public init(cType: LDKEventsProvider, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init() {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func processPendingEventsLambda(this_arg: UnsafeRawPointer?, handler: LDKEventHandler) -> Void {
							let instance: EventsProvider = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "EventsProvider::processPendingEventsLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.processPendingEvents(handler: NativelyImplementedEventHandler(cType: handler))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: EventsProvider = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "EventsProvider::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKEventsProvider(							
							this_arg: thisArg,
							process_pending_events: processPendingEventsLambda,
							free: freeLambda
						)
					}

					
					/// Processes any events generated since the last call using the given event handler.
					/// 
					/// See the trait-level documentation for requirements.
					open func processPendingEvents(handler: EventHandler) -> Void {
						Bindings.print("Error: EventsProvider::processPendingEvents MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					open func free() -> Void {
						Bindings.print("Error: EventsProvider::free MUST be overridden! Offending class: (String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					

					

					internal func dangle() -> EventsProvider {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing EventsProvider \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing EventsProvider \(self.instanceNumber) due to dangle.")
						}
					}
				}

				internal class NativelyImplementedEventsProvider: EventsProvider {
					
					/// Processes any events generated since the last call using the given event handler.
					/// 
					/// See the trait-level documentation for requirements.
					public override func processPendingEvents(handler: EventHandler) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.process_pending_events(self.cType!.this_arg, handler.activate().cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					public override func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = self.cType!.free(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
				}

			}
		