PORTNAME=	gtkspell
PORTVERSION=	2.0.16
PORTREVISION?=	4
CATEGORIES=	textproc gnome
MASTER_SITES=	FREEBSD_LOCAL/marcus

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GTK 2 spell checking component
WWW=		http://gtkspell.sourceforge.net/

LICENSE=	gpl2

LIB_DEPENDS=	libenchant.so:textproc/enchant

USES=		gettext gmake gnome libtool:keepla pathfix pkgconfig
USE_GNOME=	gnomeprefix gtk20 intlhack
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS/ s|docs||' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
