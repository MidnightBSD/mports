PORTNAME=	cannadic
PORTVERSION=	0.95c
PORTREVISION=	4
CATEGORIES=	japanese
MASTER_SITES=	FREEBSD_LOCAL/hrs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Canna dictionary containing a lot of words
WWW=		http://cannadic.oucrc.org/

LICENSE=	gpl2

RUN_DEPENDS=	${LOCALBASE}/sbin/cannaserver:japanese/canna-server
BUILD_DEPENDS=	crxdic:japanese/canna-server

ALL_TARGET=	maindic
SUB_FILES=	README.FreeBSD pkg-message
PORTDOCS=	README.ja README.FreeBSD

DICS=		gcanna.cbd gcanna.cld gcannaf.ctd
DICSFILE=	dics.dir.gpl_canna
DICDIR=		share/canna/dic/canna
OPTIONS_DEFINE=	DOCS

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/${DICDIR}
	cd ${WRKSRC} && \
	    ${INSTALL_DATA} ${DICS} ${DICSFILE} ${STAGEDIR}${PREFIX}/${DICDIR}
	${INSTALL_DATA} ${WRKDIR}/README.FreeBSD ${WRKSRC}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
