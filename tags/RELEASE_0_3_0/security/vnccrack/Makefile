# New ports collection makefile for:	vnccrack
# Date created:		2006-08-19
# Whom:			Pankov Pavel <pankov_p@mail.ru>
#
# $FreeBSD: ports/security/vnccrack/Makefile,v 1.1 2006/08/20 12:09:31 itetcu Exp $
# $MidnightBSD: mports/security/vnccrack/Makefile,v 1.1 2006/11/09 14:56:44 laffer1 Exp $
#

PORTNAME=	vnccrack
PORTVERSION=	1.0.0
CATEGORIES=	security
MASTER_SITES=	http://files.randombit.net/vnccrack/
DISTNAME=	VNCcrack-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A fast offline password cracker for VNC passwords
LICENSE=	gpl2

GNU_CONFIGURE=	yes
USE_OPENSSL=	yes

SUB_FILES+=	pkg-message

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/vnccrack ${TARGETDIR}/bin/vnccrack

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/readme.txt ${DOCSDIR}/readme.txt
.endif
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
