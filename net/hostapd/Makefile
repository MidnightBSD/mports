PORTNAME=	hostapd
PORTVERSION=	2.11
CATEGORIES=	net
MASTER_SITES=	https://w1.fi/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator

LICENSE=	bsd3

USES=		cpe gmake ssl
CPE_VENDOR=	w1.f1
BUILD_WRKSRC=	${WRKSRC}/hostapd
CFLAGS+=	-I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB}

PLIST_FILES=	sbin/hostapd sbin/hostapd_cli share/man/man1/hostapd_cli.1.gz \
		share/man/man8/hostapd.8.gz
.if !exists(/etc/rc.d/hostapd)
USE_RC_SUBR=	hostapd
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|@$$(E) "  CC " $$<|@$$(E) "  $$(CC) " $$<|' \
		${BUILD_WRKSRC}/Makefile
	@${SED} -e 's|@PREFIX@|${PREFIX}|g' ${FILESDIR}/config \
		>> ${WRKSRC}/hostapd/.config

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/hostapd/hostapd ${PREFIX}/sbin
	${INSTALL_PROGRAM} ${WRKSRC}/hostapd/hostapd_cli \
		${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/hostapd/hostapd_cli.1 \
		${PREFIX}/share/man/man1
	${INSTALL_MAN} ${WRKSRC}/hostapd/hostapd.8 \
		${PREFIX}/share/man/man8

.include <bsd.port.mk>
