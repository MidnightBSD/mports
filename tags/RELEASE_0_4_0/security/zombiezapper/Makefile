# $FreeBSD: ports/security/zombiezapper/Makefile,v 1.8 2005/11/14 17:07:05 sem Exp $
# $MidnightBSD: mports/security/zombiezapper/Makefile,v 1.3 2008/10/04 17:14:32 laffer1 Exp $

PORTNAME=	zombiezapper
PORTVERSION=	1.2
PORTREVISION=	2
CATEGORIES=	security
MASTER_SITES=	http://razor.bindview.com/tools/files/
DISTNAME=	zombie-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Send a terminate command to Trinoo/TFN/Stacheldracht DDoS agents
LICENSE=	other

BUILD_DEPENDS=	${LIBNET_CONFIG}:${PORTSDIR}/net/libnet10

LIBNET_CONFIG?=	${LOCALBASE}/bin/libnet10-config

do-build:
	cd ${WRKSRC} && \
	${CC} ${CFLAGS} -o zz zz.c `${LIBNET_CONFIG} --cflags` `${LIBNET_CONFIG} --defines` `${LIBNET_CONFIG} --libs`

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/zz ${PREFIX}/bin/
.if !defined(NOPORTDOCS)
	${MKDIR} ${PREFIX}/share/doc/zz/
	${INSTALL_DATA} ${WRKSRC}/USAGE ${PREFIX}/share/doc/zz/
	${INSTALL_DATA} ${WRKSRC}/tekpaper.txt ${PREFIX}/share/doc/zz/
.endif

.include <bsd.port.mk>
