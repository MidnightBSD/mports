# $MidnightBSD$

PORTNAME=	fastjar
PORTVERSION=	0.93.20060808
PORTREVISION=	1
CATEGORIES=	archivers java
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	maho/fastjar

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	version of JDK's `jar' command written entirely in C

LICENSE=	gpl2

USES=		gmake makeinfo tar:bzip2
WRKSRC=		${WRKDIR}/${PORTNAME}
GNU_CONFIGURE=	yes
PORTDOCS=	CHANGES ChangeLog NEWS README
PLIST_FILES=	bin/fastjar bin/grepjar
USE_PERL5_BUILD=	yes

INFO=		fastjar

OPTIONS_DEFINE=	DOCS

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}/
.endif

.include <bsd.port.mk>
