# $MidnightBSD: mports/textproc/enchant/Makefile,v 1.6 2011/02/02 21:23:47 laffer1 Exp $

PORTNAME=	enchant
PORTVERSION=	1.4.2
PORTREVISION=	1
CATEGORIES=	textproc gnome
MASTER_SITES=	http://www.abisource.com/downloads/${PORTNAME}/${PORTVERSION}/
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dictionary/spellchecking framework
LICENSE=	lgpl

LIB_DEPENDS=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib

USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack glib20 ltverhack
CONFIGURE_ARGS=	--disable-hspell \
		--disable-uspell
CONFIGURE_ENV+=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=		enchant.1

.ifndef(WITHOUT_ASPELL)
LIB_DEPENDS+=	pspell.16:${PORTSDIR}/textproc/aspell
CONFIGURE_ARGS+=--enable-aspell \
		--with-aspell-prefix=${LOCALBASE}
PLIST_SUB+=	ASPELL=""
.else
CONFIGURE_ARGS+=--disable-aspell
PLIST_SUB+=	ASPELL="@comment "
.endif

.include <bsd.port.pre.mk>

pre-everything::
.if !defined(WITHOUT_ASPELL) || !defined(WITH_HSPELL)
	@${ECHO_CMD} '===> The following options are available for this port:'
.if !defined(WITHOUT_ASPELL)
	@${ECHO_CMD} '===>'
	@${ECHO_CMD} '===> Define WITHOUT_ASPELL to disable aspell support'
.endif
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|MKDIRPROG-mkdir|MKDIRPROG-mkdir -p|g' \
		${WRKSRC}/install-sh
	@${REINPLACE_CMD} -E -e "s|-Wunsafe-loop-optimizations ||g" \
		-e "s|-Wno-missing-field-initializers ||g" \
		-e "s|-Wno-attributes ||g" \
			${WRKSRC}/configure

.include <bsd.port.post.mk>
