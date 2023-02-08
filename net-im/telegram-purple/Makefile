PORTNAME=	telegram-purple
PORTVERSION=	1.4.7
DISTVERSIONPREFIX=	v
CATEGORIES=	net-im

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libpurple plugin for Telegram messenger
WWW=		https://github.com/majn/telegram-purple

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libgcrypt.so:security/libgcrypt \
		libwebp.so:graphics/webp \
		libpurple.so:net-im/libpurple \
		libpng.so:graphics/png

USES=		gmake gnome pkgconfig localbase:ldflags
USE_GNOME=	glib20

GNU_CONFIGURE=	yes

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes
NLS_USES=	gettext
NLS_CONFIGURE_OFF=	--disable-translation

USE_GITHUB=	yes
GH_ACCOUNT=	majn
GH_PROJECT=	tgl:tgl
GH_TAGNAME?=	cd7e3d7:tgl
GH_SUBDIR=	tgl:tgl

post-install:
	@${STRIP_CMD} ${PREFIX}/lib/purple-2/telegram-purple.so

.include <bsd.port.mk>
