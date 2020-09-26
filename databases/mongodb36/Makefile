# $FreeBSD: head/databases/mongodb36/Makefile 528736 2020-03-19 17:56:40Z pi $

PORTNAME=	mongodb
DISTVERSIONPREFIX=	r
DISTVERSION=	3.6.17
CATEGORIES=	databases net
MASTER_SITES=	https://fastdl.mongodb.org/src/ \
		http://fastdl.mongodb.org/src/ \
		http://download.mongodb.org/src/
PKGNAMESUFFIX=	${PORTVERSION:R:S/.//}
DISTNAME=	mongodb-src-${DISTVERSIONPREFIX}${DISTVERSION}

MAINTAINER=	dev@dudu.ro
COMMENT=	Distributed document-oriented "NoSQL" database

LICENSE=	agpl apache2
LICENSE_COMB=	multi

ONLY_FOR_ARCHS=	aarch64 amd64
ONLY_FOR_ARCHS_REASON=	"Only supported on amd64 and aarch64 (i386 deprecated in v3)"

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cheetah>=2.4.4:devel/py-cheetah@${PY_FLAVOR} \
		${PY_TYPING} \
		${PYTHON_PKGNAMEPREFIX}yaml>=3.11:devel/py-yaml@${PY_FLAVOR}
LIB_DEPENDS=	libboost_system.so:devel/boost-libs \
		libpcre.so:devel/pcre \
		libsnappy.so:archivers/snappy

USES=		compiler:c++14-lang cpe python:2.7,build scons shebangfix
USE_RC_SUBR=	mongod

CONFLICTS_BUILD=	mongo-cxx-driver
CONFLICTS_INSTALL=	mongodb34 mongodb40 mongodb

SHEBANG_FILES=	src/mongo/installer/compass/install_compass.in
python_OLD_CMD=	@python_interpreter@
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

BROKEN_SSL=     base
BROKEN_SSL_REASON_base=        no member named 'SSLv2_method' in the global namespace
BROKEN_MidnightBSD_1=	Compiler and OpenSSL too old

SSL_USES=	ssl
SSL_MAKE_ARGS=	--ssl

.include <bsd.mport.options.mk>

SUB_LIST+=	LEGACY_LIMITS="" MODERN_LIMITS="@comment "

.if ${ARCH} == aarch64
EXTRA_PATCHES=	${FILESDIR}/aarch64
.endif

ALL_TARGET=	core

PORTSCOUT=	limitw:1,even

CPE_PRODUCT=	mongodb

post-install:
.for f in mongo mongod mongoperf mongos
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/${f}
.endfor
	${CP} ${WRKSRC}/rpm/mongod.conf ${STAGEDIR}${PREFIX}/etc/mongodb.conf.sample

.include <bsd.port.mk>
