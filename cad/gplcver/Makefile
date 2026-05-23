PORTNAME=	gplcver
PORTVERSION=	2.12.a
CATEGORIES=	cad
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTVERSION:R}${PORTVERSION:E}/
DISTNAME=	${PORTNAME}-${PORTVERSION:R}${PORTVERSION:E}.src

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Verilog HDL simulator
WWW=		https://sourceforge.net/projects/gplcver/

LICENSE=	gpl2

USES=		tar:bzip2 gmake

BUILD_WRKSRC=	${WRKSRC}/src
MAKEFILE=	makefile.freebsd

PLIST_FILES=	bin/cver
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/cver ${PREFIX}/bin

post-install-DOCS-on:
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/* ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/Changelog \
		${WRKSRC}/NEW.CVER.2001.RELEASE.NOTES \
		${WRKSRC}/OUR_PHILOSOPHY ${DOCSDIR}

.include <bsd.port.mk>
