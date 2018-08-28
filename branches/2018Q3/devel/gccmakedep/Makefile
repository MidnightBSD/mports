# $FreeBSD: ports/devel/gccmakedep/Makefile,v 1.1 2007/05/19 20:02:32 flz Exp $
# $MidnightBSD$

PORTNAME=	gccmakedep
PORTVERSION=	1.0.3
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create dependencies in makefiles using 'gcc -M'

LICENSE=	unknown

XORG_CAT=	util

BUILD_DEPENDS=	tradcpp:devel/tradcpp

PLIST_FILES=	bin/gccmakedep man/man1/gccmakedep.1.gz
CONFIGURE_ENV+=	ac_cv_path_RAWCPP=tradcpp

.include <bsd.port.mk>
