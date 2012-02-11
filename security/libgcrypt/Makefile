# $MidnightBSD: mports/security/libgcrypt/Makefile,v 1.13 2011/02/02 21:20:53 laffer1 Exp $

PORTNAME=	libgcrypt
PORTVERSION=	1.5.0
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GNUPG}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General purpose crypto library based on code used in GnuPG
LICENSE=	gpl2

LIB_DEPENDS=	gpg-error.0:${PORTSDIR}/security/libgpg-error

USE_BZIP2=	yes
USE_AUTOTOOLS=	libtool
USE_CSTD=	gnu89
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=      --disable-asm --disable-aesni-support
CONFIGURE_ENV=	MAKEINFO="makeinfo --no-split"
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd7.0
USE_LDCONFIG=	yes

DOCS=	AUTHORS COPYING COPYING.LIB ChangeLog INSTALL NEWS README README.SVN \
	THANKS TODO doc/HACKING doc/README.apichanges
INFO=	gcrypt

.include <bsd.port.pre.mk>

.if (${OSVERSION} < 2999)
CONFIGURE_ARGS+=	--disable-padlock-support
.endif

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
