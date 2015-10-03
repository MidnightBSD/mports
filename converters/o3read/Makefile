# Created by: samm
# $MidnightBSD$
# $FreeBSD: head/converters/o3read/Makefile 386312 2015-05-14 10:15:04Z mat $

PORTNAME=	o3read
PORTVERSION=	0.0.4
CATEGORIES=	converters
MASTER_SITES=	http://siag.nu/pub/o3read/ \
		GENTOO

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Standalone converter for the OpenOffice.org writer and scalc formats

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

PORTDOCS=	README COPYING ChangeLog

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/o3read ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/o3totxt ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/o3tohtml ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/utf8tolatin1 ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/*.1 ${MAN1PREFIX}/man/man1
	@${MKDIR} ${DOCSDIR}
.for FILE in ${PORTDOCS}
	@${INSTALL_DATA} ${WRKSRC}/${FILE} ${DOCSDIR}
.endfor

.include <bsd.port.mk>
