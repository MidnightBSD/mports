PORTNAME=	kasumi
PORTVERSION=	2.5
PORTREVISION=	10
CATEGORIES=	japanese
MASTER_SITES=	OSDN/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dictionary management tool for anthy
WWW=		http://kasumi.sourceforge.jp/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libanthy.so:japanese/anthy \
		libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2

USES=		compiler:c++11-lang gmake gnome iconv:wchar_t localbase:ldflags pkgconfig
USE_GNOME=	gtk20 cairo gdkpixbuf
USE_CXXSTD=	c++11

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=	${PREFIX}/share
OPTIONS_DEFINE=	NLS

CONFLICTS_INSTALL=	kasumi-unicode

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.include <bsd.port.mk>
