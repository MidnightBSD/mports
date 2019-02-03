# $MidnightBSD$
# $FreeBSD: ports/devel/m17n-docs/Makefile,v 1.10 2010/02/04 04:02:35 pgollucci Exp $

PORTNAME=	m17n-docs
PORTVERSION=	1.5.5
CATEGORIES=	devel
MASTER_SITES=	http://anthesphoria.net/FreeBSD/ports/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The m17n library documentation
LICENSE=	lgpl2.1

NO_BUILD=	yes

OPTIONS=	JAPANESE "Install Japanese documentation (HTML and PDF)" off

.include <bsd.mport.options.mk>

.if defined(WITH_JAPANESE)
PLIST_SUB+=	JAPANESE=""
.else
PLIST_SUB+=	JAPANESE="@comment "
.endif

DOCSDIR=	${PREFIX}/share/doc/m17n

do-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}/en
	${INSTALL_MAN} ${WRKSRC}/man/man1/* ${STAGEDIR}${MAN1PREFIX}/man/man1
	${INSTALL_MAN} ${WRKSRC}/man/man3/* ${STAGEDIR}${MAN3PREFIX}/man/man3
	${INSTALL_MAN} ${WRKSRC}/man/man5/* ${STAGEDIR}${MAN5PREFIX}/man/man5
	${INSTALL_MAN} ${WRKSRC}/usr/latex/m17n-lib.pdf ${STAGEDIR}${DOCSDIR}/en
	(cd ${WRKSRC}/usr/ && ${COPYTREE_SHARE} html ${STAGEDIR}${DOCSDIR}/en/)
	@${MKDIR} ${STAGEDIR}${DOCSDIR}/ja
	${INSTALL_MAN} ${WRKSRC}/ja/latex/m17n-lib.pdf ${STAGEDIR}${DOCSDIR}/ja
	(cd ${WRKSRC}/ja/ && ${COPYTREE_SHARE} html ${STAGEDIR}${DOCSDIR}/ja/)

.include <bsd.port.mk>
