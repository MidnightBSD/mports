PORTNAME=	cabextract
PORTVERSION=	1.11
PORTREVISION=	1
CATEGORIES=	archivers
MASTER_SITES=	https://www.cabextract.org.uk/ \
		FREEBSD_LOCAL/sunpoet

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Program to extract Microsoft cabinet (.CAB) files
WWW=		https://www.cabextract.org.uk/ \
		https://github.com/kyz/libmspack/tree/master/cabextract

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cpe iconv

GNU_CONFIGURE=	yes

CPE_VENDOR=	cabextract_project

DOCS=		AUTHORS ChangeLog NEWS README TODO \
		doc/magic doc/wince_cab_format.html \
		src/wince_info src/wince_rename

OPTIONS_DEFINE=	DOCS

post-install:
	${MKDIR} ${PREFIX}/share/man/ja/man1
	${INSTALL_MAN} ${WRKSRC}/doc/ja/cabextract.1 ${PREFIX}/share/man/ja/man1

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
