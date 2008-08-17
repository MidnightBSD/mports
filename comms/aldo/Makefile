# New ports collection makefile for:	aldo
# Date created:		16 March 2004
# Whom:			lambert@lambertfam.org
#
# $MidnightBSD$
# $FreeBSD: ports/comms/aldo/Makefile,v 1.12 2007/12/18 12:18:12 db Exp $
#

PORTNAME=	aldo
PORTVERSION=	0.7.5
CATEGORIES=	comms hamradio
MASTER_SITES=	${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Morse code training program
LICENSE=	gpl2

LIB_DEPENDS=	ao:${PORTSDIR}/audio/libao

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	autoconf:261 automake:110 libtool:15 aclocal:110
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd${OSREL}
CONFIGURE_ARGS=	--includedir="${LOCALBASE}/include" \
		--libdir="${LOCALBASE}/lib"
USE_GMAKE=	yes
MAKE_ENV=	CXX="${CXX}" CXXFLAGS="${CXXFLAGS}"

PLIST_FILES=	bin/aldo
MAN1=	aldo.1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/aldo ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/aldo.1 ${MANPREFIX}/man/man1

.include <bsd.port.mk>
