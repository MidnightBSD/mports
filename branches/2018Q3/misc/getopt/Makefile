# $MidnightBSD$

PORTNAME=	getopt
PORTVERSION=	1.1.6
PORTREVISION=	1
CATEGORIES=	misc
MASTER_SITES=	http://frodo.looijaard.name/system/files/software/getopt/ \
		FREEBSD_LOCAL/sunpoet

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	getopt(1) replacement that supports GNU-style long options

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual

FAKE_OPTS+=	trueprefix

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

FAKE_MAKEENV+=	LIGCGETOPT=0
FAKE_MAKEARGS+=	CC=${CC}
USES=		gmake

PORTDOCS=	Changelog README

NLS_CFLAGS=		-I${LOCALBASE}/include
NLS_MAKE_ARGS=		WITHOUT_GETTEXT=0
NLS_MAKE_ARGS_OFF=	WITHOUT_GETTEXT=1
NLS_LDFLAGS=		-L${LOCALBASE}/lib -lintl
NLS_USES=		gettext

post-install:
	${MKDIR} ${DOCSDIR}/
	cd ${WRKSRC}/ && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}/
	${STRIP_CMD} ${PREFIX}/bin/getopt

.include <bsd.port.mk>
