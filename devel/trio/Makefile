PORTNAME=	trio
PORTVERSION=	1.16
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	SF/c${PORTNAME}/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fully matured and stable set of printf and string functions
WWW=		https://daniel.haxx.se/projects/trio/

LICENSE=	bsd2

FAKE_OPTS=	trueprefix

USES=		uidfix

MAKEFILE=	${FILESDIR}/BSDmakefile

OPTIONS_DEFINE=	DOCS

NO_TEST=	yes

.include <bsd.mport.options.mk>

post-install:
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	cd ${WRKSRC} && ${FIND} doc | \
		${CPIO} -pdm -L -R ${SHAREOWN}:${SHAREGRP} ${STAGEDIR}${DOCSDIR}
.endif

.include <bsd.port.mk>
