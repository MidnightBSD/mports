# $FreeBSD: ports/security/vnccrack/Makefile,v 1.1 2006/08/20 12:09:31 itetcu Exp $
# $MidnightBSD$

PORTNAME=	vnccrack
PORTVERSION=	1.0.0
PORTREVISION=	2
CATEGORIES=	security
MASTER_SITES=	http://files.randombit.net/vnccrack/
DISTNAME=	VNCcrack-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast offline password cracker for VNC passwords

LICENSE=	gpl2

USES=		ssl
GNU_CONFIGURE=	yes

SUB_FILES+=	pkg-message

OPTIONS_DEFINE=	DOCS

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/vnccrack ${TARGETDIR}/bin/vnccrack

post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/readme.txt ${DOCSDIR}/readme.txt

.include <bsd.port.mk>
