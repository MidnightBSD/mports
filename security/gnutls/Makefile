# New ports collection makefile for:	gnutls
# Date created:				13 Nov 2002
# Whom:					Sergei Kolobov <sergei@kolobov.com>
#
# $MidnightBSD: mports/security/gnutls/Makefile,v 1.8 2008/05/22 21:43:17 laffer1 Exp $
# $FreeBSD: ports/security/gnutls/Makefile,v 1.42 2006/09/08 18:24:27 novel Exp $
#

PORTNAME=	gnutls
PORTVERSION=	2.4.1
PORTREVISION=	1
CATEGORIES=	security net
MASTER_SITES=	http://josefsson.org/gnutls/releases/ \
	ftp://ftp.gnutls.org/pub/gnutls/ \
	${MASTER_SITE_GNUPG} \
	http://www.mirrors.wiretapped.net/security/network-security/gnutls/ \
	ftp://ftp.mirrors.wiretapped.net/security/network-security/gnutls/
MASTER_SITE_SUBDIR=	alpha/gnutls

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Transport Layer Security library
LICENSE=        gpl3
LIB_DEPENDS=	gcrypt.15:${PORTSDIR}/security/libgcrypt \
		gpg-error.0:${PORTSDIR}/security/libgpg-error

USE_BZIP2=	yes
USE_ICONV=	yes
USE_GNOME=	pkgconfig ltverhack
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:15
USE_GCC=	3.4+
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS} -fPIC" LDFLAGS="${LDFLAGS}"
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS+=	--with-included-lzo --disable-guile \
			--infodir="${PREFIX}/info" --mandir="${PREFIX}/man/"
MANCOMPRESSED=	no

.include <bsd.port.pre.mk>
.if defined(WITH_OPENCDK) || exists(${LOCALBASE}/lib/libopencdk.so.10)
LIB_DEPENDS+=	opencdk.10:${PORTSDIR}/security/opencdk
.endif

.if defined(WITH_LIBTASN1) || exists(${LOCALBASE}/lib/libtasn1.so.3)
LIB_DEPENDS+=	tasn1.3:${PORTSDIR}/security/libtasn1
.endif

.if defined(WITHOUT_CXX)
CONFIGURE_ARGS+=	--disable-cxx
PLIST_SUB+=	CXX="@comment "
.else
PLIST_SUB+=	CXX=""
.endif

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=		NLS="@comment "
.else
USE_GETTEXT=		yes
PLIST_SUB+=		NLS=""
.endif

.if !defined(NOPORTDOCS)
PORTDOCS=		AUTHORS NEWS README THANKS
.endif
EXAMPLES=	doc/examples/*.c

post-patch:
	@${REINPLACE_CMD} -e 's,(libdir)/pkgconfig,(prefix)/libdata/pkgconfig,' \
		${WRKSRC}/lib/Makefile.in ${WRKSRC}/libextra/Makefile.in

post-install:
	@${MKDIR} ${EXAMPLESDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${EXAMPLES} ${EXAMPLESDIR}
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for i in ${PORTDOCS}
	@${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif

.include "Makefile.man"
.include <bsd.port.post.mk>
