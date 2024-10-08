PORTNAME=	procmail
DISTVERSION=	3.24
DISTVERSIONPREFIX=	v
CATEGORIES=	mail

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Local mail delivery agent
WWW=		https://www.procmail.org/

LICENSE=	gpl2

.if defined(QEMU_EMULATING) && "${QEMU_EMULATING}" == "1"
BROKEN=		fails to build under qemu: killing runaway build after 21600 seconds with no output
.endif

OPTIONS_DEFINE=	DOCS EXAMPLES

USE_GITHUB=	yes
GH_ACCOUNT=	BuGlessRB

INSTALL_TARGET=	install.bin install.man
USES=		cpe
#EXTRA_PATCHES=	${FILESDIR}/procmail-3.22-getline.patch:-p1

PORTDOCS=	FAQ FEATURES HISTORY KNOWN_BUGS README
PORTEXAMPLES=	1procmailrc 1rmail 2procmailrc 2rmail 3procmailrc 3rmail \
		advanced dirname forward local_procmail_lmtp.m4 mailstat

post-patch:
	@${REINPLACE_CMD} -e 's|%%PREFIX%%|${PREFIX}|g' ${WRKSRC}/config.h
# Allow parallel builds (-jX) to work
	@${FIND} ${WRKSRC} -name 'Makefile*' | ${XARGS} ${REINPLACE_CMD} -E -e 's|cd (.+); (\$$\(MAKE\))|\2 -C \1|' -e '/^MANDIR/s|/man|/share/man|'

post-install:
	${MKDIR} ${STAGEDIR}${DOCSDIR}/ ${STAGEDIR}${EXAMPLESDIR}/
	cd ${WRKSRC}/ && ${INSTALL_DATA} ${PORTDOCS} ${STAGEDIR}${DOCSDIR}/
	cd ${WRKSRC}/examples/ && ${INSTALL_DATA} ${PORTEXAMPLES} ${STAGEDIR}${EXAMPLESDIR}/

.include <bsd.port.mk>
