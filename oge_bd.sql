-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2021 a las 22:13:49
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `oge_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `idAdmin` int(11) NOT NULL,
  `nombre1Admin` varchar(50) NOT NULL,
  `nombre2Admin` varchar(50) DEFAULT NULL,
  `apellido1Admin` varchar(50) NOT NULL,
  `apellido2Admin` varchar(50) DEFAULT NULL,
  `correoAdmin` varchar(50) NOT NULL,
  `telefonoAdmin` varchar(50) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`idAdmin`, `nombre1Admin`, `nombre2Admin`, `apellido1Admin`, `apellido2Admin`, `correoAdmin`, `telefonoAdmin`, `user_name`, `password`) VALUES
(1, 'Abdiel', 'David', 'Arias', 'Asprilla', 'abdiel.arias@uao.edu.co', '000000', 'abdiel.arias', '2175176'),
(2, 'Maria', NULL, 'Brand', NULL, 'brand@uao.edu.co', '0000000000', 'maria.brand', '2171458'),
(3, 'Alejandro', NULL, 'Ochoa', NULL, 'alejandro.ochoa@uao.edu.co', '0000000000', 'alejandro.ochoa', '2180619');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos_contenidos`
--

CREATE TABLE `archivos_contenidos` (
  `idArchivoContenido` int(11) NOT NULL,
  `archivoContenido` varchar(255) DEFAULT NULL,
  `idContenidoFA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `idCarrera` int(11) NOT NULL,
  `nombreCarrera` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`idCarrera`, `nombreCarrera`) VALUES
(1, 'Ingeniería de manufactura - modalidad combinada'),
(2, 'Ingeniería de datos e inteligencia artificial - modalidad combinada'),
(3, 'Ingeniería empresarial - modalidad combinada'),
(4, 'Diseño industrial'),
(5, 'Ingeniería ambiental'),
(6, 'Ingeniería biomédica'),
(7, 'Ingeniería eléctrica'),
(8, 'Ingeniería electrónica y telecomunicaciones'),
(9, 'Ingeniería industrial'),
(10, 'Ingeniería informática'),
(11, 'Ingeniería mecánica'),
(12, 'Ingeniería mecatrónica'),
(13, 'Ingeniería multimedia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `idComentario` int(11) NOT NULL,
  `descripcionComentario` varchar(300) NOT NULL,
  `fechaComentario` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `codigoCuentaFCom` int(11) NOT NULL,
  `idContenidoFCom` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenidos`
--

CREATE TABLE `contenidos` (
  `idContenido` int(11) NOT NULL,
  `fechaPublicacionC` datetime NOT NULL DEFAULT current_timestamp(),
  `descripcionC` varchar(255) NOT NULL,
  `archivoC` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `contenidos`
--

INSERT INTO `contenidos` (`idContenido`, `fechaPublicacionC`, `descripcionC`, `archivoC`) VALUES
(2, '2021-06-04 10:34:45', 'Post 2', 0x6d3630613634386330346564306265306330633932363437312e6a7067),
(3, '2021-06-04 11:00:42', 'Post 3', 0x39393335376535323332323334616638643364303263643864356566623633345f66626239396461333839393833303166323463333563613663343561616433395f5f303031345f62617469646f636869616d616e676f6c696d6f6e6164616d616e676f5f313230305f3630302e6a7067),
(4, '2021-06-04 11:06:50', 'Post 4', 0x64303630393439373464303138306235623865663066656364666332383435335f50415354415f434f4e5f544f4d4154455f595f53415244494e415f313230305f3630302e6a7067),
(5, '2021-06-04 15:27:37', 'Post 5', 0x3630613634386330346564306265306330633932363437322e6a7067),
(6, '2021-06-04 15:28:33', 'Post 6', 0x39393335376535323332323334616638643364303263643864356566623633345f66626239396461333839393833303166323463333563613663343561616433395f5f303031345f62617469646f636869616d616e676f6c696d6f6e6164616d616e676f5f313230305f3630302e6a7067),
(33, '2021-06-04 18:01:49', 'Post 7', 0x6d3630613634386330346564306265306330633932363437312e6a7067);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contenidossd`
--

CREATE TABLE `contenidossd` (
  `idContenido` int(11) NOT NULL,
  `fechaPublicacionC` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `descripcionC` varchar(300) DEFAULT NULL,
  `idGrupoFCont` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `idCuenta` int(11) NOT NULL,
  `nombre1Cuenta` varchar(50) NOT NULL,
  `nombre2Cuenta` varchar(50) NOT NULL,
  `apellido1Cuenta` varchar(50) NOT NULL,
  `apellido2Cuenta` varchar(50) NOT NULL,
  `correoInstitucional` varchar(100) NOT NULL,
  `numeroCelular` varchar(10) NOT NULL,
  `usuarioCuenta` varchar(50) NOT NULL,
  `contraseniaCuenta` varchar(50) NOT NULL,
  `esCoordinador` tinyint(1) NOT NULL,
  `nombreCarrera` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`idCuenta`, `nombre1Cuenta`, `nombre2Cuenta`, `apellido1Cuenta`, `apellido2Cuenta`, `correoInstitucional`, `numeroCelular`, `usuarioCuenta`, `contraseniaCuenta`, `esCoordinador`, `nombreCarrera`) VALUES
(22, 'Hello', 'Mundo', 'World', 'Hola', 'root@uao.edu.co', '3167573985', 'coordinador', 'root', 1, 'Ingeniería multimedia'),
(25, 'n1 est1', 'n2 est1', 'a1 est1', 'a2 est1', 'correoest1@uao.edu.co', '3100000000', 'n1', 'n1', 0, 'Ingeniería mecatrónica'),
(26, 'n1 est2', 'n2 est2', 'a1 est2', 'a2 est2', 'correoest2@uao.edu.co', '3110000000', 'n1', 'n2', 0, 'Ingeniería informática');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentasd`
--

CREATE TABLE `cuentasd` (
  `idCuenta` int(11) NOT NULL,
  `nombre1Cuenta` varchar(50) NOT NULL,
  `nombre2Cuenta` varchar(50) DEFAULT NULL,
  `apellido1Cuenta` varchar(50) NOT NULL,
  `apellido2Cuenta` varchar(50) DEFAULT NULL,
  `correoInstitucional` varchar(50) NOT NULL,
  `numeroCelular` varchar(50) NOT NULL,
  `usuarioCuenta` varchar(50) NOT NULL,
  `contraseniaCuenta` varchar(50) NOT NULL,
  `esCoordinador` tinyint(4) DEFAULT NULL,
  `idCarreraFC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuentasd`
--

INSERT INTO `cuentasd` (`idCuenta`, `nombre1Cuenta`, `nombre2Cuenta`, `apellido1Cuenta`, `apellido2Cuenta`, `correoInstitucional`, `numeroCelular`, `usuarioCuenta`, `contraseniaCuenta`, `esCoordinador`, `idCarreraFC`) VALUES
(2175180, 'xd', 'xd', 'xd', 'xd', 'xd', '3', 'xd', 'xd', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos_estudiantilessd`
--

CREATE TABLE `grupos_estudiantilessd` (
  `idGrupo` int(11) NOT NULL,
  `nombreGrupo` varchar(50) NOT NULL,
  `descripcionGrupo` varchar(50) DEFAULT NULL,
  `correoGrupo` varchar(50) NOT NULL,
  `telefonoGrupo` varchar(50) DEFAULT NULL,
  `idAdminFG` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grupos_estudiantilessd`
--

INSERT INTO `grupos_estudiantilessd` (`idGrupo`, `nombreGrupo`, `descripcionGrupo`, `correoGrupo`, `telefonoGrupo`, `idAdminFG`) VALUES
(1, 'programadores uao', 'nos gusta programar', 'programadores@uao.edu.co', '3000000000', 2),
(3, '3Draftsman', 'Aprende a modelar en 3d ', 'aprende3d@uao.edu.co', '3000000001', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_perfiles`
--

CREATE TABLE `imagenes_perfiles` (
  `idImagen` int(11) NOT NULL,
  `imagenP` longblob DEFAULT NULL,
  `idGrupoFIm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `idInscripcion` int(11) NOT NULL,
  `fechaInscripcion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `codigoCuentaFI` int(11) NOT NULL,
  `idGrupoFI` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `likes`
--

CREATE TABLE `likes` (
  `idLike` int(11) NOT NULL,
  `codigoCuentaFL` int(11) NOT NULL,
  `idContenidoFL` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Indices de la tabla `archivos_contenidos`
--
ALTER TABLE `archivos_contenidos`
  ADD PRIMARY KEY (`idArchivoContenido`),
  ADD KEY `archivos_contenidos_ibfk_1` (`idContenidoFA`);

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`idCarrera`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`idComentario`),
  ADD KEY `comentarios_ibfk_1` (`codigoCuentaFCom`),
  ADD KEY `comentarios_ibfk_2` (`idContenidoFCom`);

--
-- Indices de la tabla `contenidos`
--
ALTER TABLE `contenidos`
  ADD PRIMARY KEY (`idContenido`);

--
-- Indices de la tabla `contenidossd`
--
ALTER TABLE `contenidossd`
  ADD PRIMARY KEY (`idContenido`),
  ADD KEY `contenidos_ibfk_1` (`idGrupoFCont`);

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`idCuenta`);

--
-- Indices de la tabla `cuentasd`
--
ALTER TABLE `cuentasd`
  ADD PRIMARY KEY (`idCuenta`),
  ADD KEY `cuentas_ibfk_1` (`idCarreraFC`);

--
-- Indices de la tabla `grupos_estudiantilessd`
--
ALTER TABLE `grupos_estudiantilessd`
  ADD PRIMARY KEY (`idGrupo`),
  ADD KEY `grupos_estudiantiles_ibfk_1` (`idAdminFG`);

--
-- Indices de la tabla `imagenes_perfiles`
--
ALTER TABLE `imagenes_perfiles`
  ADD PRIMARY KEY (`idImagen`),
  ADD KEY `imagenes_perfiles_ibfk_1` (`idGrupoFIm`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`idInscripcion`),
  ADD KEY `inscripciones_ibfk_1` (`codigoCuentaFI`),
  ADD KEY `inscripciones_ibfk_2` (`idGrupoFI`);

--
-- Indices de la tabla `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`idLike`),
  ADD KEY `likes_ibfk_1` (`codigoCuentaFL`),
  ADD KEY `likes_ibfk_2` (`idContenidoFL`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `archivos_contenidos`
--
ALTER TABLE `archivos_contenidos`
  MODIFY `idArchivoContenido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `idCarrera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `idComentario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contenidos`
--
ALTER TABLE `contenidos`
  MODIFY `idContenido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `contenidossd`
--
ALTER TABLE `contenidossd`
  MODIFY `idContenido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `idCuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `cuentasd`
--
ALTER TABLE `cuentasd`
  MODIFY `idCuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2175193;

--
-- AUTO_INCREMENT de la tabla `grupos_estudiantilessd`
--
ALTER TABLE `grupos_estudiantilessd`
  MODIFY `idGrupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `imagenes_perfiles`
--
ALTER TABLE `imagenes_perfiles`
  MODIFY `idImagen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `idInscripcion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `likes`
--
ALTER TABLE `likes`
  MODIFY `idLike` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `archivos_contenidos`
--
ALTER TABLE `archivos_contenidos`
  ADD CONSTRAINT `archivos_contenidos_ibfk_1` FOREIGN KEY (`idContenidoFA`) REFERENCES `contenidossd` (`idContenido`);

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`codigoCuentaFCom`) REFERENCES `cuentasd` (`idCuenta`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`idContenidoFCom`) REFERENCES `contenidossd` (`idContenido`);

--
-- Filtros para la tabla `contenidossd`
--
ALTER TABLE `contenidossd`
  ADD CONSTRAINT `contenidossd_ibfk_1` FOREIGN KEY (`idGrupoFCont`) REFERENCES `grupos_estudiantilessd` (`idGrupo`);

--
-- Filtros para la tabla `cuentasd`
--
ALTER TABLE `cuentasd`
  ADD CONSTRAINT `cuentasd_ibfk_1` FOREIGN KEY (`idCarreraFC`) REFERENCES `carreras` (`idCarrera`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `grupos_estudiantilessd`
--
ALTER TABLE `grupos_estudiantilessd`
  ADD CONSTRAINT `grupos_estudiantilessd_ibfk_1` FOREIGN KEY (`idAdminFG`) REFERENCES `administradores` (`idAdmin`);

--
-- Filtros para la tabla `imagenes_perfiles`
--
ALTER TABLE `imagenes_perfiles`
  ADD CONSTRAINT `imagenes_perfiles_ibfk_1` FOREIGN KEY (`idGrupoFIm`) REFERENCES `grupos_estudiantilessd` (`idGrupo`);

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`codigoCuentaFI`) REFERENCES `cuentasd` (`idCuenta`),
  ADD CONSTRAINT `inscripciones_ibfk_2` FOREIGN KEY (`idGrupoFI`) REFERENCES `grupos_estudiantilessd` (`idGrupo`);

--
-- Filtros para la tabla `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`codigoCuentaFL`) REFERENCES `cuentasd` (`idCuenta`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`idContenidoFL`) REFERENCES `contenidossd` (`idContenido`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
