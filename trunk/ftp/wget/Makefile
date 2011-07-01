# $MidnightBSD: mports/ftp/wget/Makefile,v 1.8 2010/07/31 00:28:03 laffer1 Exp $

PORTNAME=	wget
DISTVERSION=	1.12
PORTREVISION=	3
CATEGORIES=	ftp www ipv6
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	wget
EXTRACT_SUFX=	.tar.lzma

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Retrieve files from the Net via HTTP and FTP
LICENSE=	gpl3

USE_XZ=		yes
USE_GMAKE=	yes
USE_PERL5_BUILD=yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	CPPFLAGS="${CPPFLAGS}" \
		LDFLAGS="${LDFLAGS}"
MAKE_JOBS_SAFE=	yes

OPTIONS=	GNUTLS "Support for SSL via GnuTLS" Off \
		IPV6 "Support for IPv6" On \
		NLS "Native Language Support with gettext" On \
		OPENSSL "Support for SSL via OpenSSL" On

.include <bsd.mport.options.mk>

.if !defined(WITHOUT_OPENSSL)
.if !defined(WITHOUT_GNUTLS)
IGNORE=	GNUTLS and OPENSSL are mutually exclusive, enable at most one of them
.endif
EXTENSIONS+=	openssl
CONFIGURE_ARGS+=--with-ssl
CPPFLAGS+=	-I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB}
.elif !defined(WITHOUT_GNUTLS)
LIB_DEPENDS+=	gnutls:${PORTSDIR}/security/gnutls
CONFIGURE_ARGS+=--with-ssl=gnutls
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
.else
CONFIGURE_ARGS+=--without-ssl
.endif

.if !defined(WITHOUT_IPV6)
CONFIGURE_ARGS+=--enable-ipv6
.else
CONFIGURE_ARGS+=--disable-ipv6
.endif

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
CONFIGURE_ARGS+=--enable-nls
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB=	NLS="@comment "
.endif

MAN1=		wget.1
INFO=		wget

.include <bsd.port.pre.mk>

post-patch:
	# eliminate gmakism
	${REINPLACE_CMD} -e 's,$$<,$$(srcdir)/wget.texi,' \
		${WRKSRC}/doc/Makefile.in
	${REINPLACE_CMD} -e 's,/usr/local/etc/wgetrc,${PREFIX}/etc/wgetrc,' \
			 -e 's,@file{},@file{${PREFIX}},' \
		${WRKSRC}/doc/sample.wgetrc* ${WRKSRC}/doc/wget.texi

.include <bsd.port.post.mk>
