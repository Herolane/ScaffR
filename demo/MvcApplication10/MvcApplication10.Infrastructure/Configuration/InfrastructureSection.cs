namespace MvcApplication10.Infrastructure.Configuration
{
    using System.Configuration;

    public partial class InfrastructureSection : ConfigurationSection
    {
        public static InfrastructureSection GetConfig()
        {
            return (InfrastructureSection)ConfigurationManager.GetSection("MvcApplication10/MvcApplication10.Infrastructure");
        }
    }
}
