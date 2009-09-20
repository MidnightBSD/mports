# $MidnightBSD$

PORTNAME=	libltdl
MASTERDIR=	${.CURDIR}/../../devel/libtool22

COMMENT=	System independent dlopen wrapper

USE_GNOME=	ltverhack
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:22
LIBTOOLFILES=	libltdl/configure
CONFIGURE_ARGS=	--enable-ltdl-install

CONFIGURE_WRKSRC=${WRKSRC}/libltdl
BUILD_WRKSRC=	${CONFIGURE_WRKSRC}
INSTALL_WRKSRC=	${CONFIGURE_WRKSRC}
DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist
LATEST_LINK=	libltdl22
INFO=		# empty

.include "${MASTERDIR}/Makefile"
