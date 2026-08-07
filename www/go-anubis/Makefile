PORTNAME=	anubis
DISTVERSIONPREFIX=	v
DISTVERSION=	1.25.0
PORTREVISION=	0
CATEGORIES=	www
MASTER_SITES=	https://github.com/techarohq/${PORTNAME}/releases/download/${DISTVERSIONPREFIX}${DISTVERSION}/
PKGNAMEPREFIX=	go-
DISTNAME=	anubis-src-vendor-npm-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Anti-scraper web proxy using browser-based proof-of-work challenges
WWW=		https://anubis.techaro.lol/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go:no_targets
USE_RC_SUBR=	${PORTNAME}

MAKE_FLAGS=	VERSION=${DISTVERSION} GOFLAGS="-buildvcs=false"
ALL_TARGET=	prebaked-build

post-patch:
	@${FIND} ${WRKSRC}/data \( -name "*.yaml" -or -name "*.json" \) \
		| ${XARGS} ${REINPLACE_CMD} -i '' -e 's|(data)|${DATADIR}|g'

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/var/${PORTNAME} \
		${PREFIX}/sbin/${PORTNAME}
	${INSTALL_PROGRAM} ${WRKSRC}/var/robots2policy \
		${PREFIX}/sbin/robots2policy
	${MKDIR} ${STAGEDIR}${DATADIR}
	cd ${WRKSRC}/data && ${COPYTREE_SHARE} . ${DATADIR} '-not -name \*.go'

.include <bsd.port.mk>
