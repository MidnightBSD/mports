# $MidnightBSD$

PORTNAME=	yafic
PORTVERSION=	1.2.2
PORTREVISION=	1
CATEGORIES=	security
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Yet Another File Integrity Checker, similar to Tripwire
LICENSE=	bsd2

GNU_CONFIGURE=	yes
USES=		gmake
LDFLAGS+=	-static

.if defined(WITHOUT_OPENSSL)
CONFIGURE_ARGS=	--disable-crypto
PLIST_SUB+=	CRYPTO="@comment "
.else
PLIST_SUB+=	CRYPTO=""
.endif

PKGMESSAGE=	${WRKDIR}/pkg-message

post-patch:
	@${SED} -e "s;@@PREFIX@@;${PREFIX};g" \
		${.CURDIR}/pkg-message > ${PKGMESSAGE}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/yafic ${PREFIX}/bin
.if !defined(WITHOUT_OPENSSL)
	${INSTALL_PROGRAM} ${WRKSRC}/yafic-sign ${PREFIX}/bin
	${LN} -f ${PREFIX}/bin/yafic-sign ${PREFIX}/bin/yafic-check
.endif
	${INSTALL_MAN} ${WRKSRC}/yafic.1 ${PREFIX}/man/man1
.if !defined(WITHOUT_OPENSSL)
	${INSTALL_MAN} ${WRKSRC}/yafic-sign.1 ${PREFIX}/man/man1
	${LN} -sf yafic-sign.1 ${PREFIX}/man/man1/yafic-check.1
.endif
	${INSTALL_MAN} ${WRKSRC}/yafic.conf.5 ${PREFIX}/man/man5

post-install:
	@${MKDIR} ${PREFIX}/share/examples/yafic
	@${CP} ${FILESDIR}/yafic.conf.sample ${EXAMPLESDIR}
	@${SED} -e "s%@@PREFIX@@%${PREFIX}%g" ${PKGMESSAGE}

.include <bsd.port.mk>
