# $MidnightBSD$

PORTNAME=	tuxracer
PORTVERSION=	0.61
PORTREVISION=	11
CATEGORIES=	games
MASTER_SITES=	SF \
		SF/${PORTNAME}/${PORTNAME}-data/${PORTVERSION}:data
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		${PORTNAME}-data-${PORTVERSION}${EXTRACT_SUFX}:data

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	3D penguin racing game using OpenGL

LICENSE=	gpl2

USE_SDL=	mixer sdl
USE_GL=		gl
USE_XORG=	x11 xt xmu xi
USES=		gmake tk tcl
USE_TK=	yes
USE_TCL=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-tcl-inc="${TCL_INCLUDEDIR}" \
		--with-tcl-libs="${LOCALBASE}/lib" \
		--with-tcl-lib-name=tcl${TCL_VER:S/.//} \
		--with-gl-libs="${LOCALBASE}/lib" \
		--with-gl-inc="${LOCALBASE}/include" \
		--with-data-dir=${DATADIR}
CPPFLAGS+=	-DGLX_GLXEXT_LEGACY

post-install:
	@${MKDIR} ${STAGEDIR}${DATADIR}
	(cd ${WORKDATA} ${WRKDIR}/${PORTNAME}-data-${PORTVERSION} \
		&& ${COPYTREE_SHARE} . ${STAGEDIR}${DATADIR})

.include <bsd.port.mk>
