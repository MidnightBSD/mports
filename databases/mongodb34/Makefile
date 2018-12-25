# $MidnightBSD$
# $FreeBSD: head/databases/mongodb34/Makefile 476993 2018-08-12 15:11:38Z joneum $

PORTNAME=	mongodb
DISTVERSIONPREFIX=	r
DISTVERSION=	3.4.16
CATEGORIES=	databases net
MASTER_SITES=	https://fastdl.mongodb.org/src/ \
		http://fastdl.mongodb.org/src/ \
		http://download.mongodb.org/src/
PKGNAMESUFFIX=	${PORTVERSION:R:S/.//}
DISTNAME=	mongodb-src-${DISTVERSIONPREFIX}${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Distributed document-oriented "NoSQL" database

# mongodb is AGPLv3, C++ driver is APACHE20
LICENSE=	agpl apache2
LICENSE_COMB=	multi

BROKEN_SSL=	openssl-devel
BROKEN_SSL_REASON_openssl-devel=	no member named 'SSLv2_method' in the global namespace
ONLY_FOR_ARCHS=	amd64 aarch64
ONLY_FOR_ARCHS_REASON=	"Only supported on amd64 and aarch64 (i386 deprecated in v3)"

LIB_DEPENDS=	libpcre.so:devel/pcre \
		libsnappy.so:archivers/snappy \
		libboost_system.so:devel/boost-libs

CONFLICTS_BUILD=	mongo-cxx-driver

CHOSEN_COMPILER_TYPE=	clang

USES=		compiler:c++14-lang cpe dos2unix python:build scons
DOS2UNIX_FILES=	src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h

USE_RC_SUBR=	mongod

MAKE_ARGS=	--prefix=${FAKE_DESTDIR}${TRUE_PREFIX} \
		--use-system-pcre --use-system-snappy \
		--use-system-boost --use-system-zlib \
		--cxx-std=14 --libc++ \
		--runtime-hardening=on \
		--disable-warnings-as-errors \
		VERBOSE=on

USERS=		mongodb
GROUPS=		mongodb

OPTIONS_DEFINE=		SASL SSL
OPTIONS_DEFAULT=	SASL SSL

SASL_LIB_DEPENDS=	libsasl2.so:security/cyrus-sasl2
SASL_MAKE_ARGS=		--use-sasl-client

SSL_USES=	ssl
SSL_MAKE_ARGS=	--ssl

.include <bsd.mport.options.mk>

SUB_LIST+=	LEGACY_LIMITS="" MODERN_LIMITS="@comment "

ALL_TARGET=	core
TEST_TARGET=	unittests

PORTSCOUT=	limitw:1,even

CPE_PRODUCT=	mongodb

pre-patch:
	${LN} -sf ${WRKSRC}/src/third_party/wiredtiger/build_freebsd ${WRKSRC}/src/third_party/wiredtiger/build_midnightbsd

do-install:
	cd ${WRKSRC} && ${MAKE_CMD} ${MAKE_ARGS} install  

post-install:
.for f in mongo mongod mongoperf mongos
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/${f}
.endfor
	${CP} ${WRKSRC}/rpm/mongod.conf ${STAGEDIR}${PREFIX}/etc/mongodb.conf.sample

do-test:
	@cd ${BUILD_WRKSRC} && ${SETENV} ${MAKE_ENV} \
		${MAKE_CMD} ${_MAKE_JOBS} ${MAKE_ARGS} ${TEST_TARGET} &&\
		${PYTHON_CMD} ${BUILD_WRKSRC}/buildscripts/resmoke.py\
		--suites=unittests --jobs=${MAKE_JOBS_NUMBER}

.include <bsd.port.mk>
