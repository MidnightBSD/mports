PORTNAME=	libltdl
PORTREVISION=	4

COMMENT=	System independent dlopen wrapper

.include "${.CURDIR}/../libtool/Makefile.common"

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

BUILD_DEPENDS+= libtool:devel/libtool \
		gm4:devel/m4 \
		help2man:misc/help2man

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-ltdl-install --disable-dependency-tracking
INSTALL_TARGET=	install-strip
USES+=		libtool:keepla
USE_AUTOTOOLS=	aclocal
USE_LDCONFIG=	yes
WRKSRC_SUBDIR=	libltdl

.include <bsd.port.mk>
