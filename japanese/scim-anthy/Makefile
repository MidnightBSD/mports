PORTNAME=	scim-anthy
PORTVERSION=	1.2.7
PORTREVISION=	7
CATEGORIES=	japanese
MASTER_SITES=	OSDN/scim-imengine

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SCIM IMEngine module using Anthy
WWW=		https://sourceforge.jp/projects/scim-imengine/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	scim:textproc/scim
LIB_DEPENDS=	libanthy.so:japanese/anthy \
		libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2
RUN_DEPENDS:=	${BUILD_DEPENDS} \
		kasumi:japanese/kasumi

USES=		gettext-runtime gmake gnome iconv libtool:keepla pkgconfig
USE_GNOME=	atk cairo gdkpixbuf glib20 gtk20 pango
GNU_CONFIGURE=	yes

.include <bsd.port.mk>
