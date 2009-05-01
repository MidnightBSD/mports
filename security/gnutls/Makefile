# $MidnightBSD: mports/security/gnutls/Makefile,v 1.10 2009/05/01 14:22:34 laffer1 Exp $

PORTNAME=	gnutls
PORTVERSION=	2.6.6
CATEGORIES=	security net
MASTER_SITES=	${MASTER_SITE_GNU} \
		${MASTER_SITE_GNUPG}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU Transport Layer Security library
LICENSE=        gpl3

LIB_DEPENDS=	gcrypt.16:${PORTSDIR}/security/libgcrypt \
		gpg-error.0:${PORTSDIR}/security/libgpg-error

USE_BZIP2=	yes
USE_ICONV=	yes
USE_GNOME=	pkgconfig ltverhack
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:15
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS} -fPIC" LDFLAGS="${LDFLAGS}"
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS+=	--with-included-lzo --disable-guile \
			--infodir="${PREFIX}/info" --mandir="${PREFIX}/man/"
MANCOMPRESSED=	no

.include <bsd.port.pre.mk>

.if (defined(WITH_LIBTASN1) || exists(${LOCALBASE}/lib/libtasn1.so.4)) && !defined(WITHOUT_LIBTASN1)
LIB_DEPENDS+=	tasn1.3:${PORTSDIR}/security/libtasn1
.else
CONFIGURE_ARGS+=	--with-included-libtasn1
.endif

.if (defined(WITH_LZO) || exists(${LOCALBASE}/lib/liblzo2.so)) && !defined(WITHOUT_LZO)
LIB_DEPENDS+=		lzo2:${PORTSDIR}/archivers/lzo2
CONFIGURE_ARGS+=	--with-lzo
.else
CONFIGURE_ARGS+=	--with-lzo=no
.endif

.if defined(WITHOUT_CXX)
CONFIGURE_ARGS+=	--disable-cxx
PLIST_SUB+=		CXX="@comment "
.else
PLIST_SUB+=		CXX=""
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

pre-configure:
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
