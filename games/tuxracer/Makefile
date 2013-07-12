# $MidnightBSD: mports/games/tuxracer/Makefile,v 1.9 2012/02/29 21:14:59 laffer1 Exp $

PORTNAME=	tuxracer
PORTVERSION=	0.61
PORTREVISION=	10
CATEGORIES=	games
MASTER_SITES=	SF \
		SF/${PORTNAME}/${PORTNAME}-data/${PORTVERSION}:data
DISTFILES=	${PORTNAME}-${PORTVERSION}${EXTRACT_SUFX} \
		${PORTNAME}-data-${PORTVERSION}${EXTRACT_SUFX}:data

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	3D penguin racing game using OpenGL
LICENSE=	gpl2

LIB_DEPENDS=	tcl85:${PORTSDIR}/lang/tcl85

USE_SDL=	mixer sdl
USE_TK=		yes
USE_GL=		gl
USE_XORG=	x11 xt xmu xi
USE_GMAKE=	yes
USE_AUTOTOOLS=	automake14 autoconf
AUTOMAKE_ARGS=	-a
CONFIGURE_ENV=	THREAD_LIB="${PTHREAD_LIBS}"
MAKE_ENV=	${CONFIGURE_ENV}
CONFIGURE_ARGS=	--with-tcl-inc="${LOCALBASE}/include/tcl8.5" \
		--with-tcl-libs="${LOCALBASE}/lib" \
		--with-gl-libs="${LOCALBASE}/lib" \
		--with-gl-inc="${LOCALBASE}/include" \
		--with-data-dir=${PREFIX}/share/tuxracer

post-extract:
	@${RM} ${WRKSRC}/missing

post-install:
	@${MKDIR} ${DATADIR}
	@(cd ${WORKDATA} ${WRKDIR}/${PORTNAME}-data-${PORTVERSION} \
		&& ${COPYTREE_SHARE} . ${DATADIR})

.include <bsd.port.mk>
