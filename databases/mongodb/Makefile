# Created by: Mirko Zinn <mail@derzinn.de>
# $FreeBSD: head/databases/mongodb/Makefile 462050 2018-02-16 17:52:50Z brnrd $
# $MidnightBSD$

PORTNAME=	mongodb
PORTVERSION=	2.6.12
CATEGORIES=	databases net
MASTER_SITES=	http://downloads.mongodb.org/src/
DISTNAME=	${PORTNAME}-src-r${PORTVERSION}

PATCH_SITES=	https://github.com/${PORTNAME}/${PORTNAME:S|db$||}/commit/
PATCHFILES=	0ee4735ab8fb.patch:-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	NOSQL distributed document-oriented database

LICENSE=	agpl apache2
LICENSE_COMB=	multi

BROKEN_MidnightBSD_2=	Does not work with modern compilers
BROKEN_SSL=	openssl-devel
BROKEN_SSL_REASON_openssl-devel=	use of undeclared identifier 'BIO_s_file_internal'

CONFLICTS_INSTALL=      mongodb34 mongodb36

LIB_DEPENDS=	libpcre.so:devel/pcre \
		libsnappy.so:archivers/snappy \
		libv8.so:lang/v8 \
# boost 1.52/1.55 from ports make mongod segfaulting with many tests
# LIB_DEPENDS+=	libboost_system.so:devel/boost-libs
# MAKE_ARGS+=	--use-system-boost
# use bundled yaml
# MAKE_ARGS+=	--use-system-yaml
# LIB_DEPENDS+=	libyaml-cpp.so:devel/yaml-cpp

OPTIONS_DEFINE=	SSL SASL TEST
OPTIONS_DEFAULT=SSL

USES=		cpe scons python:build
MAKE_ARGS+=	--prefix=${FAKE_DESTDIR}${TRUE_PREFIX} --cc=${CC} --cxx=${CXX} \
		--use-system-pcre --use-system-snappy --use-system-v8

#INSTALL_TARGET= install --install-sandbox=${FAKE_DESTDIR}
ALL_TARGET=     core tools

USERS=	mongodb
GROUPS=	mongodb

USE_RC_SUBR=	mongod

PORTSCOUT=	limitw:1,even

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MSSL}
EXTENSIONS+=	ssl
FAKE_MAKEARGS+=	--ssl
.endif

.if ${PORT_OPTIONS:MSASL}
FAKE_MAKEARGS+=	--use-sasl-client
LIB_DEPENDS+=	libsasl2.so:security/cyrus-sasl2
.endif

post-patch:
	@${REINPLACE_CMD} 's/\["-O3"\]/"${CXXFLAGS}"/' \
		${WRKSRC}/SConstruct


.if ${PORT_OPTIONS:MTEST}
test: build-depends build
	@cd ${BUILD_WRKSRC} && ${SETENV} ${MAKE_ENV} \
		${MAKE_CMD} ${_MAKE_JOBS} ${FAKE_MAKEARGS} ${TEST_TARGET}
.endif

do-build:
	cd ${WRKSRC} && ${MAKE_CMD} ${MAKE_ARGS} ${ALL_TARGET}

do-install:
	cd ${WRKSRC} && ${MAKE_CMD} ${MAKE_ARGS} install
	

.include <bsd.port.mk>
