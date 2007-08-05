# New ports collection Makefile for:	libgcrypt
# Date created:				July 17 2002
# Whom:					Tilman Linneweh <arved@FreeBSD.org>
#
# $MidnightBSD: mports/security/libgcrypt/Makefile,v 1.1 2006/09/21 14:19:06 laffer1 Exp $
# $FreeBSD: ports/security/libgcrypt/Makefile,v 1.30 2006/08/31 21:20:52 arved Exp $

PORTNAME=	libgcrypt
PORTVERSION=	1.2.3
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GNUPG}
MASTER_SITE_SUBDIR=	libgcrypt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	"General purpose crypto library based on code used in GnuPG"

LIB_DEPENDS=	gpg-error.3:${PORTSDIR}/security/libgpg-error

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	MAKEINFO="makeinfo --no-split"
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0
INSTALLS_SHLIB=	yes

INFO=	gcrypt

.include <bsd.port.pre.mk>

.if ${ARCH} == "powerpc"
CONFIGURE_ARGS+=	--disable-asm
.endif

post-patch:
	@${REINPLACE_CMD} -e "s|%%PTHREAD_LIBS%%|${PTHREAD_LIBS}|" \
		${WRKSRC}/ltmain.sh

pre-configure:
	@${RM} -f ${WRKSRC}/doc/gcrypt.info*

.include <bsd.port.post.mk>
