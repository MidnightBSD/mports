# $MidnightBSD$

PORTNAME=	gtkspell
PORTVERSION=	2.0.16
PORTREVISION?=	2
CATEGORIES=	textproc gnome
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	marcus

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A GTK+ 2 spell checking component
LICENSE=	gpl2

.if !defined(REFERENCE_PORT)

LIB_DEPENDS=	libenchant.so:${PORTSDIR}/textproc/enchant

USES=		gettext gmake libtool:keepla pathfix pkgconfig
USE_GNOME=	gnomeprefix gtk20 intlhack
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS/ s|docs||' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>

.endif
