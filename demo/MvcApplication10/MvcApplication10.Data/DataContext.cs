namespace MvcApplication10.Data
{
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Objects;
	using System.Data.Entity.ModelConfiguration.Conventions;

    using MvcApplication10.Core.Interfaces.Data;
    using MvcApplication10.Core.Model;

    public partial class DataContext : DbContext, IDataContext
    {
// ReSharper disable RedundantArgumentDefaultValue
        public DataContext() : this(true)
// ReSharper restore RedundantArgumentDefaultValue
        {
        }

        public DataContext(bool proxyCreation = true)            
        {
            this.Configuration.ProxyCreationEnabled = proxyCreation;
        }

        public ObjectContext ObjectContext()
        {
            return ((IObjectContextAdapter)this).ObjectContext;
        }

        public virtual IDbSet<T> DbSet<T>() where T : DomainObject
        {
            return Set<T>();
        }

        public new DbEntityEntry Entry<T>(T entity) where T : DomainObject
        {
            return base.Entry(entity);
        }

		protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<OneToManyCascadeDeleteConvention>();
            
            base.OnModelCreating(modelBuilder);
        }
    }    
}