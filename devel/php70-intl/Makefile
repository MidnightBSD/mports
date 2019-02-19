# Created by: Alex Dupre <ale@FreeBSD.org>
# $FreeBSD: head/devel/php70-intl/Makefile 424244 2016-10-19 13:34:18Z tz $
# $MidnightBSD$

CATEGORIES=	devel

MASTERDIR=	${.CURDIR}/../../lang/php70

PKGNAMESUFFIX=	-intl

USES=		compiler:c++11-lib
USE_CXXSTD=	gnu++11

CPPFLAGS+=	-DU_USING_ICU_NAMESPACE=1

.include "${MASTERDIR}/Makefile"
