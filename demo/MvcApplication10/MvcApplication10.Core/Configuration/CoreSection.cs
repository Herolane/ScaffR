namespace MvcApplication10.Core.Configuration
{
    using System.Configuration;

    public partial class CoreSection : ConfigurationSection
    {
        public static CoreSection GetConfig()
        {
            return (CoreSection)ConfigurationManager.GetSection("MvcApplication10/MvcApplication10.Core");
        }       
    }
}
