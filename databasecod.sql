CREATE TABLE [sexo] (
  [id] INT PRIMARY KEY IDENTITY(1, 1),
  [sexo] VARCHAR(10) UNIQUE NOT NULL
)
GO

CREATE TABLE [profesion] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [nombre] varchar(100) UNIQUE NOT NULL
)
GO

CREATE TABLE [pais] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [nombre] varchar(100) UNIQUE NOT NULL
)
GO

CREATE TABLE [telefonoTipo] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [tipo] nvarchar(25) NOT NULL
)
GO

CREATE TABLE [direccion] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [descripcion] varchar(255) NOT NULL
)
GO

CREATE TABLE [rol] (
  [id] INT PRIMARY KEY IDENTITY(1, 1),
  [rol] VARCHAR(20) UNIQUE NOT NULL
)
GO

CREATE TABLE [usuario] (
  [id] INT PRIMARY KEY IDENTITY(1, 1),
  [nombre] VARCHAR(100) NOT NULL,
  [telefonoTipo_id] INT NOT NULL,
  [telefono] INT,
  [profesion_id] INT NOT NULL,
  [pais_id] INT NOT NULL,
  [direccion_id] INT NOT NULL,
  [email] VARCHAR(100) UNIQUE NOT NULL,
  [NIT] INT NOT NULL,
  [contraseña] VARCHAR(255) NOT NULL,
  [sexo_id] INT NOT NULL,
  [rol_id] INT NOT NULL,
  [fecha_registro] datetime
)
GO

CREATE TABLE [donacion] (
  [id] INT PRIMARY KEY IDENTITY(1, 1),
  [usuario_id] INT NOT NULL,
  [monto] DECIMAL(10,2) NOT NULL,
  [fecha_donacion] datetime ,
  [voucher] VARBINARY(2048) NOT NULL
)
GO

CREATE TABLE [detalle_donacion] (
  [id] INT PRIMARY KEY IDENTITY(1, 1),
  [donacion_id] INT NOT NULL,
  [id_programa] INT NOT NULL,
  [tipo_servicio] INT NOT NULL,
  [comentario] TEXT,
  [cantidad] INT,
  [fecha_detalle] datetime
)
GO

CREATE TABLE [programa] (
  [id] INT PRIMARY KEY IDENTITY(1, 1),
  [descripcion] varchar(100)
)
GO

CREATE TABLE [servicio] (
  [id] INT PRIMARY KEY IDENTITY(1, 1),
  [descripcion] varchar(100)
)
GO

CREATE TABLE [token_acceso] (
  [id] INT PRIMARY KEY IDENTITY(1, 1),
  [usuario_id] INT NOT NULL,
  [token] VARCHAR(500) NOT NULL,
  [fecha_emision] datetime,
  [fecha_expiracion] datetime NOT NULL,
  [estado] INT NOT NULL
)
GO

CREATE TABLE [permiso] (
  [id] INT PRIMARY KEY IDENTITY(1, 1),
  [nombre] VARCHAR(50) UNIQUE NOT NULL,
  [descripcion] TEXT
)
GO

CREATE TABLE [rol_permiso] (
  [id] INT PRIMARY KEY IDENTITY(1, 1),
  [rol_id] INT NOT NULL,
  [permiso_id] INT NOT NULL
)
GO

CREATE TABLE [contacto] (
  [id] INT PRIMARY KEY IDENTITY(1, 1),
  [usuario_id] INT,
  [nombre_cliente] VARCHAR(100) NOT NULL,
  [email_cliente] VARCHAR(100) NOT NULL,
  [asunto] VARCHAR(100) NOT NULL,
  [mensaje] TEXT NOT NULL,
  [fecha_envio] datetime 
)
GO

CREATE TABLE [testimonio] (
  [id] INT PRIMARY KEY IDENTITY(1, 1),
  [usuario_id] INT,
  [nombre_autor] VARCHAR(100) NOT NULL,
  [contenido] TEXT NOT NULL,
  [fecha_envio] datetime 
)
GO

ALTER TABLE [usuario] ADD FOREIGN KEY ([telefonoTipo_id]) REFERENCES [telefonoTipo] ([id])
GO

ALTER TABLE [usuario] ADD FOREIGN KEY ([profesion_id]) REFERENCES [profesion] ([id])
GO

ALTER TABLE [usuario] ADD FOREIGN KEY ([pais_id]) REFERENCES [pais] ([id])
GO

ALTER TABLE [usuario] ADD FOREIGN KEY ([direccion_id]) REFERENCES [direccion] ([id])
GO

ALTER TABLE [usuario] ADD FOREIGN KEY ([sexo_id]) REFERENCES [sexo] ([id])
GO

ALTER TABLE [usuario] ADD FOREIGN KEY ([rol_id]) REFERENCES [rol] ([id])
GO

ALTER TABLE [donacion] ADD FOREIGN KEY ([usuario_id]) REFERENCES [usuario] ([id])
GO

ALTER TABLE [detalle_donacion] ADD FOREIGN KEY ([donacion_id]) REFERENCES [donacion] ([id])
GO

ALTER TABLE [token_acceso] ADD FOREIGN KEY ([usuario_id]) REFERENCES [usuario] ([id])
GO

ALTER TABLE [rol_permiso] ADD FOREIGN KEY ([rol_id]) REFERENCES [rol] ([id])
GO

ALTER TABLE [rol_permiso] ADD FOREIGN KEY ([permiso_id]) REFERENCES [permiso] ([id])
GO

ALTER TABLE [contacto] ADD FOREIGN KEY ([usuario_id]) REFERENCES [usuario] ([id])
GO

ALTER TABLE [testimonio] ADD FOREIGN KEY ([usuario_id]) REFERENCES [usuario] ([id])
GO

ALTER TABLE [detalle_donacion] ADD FOREIGN KEY ([id_programa]) REFERENCES [programa] ([id])
GO

ALTER TABLE [detalle_donacion] ADD FOREIGN KEY ([tipo_servicio]) REFERENCES [servicio] ([id])
GO
