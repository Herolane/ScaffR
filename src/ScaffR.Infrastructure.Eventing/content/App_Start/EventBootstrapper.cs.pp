[assembly: WebActivator.PreApplicationStartMethod(typeof($rootnamespace$.App_Start.EventBootstrapper), "RegisterEventHandlers")]

namespace $rootnamespace$.App_Start {
	using Core.Infrastructure.Eventing;
    public static class EventBootstrapper {
        public static void RegisterEventHandlers() {            
        }
    }
}