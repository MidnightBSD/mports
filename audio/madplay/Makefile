# New ports collection makefile for:  madplay
# Date created:        26 November 2003
# Whom:                Sergey Akifyev <asa@gascom.ru>
#
# $MidnightBSD: mports/audio/madplay/Makefile,v 1.1 2006/10/01 02:31:51 archite Exp $
# $FreeBSD: ports/audio/madplay/Makefile,v 1.9 2006/09/11 12:31:15 yar Exp $
#

PORTNAME=	madplay
PORTVERSION=	0.15.2b
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE} \
		ftp://ftp.mars.org/pub/mpeg/
MASTER_SITE_SUBDIR=	mad

MAINTAINER=	asa@gascom.ru
COMMENT=	Madplay MP3 player (part of MAD project)
LICENSE=	gpl2

LIB_DEPENDS=	mad.2:${PORTSDIR}/audio/libmad \
		id3tag.0:${PORTSDIR}/audio/libid3tag

WANT_GNOME=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	LDFLAGS="-L${LOCALBASE}/lib"
ALL_TARGET=	all madtime

MAN1=		abxtest.1 madplay.1

.if !defined(WITHOUT_NLS)
USE_GETTEXT=		yes
PLIST_SUB+=		NLS=""
.else
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=		NLS="@comment "
.endif

.include <bsd.port.pre.mk>

.if ${HAVE_GNOME:Mesound} != ""
USE_GNOME+=	esound
PKGNAMESUFFIX=	-esound
.else
CONFIGURE_ARGS+=	--without-esd
.endif

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/madtime ${PREFIX}/bin

.include <bsd.port.post.mk>
