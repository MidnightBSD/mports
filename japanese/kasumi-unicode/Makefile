PORTNAME=	kasumi-unicode
DISTVERSION=	2.6
CATEGORIES=	japanese

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dictionary management tool for anthy-unicode

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libanthy-unicode.so:japanese/anthy-unicode

USES=		autoreconf compiler:c++11-lang gmake gnome iconv:wchar_t \
		libtool pkgconfig
USE_CXXSTD=	c++11
USE_GITHUB=	yes
GH_ACCOUNT=	fujiwarat
USE_GNOME=	gtk30

GNU_CONFIGURE=	yes

CONFLICTS_INSTALL=	kasumi

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

NLS_USES=		gettext
NLS_CONFIGURE_ENABLE=	nls

.include <bsd.port.mk>
