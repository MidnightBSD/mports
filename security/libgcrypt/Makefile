# $MidnightBSD: mports/security/libgcrypt/Makefile,v 1.12 2010/08/01 04:59:14 laffer1 Exp $

PORTNAME=	libgcrypt
PORTVERSION=	1.4.6
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GNUPG}
MASTER_SITE_SUBDIR=	libgcrypt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General purpose crypto library based on code used in GnuPG
LICENSE=	gpl2

LIB_DEPENDS=	gpg-error.0:${PORTSDIR}/security/libgpg-error

USE_BZIP2=	yes
USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	MAKEINFO="makeinfo --no-split"
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
