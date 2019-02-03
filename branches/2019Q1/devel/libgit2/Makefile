# $MidnightBSD$
# $FreeBSD: head/devel/libgit2/Makefile 391072 2015-07-01 15:09:52Z kwm $

PORTNAME=	libgit2
PORTVERSION=	0.27.5
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable, pure C implementation of the Git core

LICENSE=	gpl2

USE_GITHUB=	yes
GH_ACCOUNT=	libgit2

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

USES=		cmake pathfix pkgconfig python:build ssl
USE_LDCONFIG=	yes

PLIST_SUB=	PORTVERSION=${PORTVERSION} SHLIB_VER=${PORTVERSION:R:E}

OPTIONS_DEFINE=	SSH THREADS CURL
OPTIONS_DEFAULT=SSH THREADS CURL
SSH_DESC=	Enable SSH support through libssh2
CURL_DESC=	Enable HTTP support through cURL

SSH_LIB_DEPENDS=	libssh2.so:security/libssh2
SSH_CMAKE_ON=		-DUSE_SSH=ON
SSH_CMAKE_OFF=		-DUSE_SSH=OFF
THREADS_CMAKE_ON=	-DTHREADSAFE=ON
THREADS_CMAKE_OFF=	-DTHREADSAFE=OFF
CURL_LIB_DEPENDS=	libcurl.so:ftp/curl
CURL_CMAKE_ON=		-DCURL=ON
CURL_CMAKE_OFF=		-DCURL=OFF

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e "s|/pkgconfig|/../libdata/pkgconfig|; \
		/LIBGIT2_PC_REQUIRES.*zlib/ d" ${WRKSRC}/CMakeLists.txt
.if defined(WITH_OPENSSL_BASE)
	@${REINPLACE_CMD} -e "/LIBGIT2_PC_REQUIRES.*openssl/ d" \
		${WRKSRC}/src/CMakeLists.txt
.endif

.include <bsd.port.post.mk>
