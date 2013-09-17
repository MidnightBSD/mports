# $MidnightBSD$

PORTNAME=		tevent
PORTVERSION=		0.9.8
PORTEPOCH=		0
CATEGORIES=		devel
MASTER_SITES=		${MASTER_SITE_SAMBA}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		Talloc based event loop library

LICENSE=		lgpl3

LIB_DEPENDS=		talloc.2:${PORTSDIR}/devel/talloc

CONFLICTS=

USE_GMAKE=		yes
USE_LDCONFIG=		yes
GNU_CONFIGURE=		yes
USE_GNOME=		pkgconfig
USE_AUTOTOOLS=		autoconf autoheader

IPATHS=			-I${WRKSRC}/libreplace
AUTOHEADER_ARGS=	${IPATHS}
AUTOCONF_ARGS=		${IPATHS}

PKGCONFIGDIR?=		${PREFIX}/libdata/pkgconfig
PKGCONFIGDIR_REL?=	${PKGCONFIGDIR:S|^${PREFIX}/||}

PLIST_FILES=		include/tevent.h \
			lib/libtevent.a \
			lib/libtevent.so \
			lib/libtevent.so.0 \
			${PKGCONFIGDIR_REL}/tevent.pc

post-install:
			${LN} -sf libtevent.so.0 ${PREFIX}/lib/libtevent.so

.include <bsd.port.mk>
