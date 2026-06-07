PORTNAME=	brotli
DISTVERSION=	1.3.2
CATEGORIES=	archivers
DISTNAME=	${PORTNAME}_${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compression Format Optimized for the Web
WWW=		https://CRAN.R-project.org/package=brotli

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cran:auto-plist,compiles

NO_TEST=	yes

post-fake:
	${RMDIR} ${FAKE_DESTDIR}${PREFIX}/${R_MOD_DIR}/bin 2>/dev/null || ${TRUE}

.include <bsd.port.mk>
