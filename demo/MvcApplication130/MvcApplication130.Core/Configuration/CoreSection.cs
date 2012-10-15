namespace MvcApplication130.Core.Configuration
{
    using System.Configuration;

    public partial class CoreSection : ConfigurationSection
    {
        public static CoreSection GetConfig()
        {
            return (CoreSection)ConfigurationManager.GetSection("MvcApplication130/MvcApplication130.Core");
        }       
    }
}
