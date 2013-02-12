[assembly: WebActivator.PreApplicationStartMethod(typeof(MvcApplication10.Bootstrappers.Bootstrapper), "Start")]
[assembly: WebActivator.ApplicationShutdownMethodAttribute(typeof(MvcApplication10.Bootstrappers.Bootstrapper), "Stop")]

namespace MvcApplication10.Bootstrappers
{
    using System;
    using System.Web;
    using System.Web.Http;
    using Controls.DropDown;
    using Infrastructure.DependencyInjection;
    using Microsoft.Web.Infrastructure.DynamicModuleHelper;
    using Ninject;
    using Ninject.Web.Common;

    using Core.Interfaces.Service;
    using Core.Interfaces.Data;
    using Service;
    using Data;

    public partial class Bootstrapper
    {
        private static readonly Ninject.Web.Common.Bootstrapper bootstrapper = new Ninject.Web.Common.Bootstrapper();

        /// <summary>
        /// Starts the application
        /// </summary>
        public static void Start()
        {
            DynamicModuleUtility.RegisterModule(typeof(OnePerRequestHttpModule));
            DynamicModuleUtility.RegisterModule(typeof(NinjectHttpModule));
            bootstrapper.Initialize(CreateKernel);
        }

        /// <summary>
        /// Stops the application.
        /// </summary>
        public static void Stop()
        {
            bootstrapper.ShutDown();
        }

        /// <summary>
        /// Creates the kernel that will manage your application.
        /// </summary>
        /// <returns>The created kernel.</returns>
        private static IKernel CreateKernel()
        {
            var kernel = new StandardKernel();
            kernel.Bind<Func<IKernel>>().ToMethod(ctx => () => new Ninject.Web.Common.Bootstrapper().Kernel);
            kernel.Bind<IHttpModule>().To<HttpApplicationInitializationHttpModule>();
            GlobalConfiguration.Configuration.DependencyResolver = new NinjectResolver(kernel);
            RegisterServices(kernel);
            return kernel;
        }

        /// <summary>
        /// Load your modules or register your services here!
        /// </summary>
        /// <param name="kernel">The kernel.</param>
        private static void RegisterServices(IKernel kernel)
        {
            kernel.Bind<IDatabaseFactory>().To<DatabaseFactory>().InRequestScope();
            kernel.Bind<IUnitOfWork>().To<UnitOfWork>().InRequestScope();
            kernel.Bind<IDropdownProvider>().To<Dropdowns.Dropdowns>();
        }
    }
}