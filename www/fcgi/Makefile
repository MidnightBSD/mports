PORTNAME=	fcgi2
PORTVERSION=	2.4.5
CATEGORIES=	www
PKGNAMESUFFIX=	-devkit

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FastCGI Development Kit
WWW=		https://github.com/FastCGI-Archives/fcgi2

LICENSE=	Open_Market_FastCGI_license
LICENSE_NAME=	Open Market FastCGI license
LICENSE_FILE=	${WRKSRC}/LICENSE
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

OPTIONS_DEFINE=	DOCS

USES=		autoreconf cpe libtool
USE_GITHUB=	yes
GH_ACCOUNT=	FastCGI-Archives
GH_TAGNAME=     ${PORTVERSION}
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
MAKE_JOBS_UNSAFE=	yes
CPE_VENDOR=	fastcgi

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libfcgi.so.0.0.0
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libfcgi++.so.0.0.0
	${INSTALL_MAN} ${WRKSRC}/doc/*.1 ${STAGEDIR}${PREFIX}/share/man/man1/
	${INSTALL_MAN} ${WRKSRC}/doc/*.3 ${STAGEDIR}${PREFIX}/share/man/man3/
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	cd ${WRKSRC}/doc && ${COPYTREE_SHARE} . ${STAGEDIR}${DOCSDIR}
	@${RM} -f ${STAGEDIR}${DOCSDIR}/*.[13]
.endif

.include <bsd.port.mk>
