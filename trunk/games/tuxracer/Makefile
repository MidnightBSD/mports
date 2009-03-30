# $MidnightBSD: mports/games/tuxracer/Makefile,v 1.3 2008/10/21 22:53:44 ctriv Exp $

PORTNAME=	tuxracer
PORTVERSION=	0.61
PORTREVISION=	5
CATEGORIES=	games
MASTER_SITES=	SF/tuxracer
DISTFILES=	${PORTNAME}-${PORTVERSION}.tar.gz \
		${PORTNAME}-data-${PORTVERSION}.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A 3d penguin racing game using OpenGL
LICENSE=	gpl2

LIB_DEPENDS=	tcl83.1:${PORTSDIR}/lang/tcl83

USE_SDL=	mixer sdl
USE_GL=		gl
USE_XORG=	x11 xt xmu xi
USE_GMAKE=	yes
USE_AUTOTOOLS=	automake:14 autoconf:262
AUTOMAKE_ARGS=	-a
CONFIGURE_ENV=	THREAD_LIB="${PTHREAD_LIBS}"
MAKE_ENV=	${CONFIGURE_ENV}
CONFIGURE_ARGS=	--with-tcl-inc="${LOCALBASE}/include/tcl8.3" \
		--with-tcl-libs="${LOCALBASE}/lib" \
		--with-gl-libs="${LOCALBASE}/lib" \
		--with-gl-inc="${LOCALBASE}/include" \
		--with-data-dir=${PREFIX}/share/tuxracer

WORKDATA=	${WRKDIR}/${PORTNAME}-data-${PORTVERSION}
COURSEDIRS=	1 2 3 4 5 6 7 8 9 10 11

post-extract:
	@${RM} ${WRKSRC}/missing

post-install:
	@${MKDIR} ${DATADIR}
	@(${CHMOD} -R o+r ${WORKDATA} && cd ${WORKDATA} && ${TAR} -c -f - *) | \
		(cd ${DATADIR} && ${TAR} -x -f - )

.include <bsd.port.mk>
