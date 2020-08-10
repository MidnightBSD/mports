# Also update devel/libgit2-glib, devel/rubygem-rugged, devel/py-pygit2
# Make sure you bump revision of depending ports, if SONAME changes
# objdump -p libgit2.so |grep SONAME
# Tools/scripts/search_lib_depends_and_bump.sh devel/libgit2

PORTNAME=	libgit2
PORTVERSION=	1.0.0
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	https://github.com/libgit2/libgit2/releases/download/v${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable, pure C implementation of the Git core

LICENSE=	gpl2

LIB_DEPENDS=	libpcre.so:devel/pcre

USES=		cmake pkgconfig ssl
USE_LDCONFIG=	yes
CMAKE_OFF=	BUILD_CLAR

PLIST_SUB=	PORTVERSION=${PORTVERSION} \
		SHLIB_VER=${PORTVERSION:R}

OPTIONS_DEFINE=	SSH THREADS
OPTIONS_DEFAULT=SSH THREADS
SSH_DESC=	Enable SSH support through libssh2

SSH_LIB_DEPENDS=	libssh2.so:security/libssh2
SSH_CMAKE_BOOL=		USE_SSH
THREADS_CMAKE_BOOL=	THREADSAFE

NO_TEST=	yes

.include <bsd.port.pre.mk>

.if ${SSL_DEFAULT} == base
post-patch:
	@${REINPLACE_CMD} -e "/LIBGIT2_PC_REQUIRES.*openssl/ d" \
		${WRKSRC}/cmake/Modules/SelectHTTPSBackend.cmake
.endif

post-install:
	cd ${PREFIX}/lib/; ${LN} -sf libgit2.so.${PORTVERSION} libgit2.so.27

.include <bsd.port.post.mk>
