PORTNAME=	libfsext
# If/When moving from experimental to alpha, switch to DISTVERSIONPREFIX to prevent PORTEPOCH
DISTVERSION=	experimental-20231129
CATEGORIES=	filesystems devel
MASTER_SITES=	https://github.com/libyal/libfsext/releases/download/${PORTVERSION:E}/ \
		FREEBSD_LOCAL/antoine

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library and tools to access the Extended File System
WWW=		https://github.com/libyal/libfsext

LICENSE=	lgpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CONFIGURE_ARGS=	--enable-python --with-openssl=no
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
