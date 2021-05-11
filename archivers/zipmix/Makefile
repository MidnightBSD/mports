# Created by: Mario Sergio Fujikawa Ferreira <lioux@FreeBSD.org>

PORTNAME=	zipmix
DISTVERSION=	20070221
CATEGORIES=	archivers
MASTER_SITES=	http://www.advsys.net/ken/util/ \
		https://BSDforge.com/projects/source/archivers/zipmix/
DISTNAME=	${PORTNAME}_src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Produce .ZIP file from two other ones with the best compressed files

LICENSE=	other

USES=		dos2unix ncurses zip
MAKEFILE=	${FILESDIR}/Makefile
NO_WRKSUBDIR=	yes

PLIST_FILES=	bin/${PORTNAME}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
