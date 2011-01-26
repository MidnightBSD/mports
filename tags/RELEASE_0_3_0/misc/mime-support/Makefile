# New ports collection makefile for:	mime-support
# Date created:		7 March 2003
# Whom:			Simon 'corecode' Schubert <corecode@corecode.ath.cx>
#
# $MidnightBSD: mports/misc/mime-support/Makefile,v 1.4 2008/06/11 01:59:38 laffer1 Exp $
# $FreeBSD: ports/misc/mime-support/Makefile,v 1.12 2006/07/20 15:03:43 oliver Exp $
#

PORTNAME=	mime-support
PORTVERSION=	3.44.1
CATEGORIES=	misc
MASTER_SITES=	${MASTER_SITE_DEBIAN_POOL}
DISTNAME=	${PORTNAME}_${PORTVERSION:C/([0-9]*\.[0-9]*)\.(.*)/\1-\2/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MIME Media Types list
LICENSE=        gpl2

WRKSRC=		${WRKDIR}/${PORTNAME}
NO_BUILD=	yes
PLIST_FILES=	bin/run-mailcap etc/mime.types
MAN1=		run-mailcap.1

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/run-mailcap ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/mime.types ${PREFIX}/etc
	${INSTALL_MAN} ${WRKSRC}/run-mailcap.man ${MANPREFIX}/man/man1/run-mailcap.1

.include <bsd.port.mk>
