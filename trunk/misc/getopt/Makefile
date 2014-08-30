# $MidnightBSD$

PORTNAME=	getopt
PORTVERSION=	1.1.5
PORTREVISION=	2
CATEGORIES=	misc
MASTER_SITES=	http://software.frodo.looijaard.name/getopt/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	getopt(1) replacement that supports GNU-style long options

LICENSE=	gpl2

FAKE_OPTS+=	trueprefix

OPTIONS_DEFINE=	DOCS

CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -lintl
FAKE_MAKEENV+=	LIGCGETOPT=0
FAKE_MAKEARGS+=	CC=${CC}
USES=		gettext gmake

PORTDOCS=	Changelog README

post-install:
	@${MKDIR} ${DOCSDIR}
	@cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}

.include <bsd.port.mk>
