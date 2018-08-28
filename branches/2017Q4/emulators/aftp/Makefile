# $MidnightBSD$
# $FreeBSD: ports/emulators/aftp/Makefile,v 1.11 2004/02/05 20:37:08 trevor Exp $

PORTNAME=	aftp
PORTVERSION=	1.0
CATEGORIES=	emulators
MASTER_SITES=	ftp://ftp.apple.asimov.net/pub/apple_II/utility/
DISTNAME=	${PORTNAME}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FTP-like shell for accessing Apple II disk images

LICENSE=	publicdom

PLIST_FILES=	bin/aftp man/man1/aftp.1.gz

post-patch:
	${REINPLACE_CMD} -e 's|^CC=.*|CC=${CC} ${CPPFLAGS} ${CFLAGS}|' ${WRKSRC}/Makefile

post-install:
	${INSTALL_MAN} ${FILESDIR}/aftp.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
