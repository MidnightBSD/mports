PORTNAME=	libIDL
PORTVERSION=	0.8.14
PORTREVISION=	4
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for creating trees of CORBA IDL files
WWW=		https://www.gnome.org/

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		bison:alias gettext gnome libtool localbase \
		pathfix pkgconfig tar:bzip2
USE_GNOME=	glib20
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc

INFO=		libIDL2

.include <bsd.port.mk>
