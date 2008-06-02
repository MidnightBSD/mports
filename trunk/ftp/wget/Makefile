# Ports collection makefile for:  wget
# Date created:			  31 December 1996
# Whom:				  Thomas Gellekum <tg@FreeBSD.org>
#
# $MidnightBSD: mports/ftp/wget/Makefile,v 1.3 2008/05/02 18:27:57 laffer1 Exp $
# $FreeBSD: ports/ftp/wget/Makefile,v 1.83 2006/08/02 19:33:51 sobomax Exp $
#

PORTNAME=	wget
DISTVERSION=	1.11.3
CATEGORIES=	ftp www ipv6
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	wget

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Retrieve files from the Net via HTTP and FTP
LICENSE=	gpl3

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
.endif

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_PERL5_BUILD=	yes
GNU_CONFIGURE=		yes

.if defined(WITHOUT_SSL)
CONFIGURE_ARGS=		--with-ssl=no
.else
USE_OPENSSL=	yes
.endif

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB=	NLS="@comment "
.else
CONFIGURE_ARGS+=	--enable-nls
LDFLAGS=	-L${LOCALBASE}/lib
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		"LDFLAGS=${LDFLAGS}"
PLIST_SUB=	NLS=""
.endif

MAN1=		wget.1
INFO=		wget

post-patch:
	${RM} -f ${WRKSRC}/doc/wget.info* ${WRKSRC}/po/*.mo ${WRKSRC}/po/*.gmo
	@# eliminate gmakism
	${REINPLACE_CMD} -e 's,$$<,$$(srcdir)/wget.texi,' \
		${WRKSRC}/doc/Makefile.in
	${REINPLACE_CMD} -e 's,/usr/local/etc/wgetrc,${PREFIX}/etc/wgetrc,' \
			 -e 's,@file{},@file{${PREFIX}},' \
		${WRKSRC}/doc/sample.wgetrc* ${WRKSRC}/doc/wget.texi

.include <bsd.port.mk>
