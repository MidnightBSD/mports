PORTNAME=	glycin2
DISTVERSION=	2.2.1
CATEGORIES=	graphics gnome
MASTER_SITES=	GNOME/sources/glycin
DISTNAME=	glycin-${DISTVERSION}
# The cargo extension appends its crates to DISTFILES before the framework
# supplies its default main distfile, so list the source archive explicitly.
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sandboxed image decoding library
WWW=		https://gitlab.gnome.org/GNOME/glycin

LICENSE=	MPL20 lgpl2.1+
LICENSE_COMB=	dual
LICENSE_FILE_MPL20=	${WRKSRC}/LICENSE-MPL-2.0
LICENSE_FILE_lgpl2.1+	=	${WRKSRC}/LICENSE-LGPL-2.1

USES=		cargo gettext gnome meson pkgconfig tar:xz
USE_GNOME=	glib20 gtk40
USE_LDCONFIG=	yes

CARGO_BUILD=	no
CARGO_INSTALL=	no
CARGO_TEST=	no

# Meson invokes cargo itself and expects native-target artifacts.
MAKE_ENV=	${CARGO_ENV:NCARGO_BUILD_TARGET=*}

.include <bsd.port.mk>
