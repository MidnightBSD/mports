# New ports collection Makefile for:	libgcrypt
# Date created:				July 17 2002
# Whom:					Tilman Linneweh <arved@FreeBSD.org>
#
# $MidnightBSD: mports/security/libgcrypt/Makefile,v 1.5 2008/03/22 17:00:58 ctriv Exp $
# $FreeBSD: ports/security/libgcrypt/Makefile,v 1.30 2006/08/31 21:20:52 arved Exp $

PORTNAME=	libgcrypt
PORTVERSION=	1.4.1
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GNUPG}
MASTER_SITE_SUBDIR=	libgcrypt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	"General purpose crypto library based on code used in GnuPG"
LICENSE=	gpl2

LIB_DEPENDS=	gpg-error.0:${PORTSDIR}/security/libgpg-error

USE_AUTOTOOLS=	libtool:15
USE_BZIP2=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--disable-padlock-support
CONFIGURE_ENV=	MAKEINFO="makeinfo --no-split"
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0
USE_LDCONFIG=	yes

DOCS= 	AUTHORS COPYING COPYING.LIB ChangeLog INSTALL NEWS README README.SVN \
	THANKS TODO doc/HACKING doc/README.apichanges
INFO=	gcrypt

.include <bsd.port.pre.mk>


post-patch:
	@${REINPLACE_CMD} -e "s|%%PTHREAD_LIBS%%|${PTHREAD_LIBS}|" \
		${WRKSRC}/ltmain.sh

pre-configure:
	@${RM} -f ${WRKSRC}/doc/gcrypt.info*


.if !defined(NOPORTDOCS)
post-install:
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
