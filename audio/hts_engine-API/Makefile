PORTNAME=	hts_engine-API
PORTVERSION=	1.10
CATEGORIES=	audio
MASTER_SITES=	SOURCEFORGE
MASTER_SITE_SUBDIR=hts-engine/hts_engine%20API/hts_engine_API-${PORTVERSION}
DISTNAME=	hts_engine_API-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HMM-based speech synthesis system (HTS) engine and API
WWW=		https://hts-engine.sourceforge.net/

LICENSE=	bsd3

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4

post-install:
	${MKDIR} ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/AUTHORS   ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/COPYING   ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/ChangeLog ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/INSTALL   ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/NEWS      ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/README    ${DOCSDIR}

.include <bsd.port.mk>
