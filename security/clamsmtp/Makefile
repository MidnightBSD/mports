PORTNAME=	clamsmtp
PORTVERSION=	1.10
PORTREVISION=	5
CATEGORIES=	security
MASTER_SITES=	http://thewalter.net/stef/software/clamsmtp/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ClamAV anti-virus SMTP Filter
WWW=		http://thewalter.net/stef/software/clamsmtp/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

GNU_CONFIGURE=	yes
USES=		gmake
USE_RC_SUBR=	clamsmtpd
SUB_LIST=	CLAMAV_PID_DIR=${CLAMAV_PID_DIR}
SUB_FILES=	pkg-message

CLAMAV_PID_DIR?=/var/run/clamav

PORTDOCS=	README
PORTEXAMPLES=	*

OPTIONS_DEFINE=		DOCS LOCAL_CLAMAV EXAMPLES
OPTIONS_DEFAULT=	LOCAL_CLAMAV

LOCAL_CLAMAV_DESC=		RUN_DEPEND on security/clamav
LOCAL_CLAMAV_RUN_DEPENDS=	clamav>=0:security/clamav
LOCAL_CLAMAV_SUB_LIST=		CLAMD=clamd
LOCAL_CLAMAV_SUB_LIST_OFF=	CLAMD=

post-patch:
	@${REINPLACE_CMD} -e "s,/var/run/clamav/clamd,/var/run/clamav/clamd.sock," \
		${WRKSRC}/doc/clamsmtpd.conf \
		${WRKSRC}/doc/clamsmtpd.conf.5 \
		${WRKSRC}/src/clamsmtpd.c

post-install:
	${INSTALL_DATA} ${WRKSRC}/doc/clamsmtpd.conf ${STAGEDIR}${PREFIX}/etc/clamsmtpd.conf.sample

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${FAKE_DESTDIR}${DOCSDIR}

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/virus_action.sh ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
