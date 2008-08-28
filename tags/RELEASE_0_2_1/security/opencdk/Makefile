# New ports collection makefile for:	opencdk
# Date created:		15 Jan 2003
# Whom:			Sergei Kolobov <sergei@kolobov.com>
#
# $MidnightBSD: mports/security/opencdk/Makefile,v 1.1 2007/12/30 01:32:04 laffer1 Exp $
# $FreeBSD: ports/security/opencdk/Makefile,v 1.26 2007/02/14 12:09:24 novel Exp $
#

PORTNAME=	opencdk
PORTVERSION=	0.6.0
PORTEPOCH=	1
CATEGORIES=	security
MASTER_SITES=	http://josefsson.org/gnutls/releases/opencdk/ \
		${MASTER_SITE_GNUPG} \
		http://www.mirrors.wiretapped.net/security/network-security/gnutls/opencdk/ \
		ftp://ftp.mirrors.wiretapped.net/security/network-security/gnutls/opencdk/ \
		ftp://ftp.gnutls.org/pub/gnutls/opencdk/
MASTER_SITE_SUBDIR=	alpha/gnutls/opencdk

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open Crypto Development Kit

LIB_DEPENDS=	gcrypt.15:${PORTSDIR}/security/libgcrypt

GNU_CONFIGURE=	yes
USE_GNOME=	pkgconfig ltverhack
USE_AUTOTOOLS=	libtool:15
USE_LDCONFIG=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS=	--with-libgcrypt-prefix=${LOCALBASE}

DOCS=		AUTHORS NEWS README THANKS doc/opencdk-api.html

post-patch:
	@${REINPLACE_CMD} -e 's,(libdir)/pkgconfig,(prefix)/libdata/pkgconfig,' \
		${WRKSRC}/src/Makefile.in

post-install:
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/tests/*.c ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/tests/*.gpg ${EXAMPLESDIR}
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
