PORTNAME=	xml2c
PORTVERSION=	20151019
CATEGORIES=	converters
MASTER_SITES=	https://acme.com/software/xml2c/
DISTNAME=	${PORTNAME}_19Oct2015

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convert an XML file into C struct/string declarations
WWW=		https://acme.com/software/xml2c/

LICENSE=	bsd2

USES=		gnome
USE_GNOME=	libxml2

WRKSRC=		${WRKDIR}/xml2c

PLIST_FILES=	bin/xml2c \
		share/man/man1/xml2c.1.gz

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/xml2c ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/xml2c.1 ${STAGEDIR}${PREFIX}/share/man/man1/xml2c.1

.include <bsd.port.mk>
