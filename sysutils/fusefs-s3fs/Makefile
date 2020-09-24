PORTNAME=	s3fs
DISTVERSIONPREFIX=	v
DISTVERSION=	1.86
CATEGORIES=	sysutils
PKGNAMEPREFIX=	fusefs-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FUSE-based file system backed by Amazon S3

LICENSE=	gpl2

LIB_DEPENDS=	libcurl.so:ftp/curl \
		libxml2.so:textproc/libxml2

USE_GITHUB=	yes
GH_ACCOUNT=	s3fs-fuse
GH_PROJECT=s3fs-fuse

USES=		autoreconf fuse pkgconfig ssl
GNU_CONFIGURE=	yes

WRKSRC=		${WRKDIR}/${GH_ACCOUNT}-${PORTVERSION}

PLIST_FILES=	bin/s3fs man/man1/s3fs.1.gz

post-patch:
	@${REINPLACE_CMD} -e 's/libcrypto >= 0.9//' ${WRKSRC}/configure.ac
	@${REINPLACE_CMD} -e '/DEPS_LIBS/s/$$/ -lcrypto/' \
		${WRKSRC}/src/Makefile.am
	@${REINPLACE_CMD} -e '/pthread_self/s/static/reinterpret/' \
		${WRKSRC}/src/openssl_auth.cpp

.include <bsd.port.mk>
