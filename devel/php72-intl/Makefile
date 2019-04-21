# $FreeBSD: head/devel/php72-intl/Makefile 497953 2019-04-05 13:50:41Z tz $

CATEGORIES=	devel

MASTERDIR=	${.CURDIR}/../../lang/php72

PKGNAMESUFFIX=	-intl

USES=		compiler:c++11-lib
USE_CXXSTD=	gnu++11

CPPFLAGS+=	-DU_USING_ICU_NAMESPACE=1

TEST_TARGET=    test

.include "${MASTERDIR}/Makefile"
