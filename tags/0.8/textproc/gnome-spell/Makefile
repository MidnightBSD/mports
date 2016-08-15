# $MidnightBSD$

PORTNAME=	gnome-spell
PORTVERSION=	1.0.8
PORTREVISION=	2
CATEGORIES=	textproc gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME/Bonobo component for spell checking
LICENSE=	gpl2

LIB_DEPENDS=	libaspell.so:${PORTSDIR}/textproc/aspell

USE_GNOME=	gnomeprefix intlhack libgnomeui
USES=		gettext gmake libtool pathfix pkgconfig perl5 tar:bzip2
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
PLIST_SUB=	VERSION=${PORTVERSION}
INSTALL_TARGET=	install-strip

post-patch:
	@${REINPLACE_CMD} -e 's|@mkdir_p@|mkdir -p|g' \
		${WRKSRC}/po/Makefile.in.in

.include <bsd.port.mk>
