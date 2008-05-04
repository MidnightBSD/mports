# New ports collection makefile for:  rdesktop
# Date created:               13 December 2000
# Whom:                       mwest@uct.ac.za
#
# $MidnightBSD: mports/net/rdesktop/Makefile,v 1.3 2008/05/04 09:57:46 crash Exp $
# $FreeBSD: ports/net/rdesktop/Makefile,v 1.41 2007/06/19 08:55:10 pav Exp $
#

PORTNAME=	rdesktop
PORTVERSION=	1.5.0
PORTREVISION=	1
CATEGORIES=	net comms
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RDP client for Windows NT/2000/2003 Terminal Server
LICENSE=	gpl2

USE_XORG=	x11
USE_GMAKE=	yes
USE_OPENSSL=	yes
GNU_CONFIGURE=	yes
DOCS=		doc/AUTHORS doc/TODO doc/*.txt
MAN1=		rdesktop.1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/rdesktop ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/doc/rdesktop.1 ${MAN1PREFIX}/man/man1
	@${MKDIR} ${DATADIR}/keymaps
	${INSTALL_DATA} ${WRKSRC}/keymaps/* ${DATADIR}/keymaps
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
