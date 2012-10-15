namespace MvcApplication130.Infrastructure.Configuration
{
    using System.Configuration;

    public partial class InfrastructureSection : ConfigurationSection
    {
        public static InfrastructureSection GetConfig()
        {
            return (InfrastructureSection)ConfigurationManager.GetSection("MvcApplication130/MvcApplication130.Infrastructure");
        }
    }
}
