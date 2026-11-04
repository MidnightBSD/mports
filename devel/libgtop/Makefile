PORTNAME=	libgtop
PORTVERSION=	2.41.3
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME top library
WWW=		https://gitlab.gnome.org/GNOME/libgtop

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USE_PERL5=	build
USE_XORG=	xau
USES=		gettext gmake gnome libtool pathfix perl5 \
		pkgconfig tar:xz xorg
USE_GNOME=	gnomeprefix glib20 introspection:build
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd11.4
LDFLAGS+=	-L${LOCALBASE}/lib -lutil
INSTALL_TARGET=	install-strip
CONFIGURE_ARGS=	--enable-introspection

INFO=		libgtop2

PKGMESSAGE=	${FILESDIR}/pkg-message

.include <bsd.port.mk>
