# $MidnightBSD: mports/sysutils/synergy/Makefile,v 1.7 2010/09/04 15:40:01 laffer1 Exp $
# $FreeBSD: ports/sysutils/synergy/Makefile,v 1.14 2007/07/25 01:25:03 kevlo Exp $

PORTNAME=	synergy
PORTVERSION=	1.3.8
DISTVERSIONSUFFIX=	-Source
CATEGORIES=	sysutils
MASTER_SITES=	GOOGLE_CODE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mouse and keyboard sharing utility
LICENSE=	gpl2

USE_CMAKE=	yes
USE_XORG=	ice xtst x11 sm
MAKE_ENV+=	PTHREAD_CFLAGS="${PTHREAD_CFLAGS}" \
		PTHREAD_LIBS="${PTHREAD_LIBS}"

CFLAGS+=	-L${LOCALBASE}/lib -I${LOCALBASE}/include

PLIST_FILES=	bin/synergys bin/synergyc
PORTEXAMPLES=	synergy.conf.example synergy.conf.example-basic \
		synergy.conf.example-advanced

do-install:
.for f in synergys synergyc
	${INSTALL_PROGRAM} ${WRKSRC}/bin/${f} ${PREFIX}/bin
.endfor
.if !defined(NOPORTEXAMPLES)
	${MKDIR} ${EXAMPLESDIR}
.for f in ${PORTEXAMPLES}
	${INSTALL_DATA} ${WRKSRC}/doc/${f} ${EXAMPLESDIR}
.endfor
.endif

.include <bsd.port.mk>
