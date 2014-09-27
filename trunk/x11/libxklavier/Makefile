# $MidnightBSD$
# $FreeBSD: ports/x11/libxklavier/Makefile,v 1.35 2007/05/19 20:27:03 flz Exp $

PORTNAME=	libxklavier
PORTVERSION=	5.0
PORTREVISION=	4
PORTEPOCH=	1
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility library to make XKB stuff easier

LICENSE=	lgpl

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/iso-codes.pc:${PORTSDIR}/misc/iso-codes
RUN_DEPENDS=	xkbcomp:${PORTSDIR}/x11/xkbcomp \
    		${LOCALBASE}/libdata/pkgconfig/iso-codes.pc:${PORTSDIR}/misc/iso-codes

USES=		libtool:keepla pathfix gmake pkgconfig tar:bzip2
USE_XORG=	x11 xi xkbfile
USE_GNOME=	libxml2 glib20
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip
CPPFLAGS+=	-I${LOCALBASE}/include
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-doxygen \
		--with-xkb-base=${LOCALBASE}/share/X11/xkb \
		--with-xkb-bin-base=${LOCALBASE}/bin \
		--with-xmodmap-base=${LOCALBASE}/share/xmodmap \
		--disable-gtk-doc \
		--with-html-dir=${GNOME_HTML_DIR}
LDFLAGS+=	-L${LOCALBASE}/lib

PLIST_SUB=	VERSION=${PORTVERSION}

post-patch:
	@${REINPLACE_CMD} -e 's|== "yes|= "yes|g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
