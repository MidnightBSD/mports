PORTNAME=	gmsh
DISTVERSION=	5.0.0-git
CATEGORIES=	cad python
MASTER_SITES=	https://distcache.FreeBSD.org/local-distfiles/thierry/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME}-master-23c47b0e6a91f2f67afcbe3bf9ad1b5c253e96e2
DIST_SUBDIR=	gmsh

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automatic 3D finite element mesh generator (gmsh's own binding)
WWW=		https://gmsh.info/

LICENSE=	AGPLv3plus Apache-2.0 gpl3+ gpl2+ lgpl2.1
LICENSE_COMB=	multi
LICENSE_NAME_AGPLv3plus=	GNU Affero General Public License version 3 or later
LICENSE_TEXT_AGPLv3plus=	GNU Affero General Public License version 3 or later
LICENSE_FILE_gpl2+ =	${WRKSRC}/LICENSE.txt
LICENSE_PERMS_AGPLv3plus=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

BUILD_DEPENDS=	swig:devel/swig
LIB_DEPENDS=	libcgns.so:science/cgnslib \
		libfltk_images.so:x11-toolkits/fltk \
		libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libgmp.so:math/gmp \
		libhdf5-110.so:science/hdf5-110 \
		libmmg.so:science/mmg \
		libmedC.so:french/med \
		libpng16.so:graphics/png \
		libsz.so:science/libaec \
		libTKV3d.so:cad/opencascade
LIB_DEPENDS_amd64=	libmesquite.so:math/mesquite

USES=		cmake compiler:c++17-lang gl gnome jpeg python tar:tgz xorg
USE_PYTHON=	flavors
USE_GNOME=	cairo
USE_GL=		gl glu
USE_XORG=	ice sm x11 xcursor xext xfixes xft xinerama xrender
USE_LDCONFIG=	${PYTHON_SITELIBDIR}

WRKSRC=		${WRKDIR}/gmsh-master

CMAKE_ON=	ENABLE_WRAP_PYTHON ENABLE_PRIVATE_API ENABLE_OCC
CMAKE_OFF=	${CMAKE_OFF_${ARCH}}
CMAKE_OFF_i386=	ENABLE_MESQUITE
CMAKE_ARGS=	-DOCC_INC=${LOCALBASE}/include/OpenCASCADE \
		-DGMSHPY_INSTALL_DIRECTORY=${PYTHON_SITELIBDIR}/gmshpy \
		-DHDF5_C_COMPILER_EXECUTABLE:FILEPATH=${LOCALBASE}/bin/h5cc-110 \
		-DHDF5_C_LIBRARY:FILEPATH=${LOCALBASE}/lib/libhdf5-110.so \
		-DHDF5_NO_FIND_PACKAGE_CONFIG_FILE:BOOL=TRUE \
		-DPYTHON_EXECUTABLE:FILEPATH=${PYTHON_CMD} \
		-DPYTHON_INCLUDE_DIR:PATH=${PYTHON_INCLUDEDIR} \
		-DPYTHON_LIBRARY:FILEPATH=${PYTHONBASE}/lib/libpython${PYTHON_VER}.so

post-install: # remove all except for the python binding
	@cd ${PREFIX} && \
		${RM} -r \
			bin/* \
			include/gmsh* \
			lib/gmsh.jl \
			share/doc/gmsh \
			share/man/man1/gmsh.1
	@${RM} -r ${FAKE_DESTDIR}${DATADIR}
	# move "private API" libs to the python folder
	@${MKDIR} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}
	@cd ${PREFIX} && \
		${MV} \
			lib/gmsh* \
			lib/lib* \
			${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

.include <bsd.port.mk>
