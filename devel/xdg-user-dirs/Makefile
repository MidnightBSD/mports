PORTNAME=	xdg-user-dirs
DISTVERSION=	0.19
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	https://user-dirs.freedesktop.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool to help manage personal user directories
WWW=		https://freedesktop.org/wiki/Software/xdg-user-dirs/

LICENSE=	gpl2+ mit
LICENSE_COMB=	multi
LICENSE_FILE_gpl2+=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${LOCALBASE}/share/xsl/docbook/html/docbook.xsl:textproc/docbook-xsl

USES=		gettext gnome iconv localbase:ldflags meson tar:xz
USE_GNOME=	libxslt:build
LDFLAGS+=	${ICONV_LIB}

post-patch:
	${REINPLACE_CMD} -e "s|get_option('sysconfdir')|'${TRUE_PREFIX}/etc'|g" \
		-e "s|get_option('localedir')|'${TRUE_PREFIX}/share/locale'|g" \
		${WRKSRC}/meson.build

.include <bsd.port.mk>
