# $MidnightBSD: mports/net-im/kopete/Makefile,v 1.7 2011/02/02 21:16:29 laffer1 Exp $

PORTNAME=	kopete
PORTVERSION=	0.12.8
PORTREVISION=	6
CATEGORIES?=	net-im kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/3.5.10/src
PKGNAMEPREFIX=	kdenetwork-
DISTNAME=	kdenetwork-3.5.10
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE multi-protocol instant messenger (IM)
LICENSE=	gpl2

RUN_DEPENDS=	${QT_PREFIX}/lib/plugins/crypto/libqca-tls.so:${PORTSDIR}/security/qca-tls
LIB_DEPENDS=	speex:${PORTSDIR}/audio/speex \
		ilbc:${PORTSDIR}/net/ilbc \
		ortp:${PORTSDIR}/net/ortp

CONFLICTS=	kvirc-[0-9]*

USE_KDELIBS_VER=3
PREFIX=		${KDE_PREFIX}

USE_BZIP2=	yes
USE_GNOME=	glib20
USE_OPENSSL=	yes
USE_XORG=	xtst

USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_PKGCONFIG=	yes
CONFIGURE_ARGS+=--with-ilbc=${LOCALBASE} \
		--with-speex=${LOCALBASE} \
		--with-ssl-dir=${OPENSSLBASE} \
		--without-external-libgadu \
		--enable-jingle
CONFIGURE_ENV=	EXPAT_CFLAGS="-I${LOCALBASE}/include" \
		EXPAT_LIBS="-L${LOCALBASE}/lib -lexpat" \
		ILBC_CFLAGS="-I${LOCALBASE}/include/ilbc" \
		ILBC_LIBS="-L${LOCALBASE}/lib -lilbc" \
		SPEEX_CFLAGS="$$(${PKG_CONFIG} --cflags speex)" \
		SPEEX_LIBS="$$(${PKG_CONFIG} --libs speex)"

USE_LDCONFIG=	yes
_NO_KDE_FINAL=	yes

WRKSRC=		${WRKDIR}/${DISTNAME}
BUILD_WRKSRC=	${WRKSRC}/kopete
INSTALL_WRKSRC=	${WRKSRC}/kopete

OPTIONS=	WEBCAM "Enable webcamera support" off

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"
.include <bsd.port.pre.mk>

.if defined(WITH_WEBCAM)
BUILD_DEPENDS+=	${LOCALBASE}/include/linux/videodev.h:${PORTSDIR}/multimedia/v4l_compat
EXTRA_PATCHES=	${FILESDIR}/extrapatch-kopete_libkopete_avdevice-videodevice.cpp \
		${FILESDIR}/extrapatch-kopete_libkopete_avdevice-videodevice.h \
		${FILESDIR}/extrapatch-kopete_libkopete_avdevice-videodevicepool.cpp
.endif

post-patch:
# force usage of gthread for libjingle's benefit
	@${REINPLACE_CMD} -E \
		-e 's|(glib-2.0)|gthread-2.0 \1|' \
		${CONFIGURE_WRKSRC}/${CONFIGURE_SCRIPT}

post-configure:
# configure does not handle OSS support
.for feature in \
	FEATURE_ENABLE_CHAT_ARCHIVING \
	FEATURE_ENABLE_SSL \
	HAVE_SYS_SOUNDCARD_H
	@${ECHO_CMD} \
		'#define ${feature} 1' >> \
		${CONFIGURE_WRKSRC}/config.h
.endfor

.include <bsd.port.post.mk>
