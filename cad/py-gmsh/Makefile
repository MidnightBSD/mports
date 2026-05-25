PORTNAME=	gmsh
DISTVERSION=	4.14.0
PORTREVISION=	1
CATEGORIES=	cad python
MASTER_SITES=	https://gmsh.info/src/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME}-${DISTVERSION}-source
DIST_SUBDIR=	gmsh

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Automatic 3D finite element mesh generator (gmsh's own binding)
WWW=		https://gmsh.info/

LICENSE=	AGPLv3plus Apache-2.0 gpl3+ gpl2+ lgpl2.1
LICENSE_COMB=	multi
LICENSE_NAME_AGPLv3plus=	GNU Affero General Public License version 3 or later
LICENSE_TEXT_AGPLv3plus=	GNU Affero General Public License version 3 or later
LICENSE_PERMS_AGPLv3plus=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

BUILD_DEPENDS=	swig:devel/swig
LIB_DEPENDS=	libcgns.so:science/cgnslib \
		libfltk_images.so:x11-toolkits/fltk \
		libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libgmp.so:math/gmp \
		libhdf5.so:science/hdf5 \
		libmedC.so:french/med \
		libpng16.so:graphics/png \
		libsz.so:science/libaec \
		libTKV3d.so:cad/opencascade

USES=		cmake gl gnome jpeg python tar:tgz xorg
USE_PYTHON=	flavors
USE_GNOME=	cairo
USE_GL=		gl glu
USE_XORG=	ice sm x11 xcursor xext xfixes xft xinerama xrender
USE_LDCONFIG=	${PYTHON_SITELIBDIR}

PATCHDIR=	${PORTSDIR}/cad/gmsh/files

CMAKE_ON=	ENABLE_WRAP_PYTHON ENABLE_PRIVATE_API ENABLE_OCC
CMAKE_ARGS=	-DOCC_INC=${LOCALBASE}/include/OpenCASCADE

CXXFLAGS_powerpc64=	-mvsx

post-install: # remove all except for the python binding
	@cd ${STAGEDIR}${PREFIX} && \
		${RM} -r \
			bin/* \
			include/gmsh* \
			lib/gmsh.jl \
			share/doc/gmsh \
			share/man/man1/gmsh.1
	# move "private API" libs to the python folder
	@cd ${STAGEDIR} && \
		${MV} \
			${STAGEDIR}${PREFIX}/lib/gmsh* \
			${STAGEDIR}${PREFIX}/lib/lib* \
			${STAGEDIR}${PYTHON_SITELIBDIR}

.include <bsd.port.mk>
