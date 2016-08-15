# New ports collection makefile for:	hashcash
# Date created:				Jan 30, 2003
# Whom:					bremner@unb.ca
#
# $MidnightBSD$
# $FreeBSD: ports/mail/hashcash/Makefile,v 1.8 2006/05/29 20:55:52 pav Exp $
#

PORTNAME=	hashcash
PORTVERSION=	1.22
CATEGORIES=	mail
MASTER_SITES=	http://www.hashcash.org/source/
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Anti-spam / denial of service counter-measure tool
LICENSE=        bsd3
MAN1=		hashcash.1 sha1-hashcash.1
PLIST_FILES=	bin/hashcash bin/sha1
PORTDOCS=	CHANGELOG LICENSE README
ALL_TARGET=	generic

.if defined(NOPORTDOCS)

post-patch:
	${REINPLACE_CMD} -e '/DOC_INSTALL_PATH/d' ${WRKSRC}/Makefile
.endif

.include <bsd.port.mk>
