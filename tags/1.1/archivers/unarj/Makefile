# $MidnightBSD$
# $FreeBSD: ports/archivers/unarj/Makefile,v 1.22 2006/08/23 06:34:55 ache Exp $

PORTNAME=	unarj
PORTVERSION=	2.65
PORTREVISION=	2
CATEGORIES=	archivers
MASTER_SITES=	https://googledrive.com/host/0BwCT-sp3iBCaeDRPYm1jTjl1Qmc/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Allows files to be extracted from ARJ archives

LICENSE=	unarj
LICENSE_NAME=	unarj license
LICENSE_FILE=	${WRKSRC}/unarj.txt
LICENSE_PERMS=	dist-mirror pkg-mirror

USES=	tar:tgz

PLIST_FILES=	bin/unarj
PORTDOCS=	unarj.txt technote.txt

OPTIONS_DEFINE=	DOCS

post-patch:
	${CP} ${FILESDIR}/sanitize.c ${WRKSRC}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/unarj ${PREFIX}/bin
	${INSTALL} -d -m 755 -o ${SHAREOWN} -g ${SHAREGRP} ${DOCSDIR}
.for i in ${PORTDOCS}	
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor

.include <bsd.port.mk>
