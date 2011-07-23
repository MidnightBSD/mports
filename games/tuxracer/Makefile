# $MidnightBSD: mports/games/tuxracer/Makefile,v 1.7 2011/02/02 21:01:20 laffer1 Exp $

PORTNAME=	tuxracer
PORTVERSION=	0.61
PORTREVISION=	8
CATEGORIES=	games
MASTER_SITES=	SF
DISTFILES=	${PORTNAME}-${PORTVERSION}.tar.gz \
		${PORTNAME}-data-${PORTVERSION}.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A 3d penguin racing game using OpenGL
LICENSE=	gpl2

LIB_DEPENDS=	tcl85:${PORTSDIR}/lang/tcl85

USE_SDL=	mixer sdl
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

WORKDATA=	${WRKDIR}/${PORTNAME}-data-${PORTVERSION}
COURSEDIRS=	1 2 3 4 5 6 7 8 9 10 11

post-extract:
	@${RM} ${WRKSRC}/missing

post-install:
	@${MKDIR} ${DATADIR}
	@(${CHMOD} -R o+r ${WORKDATA} && cd ${WORKDATA} && ${TAR} -c -f - *) | \
		(cd ${DATADIR} && ${TAR} -x -f - )

.include <bsd.port.mk>
