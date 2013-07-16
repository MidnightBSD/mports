# $MidnightBSD: mports/security/libgcrypt/Makefile,v 1.15 2013/01/19 17:58:17 laffer1 Exp $

PORTNAME=	libgcrypt
PORTVERSION=	1.5.2
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GNUPG}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	General purpose crypto library based on code used in GnuPG

LICENSE=	gpl2

BUILD_DEPENDS=	libgpg-error>=1.8:${PORTSDIR}/security/libgpg-error
RUN_DEPENDS=	libgpg-error>=1.8:${PORTSDIR}/security/libgpg-error

USE_BZIP2=	yes
USE_AUTOTOOLS=	libtool
USE_CSTD=	gnu89
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	MAKEINFO="makeinfo --no-split"
USE_LDCONFIG=	yes

DOCS=		AUTHORS ChangeLog ChangeLog-2011 INSTALL NEWS README \
		README.GIT THANKS TODO doc/HACKING doc/README.apichanges
INFO=		gcrypt
PORTDOCS=	*

.include <bsd.port.pre.mk>

.if ${ARCH} == "i386"
.if (${OSVERSION} < 4015)
CONFIGURE_ARGS+=	--disable-aesni-support
.endif
.endif

post-patch:
	@${REINPLACE_CMD} -e "s|%%PTHREAD_LIBS%%|${PTHREAD_LIBS}|" \
		${WRKSRC}/ltmain.sh

pre-configure:
	@${RM} -f ${WRKSRC}/doc/gcrypt.info*

.if ${PORT_OPTIONS:MDOCS}
post-install:
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}
.endif

regression-test: build
	cd ${WRKSRC} && ${MAKE} check

.include <bsd.port.post.mk>
