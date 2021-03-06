USE [Jif]
GO
/****** Object:  StoredProcedure [dbo].[nuevoClienteF]    Script Date: 28/11/2018 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[nuevoClienteF]
@b int, @idCliente int, @nombre varchar (50), @apellido varchar (50), @telefono char(15)
AS
BEGIN

	SET NOCOUNT ON;
	if @b=1
	INSERT INTO ClienteF VALUES (@nombre, @apellido, @telefono);

	if @b=2
	SELECT * FROM ClienteF

	if @b=3
	UPDATE ClienteF SET nombre= @nombre, apellido=@apellido, telefono=@telefono
	WHERE idCliente = @idCliente

	if @b=4
	DELETE FROM ClienteF WHERE idCliente= @idCliente
	  
	if @b=5
	SELECT * FROM ClienteF
	WHERE idCliente=@idCliente

	if @b=6
	SELECT * FROM ClienteF
	WHERE nombre LIKE '%' + @nombre

END

GO
/****** Object:  StoredProcedure [dbo].[nuevoCred_Prod]    Script Date: 28/11/2018 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[nuevoCred_Prod]
@b int, @id_cp int, @id_producto int, @id_credito int
AS
BEGIN

	SET NOCOUNT ON;
	if @b=1
	INSERT INTO Cred_prod VALUES (@id_producto, @id_credito);

	if @b=2
	SELECT * FROM Cred_prod

	if @b=3
	UPDATE Cred_prod SET id_producto= @id_producto, id_credito=@id_credito
	WHERE @id_cp =@id_cp

	if @b=4
	DELETE FROM Cred_prod WHERE id_cp = @id_cp
	  
	if @b=5
	SELECT * FROM Cred_prod
	WHERE id_cp = @id_cp

	if @b=6
	SELECT * FROM Cred_prod
	WHERE id_cp LIKE '%' + @id_cp
END

GO
/****** Object:  StoredProcedure [dbo].[nuevoCredito]    Script Date: 28/11/2018 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[nuevoCredito]
@b int, @id_credito int, @Fecha_inicio varchar(15), @Fecha_cancelacion varchar(15), @monto_total numeric(8,5), @estado varchar(20), @idCliente int
AS
BEGIN

	SET NOCOUNT ON;
	if @b=1
	INSERT INTO Credito VALUES (@Fecha_inicio, @Fecha_cancelacion, @monto_total, @estado, @idCliente);

	if @b=2
	SELECT * FROM Credito

	if @b=3
	UPDATE Credito SET Fecha_inicio =@Fecha_inicio, Fecha_cancelacion =@Fecha_cancelacion, monto_total=@monto_total, estado=@estado, idCliente = @idCliente
	WHERE id_credito =@id_credito

	if @b=4
	DELETE FROM Credito WHERE id_credito =@id_credito
	  
	if @b=5
	SELECT * FROM Credito
	WHERE id_credito =@id_credito

	if @b=6
	SELECT * FROM Credito
	WHERE estado LIKE '%' + @estado
END

GO
/****** Object:  StoredProcedure [dbo].[nuevoProducto]    Script Date: 28/11/2018 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[nuevoProducto]
@b int, @id_producto int, @nombre varchar(50), @marca varchar(50), @precio numeric(8,5)
AS
BEGIN

	SET NOCOUNT ON;
	if @b=1
	INSERT INTO Producto VALUES (@nombre, @marca, @precio);

	if @b=2
	SELECT * FROM Producto

	if @b=3
	UPDATE Producto SET nombre= @nombre, marca =@marca
	WHERE id_producto =@id_producto

	if @b=4
	DELETE FROM Producto WHERE id_producto=@id_producto
	  
	if @b=5
	SELECT * FROM Producto
	WHERE id_producto=@id_producto

	if @b=6
	SELECT * FROM Producto
	WHERE nombre LIKE '%' + @nombre
END

GO
/****** Object:  Table [dbo].[ClienteF]    Script Date: 28/11/2018 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClienteF](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[telefono] [char](15) NOT NULL,
 CONSTRAINT [PK_ClienteF] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cred_prod]    Script Date: 28/11/2018 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cred_prod](
	[id_cp] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NOT NULL,
	[id_credito] [int] NOT NULL,
 CONSTRAINT [PK_Cred_prod] PRIMARY KEY CLUSTERED 
(
	[id_cp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Credito]    Script Date: 28/11/2018 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Credito](
	[id_credito] [int] IDENTITY(1,1) NOT NULL,
	[Fecha_inicio] [varchar](15) NOT NULL,
	[Fecha_cancelacion] [varchar](15) NOT NULL,
	[monto_total] [numeric](8, 5) NOT NULL,
	[estado] [varchar](20) NOT NULL,
	[idCliente] [int] NOT NULL,
 CONSTRAINT [PK_Credito] PRIMARY KEY CLUSTERED 
(
	[id_credito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 28/11/2018 14:34:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[marca] [varchar](50) NOT NULL,
	[precio] [numeric](8, 5) NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ClienteF] ON 

INSERT [dbo].[ClienteF] ([idCliente], [nombre], [apellido], [telefono]) VALUES (1, N'Ibrahim John', N'Gonzalez Obando', N'89563214       ')
INSERT [dbo].[ClienteF] ([idCliente], [nombre], [apellido], [telefono]) VALUES (3, N'Jessnangel isamar', N'Nuñez Saballos', N'89341267       ')
INSERT [dbo].[ClienteF] ([idCliente], [nombre], [apellido], [telefono]) VALUES (4, N'Saira', N'Urbina', N'87432156       ')
INSERT [dbo].[ClienteF] ([idCliente], [nombre], [apellido], [telefono]) VALUES (6, N'Veronica', N'Oporta', N'87345672       ')
INSERT [dbo].[ClienteF] ([idCliente], [nombre], [apellido], [telefono]) VALUES (7, N'Karen', N'Sandoval', N'77452315       ')
SET IDENTITY_INSERT [dbo].[ClienteF] OFF
SET IDENTITY_INSERT [dbo].[Cred_prod] ON 

INSERT [dbo].[Cred_prod] ([id_cp], [id_producto], [id_credito]) VALUES (3, 2, 13)
INSERT [dbo].[Cred_prod] ([id_cp], [id_producto], [id_credito]) VALUES (16, 2, 13)
SET IDENTITY_INSERT [dbo].[Cred_prod] OFF
SET IDENTITY_INSERT [dbo].[Credito] ON 

INSERT [dbo].[Credito] ([id_credito], [Fecha_inicio], [Fecha_cancelacion], [monto_total], [estado], [idCliente]) VALUES (3, N'10/11/17', N'18/11/17', CAST(40.00000 AS Numeric(8, 5)), N'cancelado', 1)
INSERT [dbo].[Credito] ([id_credito], [Fecha_inicio], [Fecha_cancelacion], [monto_total], [estado], [idCliente]) VALUES (5, N'12/09/18', N'25/10/18', CAST(54.00000 AS Numeric(8, 5)), N'cancelado', 1)
INSERT [dbo].[Credito] ([id_credito], [Fecha_inicio], [Fecha_cancelacion], [monto_total], [estado], [idCliente]) VALUES (11, N'12/04/17', N'25/04/17', CAST(255.00000 AS Numeric(8, 5)), N'activo', 4)
INSERT [dbo].[Credito] ([id_credito], [Fecha_inicio], [Fecha_cancelacion], [monto_total], [estado], [idCliente]) VALUES (13, N'01/01/16', N'31/01/16', CAST(55.00000 AS Numeric(8, 5)), N'cancelado', 3)
INSERT [dbo].[Credito] ([id_credito], [Fecha_inicio], [Fecha_cancelacion], [monto_total], [estado], [idCliente]) VALUES (16, N'11/12/17', N'29/12/17', CAST(500.00000 AS Numeric(8, 5)), N'activo', 6)
SET IDENTITY_INSERT [dbo].[Credito] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([id_producto], [nombre], [marca], [precio]) VALUES (2, N'Shampoo bolsita', N'Sedal', CAST(25.00000 AS Numeric(8, 5)))
INSERT [dbo].[Producto] ([id_producto], [nombre], [marca], [precio]) VALUES (3, N'leche fresa', N'eskimo', CAST(15.00000 AS Numeric(8, 5)))
INSERT [dbo].[Producto] ([id_producto], [nombre], [marca], [precio]) VALUES (5, N'papel higienico', N'nevax', CAST(22.00000 AS Numeric(8, 5)))
INSERT [dbo].[Producto] ([id_producto], [nombre], [marca], [precio]) VALUES (8, N'aceite', N'mazola', CAST(75.00000 AS Numeric(8, 5)))
INSERT [dbo].[Producto] ([id_producto], [nombre], [marca], [precio]) VALUES (9, N'jabon lavar traste', N'doña maria', CAST(6.00000 AS Numeric(8, 5)))
INSERT [dbo].[Producto] ([id_producto], [nombre], [marca], [precio]) VALUES (11, N'jabon lavar  ropa', N'xtra', CAST(23.00000 AS Numeric(8, 5)))
INSERT [dbo].[Producto] ([id_producto], [nombre], [marca], [precio]) VALUES (12, N'arroz', N'doña maria', CAST(16.00000 AS Numeric(8, 5)))
SET IDENTITY_INSERT [dbo].[Producto] OFF
ALTER TABLE [dbo].[Cred_prod]  WITH CHECK ADD  CONSTRAINT [FKCred_prodCredito_id_credito] FOREIGN KEY([id_credito])
REFERENCES [dbo].[Credito] ([id_credito])
GO
ALTER TABLE [dbo].[Cred_prod] CHECK CONSTRAINT [FKCred_prodCredito_id_credito]
GO
ALTER TABLE [dbo].[Cred_prod]  WITH CHECK ADD  CONSTRAINT [FKCred_prodProducto_id_producto] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Producto] ([id_producto])
GO
ALTER TABLE [dbo].[Cred_prod] CHECK CONSTRAINT [FKCred_prodProducto_id_producto]
GO
ALTER TABLE [dbo].[Credito]  WITH CHECK ADD  CONSTRAINT [fk_ClienteF] FOREIGN KEY([idCliente])
REFERENCES [dbo].[ClienteF] ([idCliente])
GO
ALTER TABLE [dbo].[Credito] CHECK CONSTRAINT [fk_ClienteF]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [CH_Precio] CHECK  (([precio]>(0)))
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [CH_Precio]
GO
