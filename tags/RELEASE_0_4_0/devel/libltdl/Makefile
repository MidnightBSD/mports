# $MidnightBSD$
# $FreeBSD: ports/devel/libltdl/Makefile,v 1.6 2010/12/08 19:58:46 ade Exp $

PORTNAME=	libltdl
MASTERDIR=	${.CURDIR}/../../devel/libtool

COMMENT=	System independent dlopen wrapper
LICENSE=	lgpl

USE_GNOME=	ltverhack
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
LIBTOOLFILES=	libltdl/configure
CONFIGURE_ARGS=	--enable-ltdl-install

CONFIGURE_WRKSRC=${WRKSRC}/libltdl
BUILD_WRKSRC=	${CONFIGURE_WRKSRC}
INSTALL_WRKSRC=	${CONFIGURE_WRKSRC}
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist
INFO=		# empty

.include "${MASTERDIR}/Makefile"
