# $MidnightBSD$
# $FreeBSD: ports/devel/chrpath/Makefile,v 1.4 2010/09/20 17:55:49 rene Exp $

PORTNAME=	chrpath
PORTVERSION=	0.16
CATEGORIES=	devel sysutils
MASTER_SITES=	DEBIAN_POOL
DISTNAME=	${PORTNAME}_${PORTVERSION}.orig

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool to modify DT_RPATH in existing ELF binaries

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gmake
GNU_CONFIGURE=	yes

PLIST_FILES=	bin/chrpath man/man1/chrpath.1.gz
PORTDOCS=	AUTHORS ChangeLog NEWS README

OPTIONS_DEFINE=	DOCS

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
.for i in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${i} ${STAGEDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
