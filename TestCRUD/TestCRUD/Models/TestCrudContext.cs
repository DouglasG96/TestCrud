using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace TestCRUD.Models
{
    public partial class TestCrudContext : DbContext
    {
        public TestCrudContext()
        {
        }

        public TestCrudContext(DbContextOptions<TestCrudContext> options)
            : base(options)
        {
        }

        public virtual DbSet<TAlquiler> TAlquilers { get; set; }
        public virtual DbSet<TCompra> TCompras { get; set; }
        public virtual DbSet<TGenero> TGeneros { get; set; }
        public virtual DbSet<TPelicula> TPeliculas { get; set; }
        public virtual DbSet<TRol> TRols { get; set; }
        public virtual DbSet<TUser> TUsers { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("data source=DOUGLAS;initial catalog=TestCrud;Integrated Security = True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Modern_Spanish_CI_AS");

            modelBuilder.Entity<TAlquiler>(entity =>
            {
                entity.HasKey(e => e.CodAlquiler);

                entity.ToTable("tAlquiler");

                entity.Property(e => e.CodAlquiler).HasColumnName("cod_alquiler");

                entity.Property(e => e.CodPelicula).HasColumnName("cod_pelicula");

                entity.Property(e => e.CodUsuario).HasColumnName("cod_usuario");

                entity.Property(e => e.Estado).HasColumnName("estado");

                entity.Property(e => e.FechaHora)
                    .HasColumnType("datetime")
                    .HasColumnName("fecha_hora");

                entity.Property(e => e.PrecioAlquiler)
                    .HasColumnType("decimal(18, 0)")
                    .HasColumnName("precio_alquiler");

                entity.HasOne(d => d.CodPeliculaNavigation)
                    .WithMany(p => p.TAlquilers)
                    .HasForeignKey(d => d.CodPelicula)
                    .HasConstraintName("FK_tAlquiler_tPelicula");

                entity.HasOne(d => d.CodUsuarioNavigation)
                    .WithMany(p => p.TAlquilers)
                    .HasForeignKey(d => d.CodUsuario)
                    .HasConstraintName("FK_tAlquiler_tUsers");
            });

            modelBuilder.Entity<TCompra>(entity =>
            {
                entity.HasKey(e => e.CodCompras);

                entity.ToTable("tCompra");

                entity.Property(e => e.CodCompras).HasColumnName("cod_compras");

                entity.Property(e => e.CodPelicula).HasColumnName("cod_pelicula");

                entity.Property(e => e.CodUsuario).HasColumnName("cod_usuario");

                entity.Property(e => e.Estado).HasColumnName("estado");

                entity.Property(e => e.FechaHora)
                    .HasColumnType("datetime")
                    .HasColumnName("fecha_hora");

                entity.Property(e => e.Precio)
                    .HasColumnType("decimal(18, 0)")
                    .HasColumnName("precio");

                entity.HasOne(d => d.CodPeliculaNavigation)
                    .WithMany(p => p.TCompras)
                    .HasForeignKey(d => d.CodPelicula)
                    .HasConstraintName("FK_tCompra_tPelicula");

                entity.HasOne(d => d.CodUsuarioNavigation)
                    .WithMany(p => p.TCompras)
                    .HasForeignKey(d => d.CodUsuario)
                    .HasConstraintName("FK_tCompra_tUsers");
            });

            modelBuilder.Entity<TGenero>(entity =>
            {
                entity.HasKey(e => e.CodGenero)
                    .HasName("PK__tGenero__0DACB9D5AAC0DCD3");

                entity.ToTable("tGenero");

                entity.Property(e => e.CodGenero).HasColumnName("cod_genero");

                entity.Property(e => e.TxtDesc)
                    .HasMaxLength(500)
                    .IsUnicode(false)
                    .HasColumnName("txt_desc");
            });

            modelBuilder.Entity<TPelicula>(entity =>
            {
                entity.HasKey(e => e.CodPelicula)
                    .HasName("PK__tPelicul__225F6E08ED594EE0");

                entity.ToTable("tPelicula");

                entity.Property(e => e.CodPelicula).HasColumnName("cod_pelicula");

                entity.Property(e => e.CantDisponiblesAlquiler).HasColumnName("cant_disponibles_alquiler");

                entity.Property(e => e.CantDisponiblesVenta).HasColumnName("cant_disponibles_venta");

                entity.Property(e => e.CodGenero).HasColumnName("cod_genero");

                entity.Property(e => e.PrecioAlquiler)
                    .HasColumnType("numeric(18, 2)")
                    .HasColumnName("precio_alquiler");

                entity.Property(e => e.PrecioVenta)
                    .HasColumnType("numeric(18, 2)")
                    .HasColumnName("precio_venta");

                entity.Property(e => e.TxtDesc)
                    .HasMaxLength(500)
                    .IsUnicode(false)
                    .HasColumnName("txt_desc");
            });

            modelBuilder.Entity<TRol>(entity =>
            {
                entity.HasKey(e => e.CodRol)
                    .HasName("PK__tRol__F13B12115360E8E0");

                entity.ToTable("tRol");

                entity.Property(e => e.CodRol).HasColumnName("cod_rol");

                entity.Property(e => e.SnActivo).HasColumnName("sn_activo");

                entity.Property(e => e.TxtDesc)
                    .HasMaxLength(500)
                    .IsUnicode(false)
                    .HasColumnName("txt_desc");
            });

            modelBuilder.Entity<TUser>(entity =>
            {
                entity.HasKey(e => e.CodUsuario)
                    .HasName("PK__tUsers__EA3C9B1A4050D888");

                entity.ToTable("tUsers");

                entity.Property(e => e.CodUsuario).HasColumnName("cod_usuario");

                entity.Property(e => e.CodRol).HasColumnName("cod_rol");

                entity.Property(e => e.NroDoc)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("nro_doc");

                entity.Property(e => e.SnActivo).HasColumnName("sn_activo");

                entity.Property(e => e.TxtApellido)
                    .HasMaxLength(200)
                    .IsUnicode(false)
                    .HasColumnName("txt_apellido");

                entity.Property(e => e.TxtNombre)
                    .HasMaxLength(200)
                    .IsUnicode(false)
                    .HasColumnName("txt_nombre");

                entity.Property(e => e.TxtPassword)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("txt_password");

                entity.Property(e => e.TxtUser)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("txt_user");

                entity.HasOne(d => d.CodRolNavigation)
                    .WithMany(p => p.TUsers)
                    .HasForeignKey(d => d.CodRol)
                    .HasConstraintName("fk_user_rol");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
