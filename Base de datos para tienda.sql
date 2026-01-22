-- TABLA DE PRODUCTOS
CREATE TABLE Productos (
	ID_Producto INT PRIMARY KEY IDENTITY (1,1),
	Nombre TEXT NOT NULL,
	Descripcion TEXT NOT NULL,
	Precio FLOAT NOT NULL,
	Cantidad_en_Stock INT NOT NULL
);

-- TABLA DE CLIENTES 
CREATE TABLE Clientes (
	ID_Cliente INT PRIMARY KEY IDENTITY (1,1),
	Nombre TEXT NOT NULL,
	Apellido TEXT NOT NULL,
	Direccion TEXT NOT NULL,
	Correo_Electronico TEXT NOT NULL,
	Telefono VARCHAR (100) NOT NULL
);

--TABLA DE PEDIDOS
CREATE TABLE Pedidos (
	ID_Pedido INT PRIMARY KEY IDENTITY (1,1),
	ID_Cliente INT,
	Fecha_del_Pedido VARCHAR (50) NOT NULL,
	Estado_del_Pedido VARCHAR (50) NOT NULL,
	CONSTRAINT FK_Pedido
		FOREIGN KEY (ID_Pedido) REFERENCES Clientes (ID_Cliente),
	CONSTRAINT FK_Cliente
		FOREIGN KEY (ID_Cliente) REFERENCES Clientes (ID_Cliente)
);

--TABLA DE DETALLES DEL PEDIDO
CREATE TABLE Detalles_del_pedido (
	ID_Detalle INT PRIMARY KEY IDENTITY (1,1),
	ID_Pedido INT,
	ID_Producto INT,
	Cantidad INT NOT NULL,
	Precio_Unitario FLOAT,
	CONSTRAINT FK_Detalles
		FOREIGN KEY (ID_Detalle) REFERENCES Productos (ID_Producto),
	CONSTRAINT FK_Detalles_Pedido
		FOREIGN KEY (ID_Pedido) REFERENCES Pedidos (ID_Pedido),
	CONSTRAINT FK_Detalles_Producto
		FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto)
);