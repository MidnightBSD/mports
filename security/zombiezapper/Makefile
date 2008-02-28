# Ports collection makefile for:  zombiezapper
# Date created:			  19 Feb 2000
# Whom:				  Kris Kennaway <kris@FreeBSD.org>
#
# $FreeBSD: ports/security/zombiezapper/Makefile,v 1.8 2005/11/14 17:07:05 sem Exp $
# $MidnightBSD: mports/security/zombiezapper/Makefile,v 1.1 2006/11/09 14:03:52 laffer1 Exp $
#

PORTNAME=	zombiezapper
PORTVERSION=	1.2
PORTREVISION=	1
CATEGORIES=	security
MASTER_SITES=	http://razor.bindview.com/tools/files/
DISTNAME=	zombie-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Send a terminate command to Trinoo/TFN/Stacheldracht DDoS agents

BUILD_DEPENDS=	libnet*<=1.1.0,1:${PORTSDIR}/net/libnet10

LIBNETCONF=	${LOCALBASE}/bin/libnet-config

do-build:
	cd ${WRKSRC} && \
	${CC} ${CFLAGS} -o zz zz.c `${LIBNETCONF} --cflags` `${LIBNETCONF} --defines` `${LIBNETCONF} --libs` -L${LOCALBASE}/lib -I${LOCALBASE}/include

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/zz ${PREFIX}/bin/
.if !defined(NOPORTDOCS)
	${MKDIR} ${PREFIX}/share/doc/zz/
	${INSTALL_DATA} ${WRKSRC}/USAGE ${PREFIX}/share/doc/zz/
	${INSTALL_DATA} ${WRKSRC}/tekpaper.txt ${PREFIX}/share/doc/zz/
.endif

.include <bsd.port.mk>
