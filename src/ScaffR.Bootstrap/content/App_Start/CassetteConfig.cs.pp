namespace $rootnamespace$.App_Start
{
	using Cassette;
	using Cassette.Scripts;
	using Cassette.Stylesheets;

    /// <summary>
    /// Configures the Cassette asset bundles for the web application.
    /// </summary>
    public class CassetteConfig : IConfiguration<BundleCollection>
    {
        public void Configure(BundleCollection bundles)
        {
            bundles.AddPerSubDirectory<StylesheetBundle>("Content/Framework");
            bundles.AddPerSubDirectory<StylesheetBundle>("Content/Global");
            bundles.AddPerSubDirectory<StylesheetBundle>("Content/Custom");
            
            bundles.AddPerIndividualFile<ScriptBundle>("Scripts");
            bundles.AddPerSubDirectory<ScriptBundle>("Scripts/Global");
        }
    }
}