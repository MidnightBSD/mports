PORTNAME=	antivirus
PORTVERSION=	3.30
CATEGORIES=	mail
MASTER_SITES=	LOCAL/dinoex

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sendmail milter wich uses McAfee Virus Scan or clamav

LICENSE=	bsd2

CFLAGS+=	-Wall
LIBS+=		-lmilter -lpthread
PLIST_SUB+=	ANTIVIRUS=${ANTIVIRUS_DIR}
SUB_LIST+=	ANTIVIRUS=${ANTIVIRUS_DIR}
SED_SCRIPT=	-e 's|%%ANTIVIRUS%%|${ANTIVIRUS_DIR}|g' \
		-e 's|%%PREFIX%%|${PREFIX}|g'
USE_RC_SUBR=	antivirus

ANTIVIRUS_DIR?=	/var/spool/antivirus

.include <bsd.port.pre.mk>

.include "${PORTSDIR}/mail/sendmail/bsd.milter.mk"

LIBS+=		${LDFLAGS}

MAKE_ENV+=	SENDMAILBASE="${MILTERBASE}" \
		SENDMAILOBJ="${MILTERBASE}" \
		LIBS="${LIBS}"

do-configure:
	@${REINPLACE_CMD} -e 's|/etc/mail/antivirus.conf|${LOCALBASE}/etc/antivirus.conf|' \
		${CONFIGURE_WRKSRC}/antivirus.c
	@${SED} ${SED_SCRIPT} ${FILESDIR}/antivirus.conf \
		> ${WRKSRC}/antivirus.conf
	@${SED} ${SED_SCRIPT} ${FILESDIR}/clamav.conf \
		> ${WRKSRC}/clamav.conf

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/antivirus \
		${PREFIX}/libexec/antivirus
	${INSTALL_DATA} ${WRKSRC}/antivirus.conf \
		${PREFIX}/etc/antivirus.conf-dist
	${INSTALL_DATA} ${WRKSRC}/clamav.conf \
		${PREFIX}/etc/antivirus.conf-clamav
	${MKDIR} ${FAKE_DESTDIR}${ANTIVIRUS_DIR}/spool ${FAKE_DESTDIR}${ANTIVIRUS_DIR}/run ${FAKE_DESTDIR}${ANTIVIRUS_DIR}/quarantine
	@${ECHO_MSG} "Add to your *.mc configfile:"
	@${ECHO_MSG} "INPUT_MAIL_FILTER(\`antivirus', \`S=local:${ANTIVIRUS_DIR}/antivirus.sock, F=')"

.include <bsd.port.post.mk>
