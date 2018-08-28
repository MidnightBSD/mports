# Created by: Kris Kennaway <kris@FreeBSD.org>
# $MidnightBSD$

PORTNAME=	impress
PORTVERSION=	1.1b9
PORTREVISION=	2
CATEGORIES=	editors tk
MASTER_SITES=	http://www.ntlug.org/~ccox/impress/
DISTNAME=	imp${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Publishing and presentation tool

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual

OPTIONS_DEFINE=	DOCS

NO_BUILD=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
USES+=		tk

PORTDOCS=	*
PLIST_FILES=	bin/impress

.include <bsd.mport.options.mk>

post-patch:
	${REINPLACE_CMD} -e 's|exec wish|exec ${WISH}|g' \
	    ${WRKSRC}/src/impress.tcl

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/src/impress.tcl ${PREFIX}/bin/impress
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC}/src/doc && ${COPYTREE_SHARE} . ${DOCSDIR}
.endif

.include <bsd.port.mk>
