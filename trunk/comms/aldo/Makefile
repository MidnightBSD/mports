# $MidnightBSD: mports/comms/aldo/Makefile,v 1.3 2009/09/20 00:11:24 laffer1 Exp $

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
USE_AUTOTOOLS=	autoconf automake libtool aclocal
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.1
CONFIGURE_ARGS=	--includedir="${LOCALBASE}/include" \
		--libdir="${LOCALBASE}/lib"
USE_GMAKE=	yes
MAKE_ENV=	CXX="${CXX}" CXXFLAGS="${CXXFLAGS}"

PLIST_FILES=	bin/aldo
MAN1=	aldo.1

post-patch:
	@${REINPLACE_CMD} -e 's|1.10|1.10.1|g' ${WRKSRC}/aclocal.m4
	@${REINPLACE_CMD} -e 's|2.61|2.62|g' ${WRKSRC}/aclocal.m4

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/aldo ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/aldo.1 ${MANPREFIX}/man/man1

.include <bsd.port.mk>
