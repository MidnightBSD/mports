PORTNAME=	libbde
DISTVERSION=	alpha-20231220
CATEGORIES=	filesystems devel
MASTER_SITES=	https://github.com/libyal/libbde/releases/download/${PORTVERSION:E}/ \
		LOCAL/antoine

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library and tools to access the BitLocker Drive Encryption volumes
WWW=		https://github.com/libyal/libbde

LICENSE=	lgpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libcaes.so:security/libcaes

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CONFIGURE_ARGS=	--enable-python --with-libcaes=${LOCALBASE} --with-openssl=no
CONFIGURE_ENV=	PYTHON_CONFIG=${PYTHON_CMD}-config
USES=		fuse libtool pathfix pkgconfig python
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION:E}

OPTIONS_DEFINE=	NLS

NLS_USES=	gettext
NLS_CONFIGURE_ON=	--with-libintl-prefix=${LOCALBASE}
NLS_CONFIGURE_OFF=	--disable-nls

.include <bsd.port.mk>
