PORTNAME=	xerces-c
PORTVERSION=	3.3.0
CATEGORIES=	textproc
MASTER_SITES=	APACHE/xerces/c/3/sources
PKGNAMESUFFIX=	3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Validating XML parser from the Apache XML Project
WWW=		https://xerces.apache.org/xerces-c/ \
		https://github.com/apache/xerces-c

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		compiler cpe iconv libtool pathfix

CONFIGURE_ARGS=	--enable-netaccessor-socket \
		--enable-transcoder-iconv \
		--with-pkgconfigdir=${PREFIX}/libdata/pkgconfig
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
MAKE_ENV=	XERCESCROOT=${WRKSRC}
USE_LDCONFIG=	yes
NO_TEST=	yes

PLIST_SUB=	MAJOR_VER=${PORTVERSION:R}

CPE_PRODUCT=	xerces-c++
CPE_VENDOR=	apache

.include <bsd.port.pre.mk>

.if ${CHOSEN_COMPILER_TYPE} == gcc
PLIST_SUB+=	MUTEXMGR="PosixMutexMgr"
.else
PLIST_SUB+=	MUTEXMGR="StdMutexMgr"
.endif

post-patch:
	@${REINPLACE_CMD} -e "s,@DEFS@,& -D__STDC_LIMIT_MACROS," ${WRKSRC}/src/Makefile.in

post-install:
	${LN} -s libxerces-c-${PORTVERSION:R}.so ${STAGEDIR}${PREFIX}/lib/libxerces-c.so.${PORTVERSION:R:R}

.include <bsd.port.post.mk>
