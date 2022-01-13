PORTNAME=	libgsf
PORTVERSION=	1.14.47
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Extensible i/o abstraction for dealing with structured file formats

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	multi
LICENSE_FILE_gpl2=	${WRKSRC}/COPYING
LICENSE_FILE_lgpl2.1=	${WRKSRC}/COPYING.LIB

USES=		cpe gmake gnome libtool localbase pathfix pkgconfig tar:xz
USE_GNOME=	gdkpixbuf2 intlhack introspection:build libxml2
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip
CONFIGURE_ARGS=	--enable-introspection
CPE_VENDOR=	gnome

OPTIONS_DEFINE=	NLS
OPTIONS_DEFAULT=NLS
OPTIONS_SUB=	yes

NLS_CONFIGURE_ENABLE=	nls
NLS_USES=		gettext

.include <bsd.port.mk>
