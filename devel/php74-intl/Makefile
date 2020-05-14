# $FreeBSD: head/devel/php74-intl/Makefile 516111 2019-10-30 22:42:21Z tz $

CATEGORIES=	devel

MASTERDIR=	${.CURDIR}/../../lang/php74

PKGNAMESUFFIX=	-intl

USES=		compiler:c++11-lib
USE_CXXSTD=	gnu++11

CPPFLAGS+=	-DU_USING_ICU_NAMESPACE=1

NO_TEST=	yes

.include "${MASTERDIR}/Makefile"
