# $MidnightBSD: mports/sysutils/ucspi-tcp/Makefile,v 1.3 2008/11/07 17:59:15 ctriv Exp $

PORTNAME=	ucspi-tcp
PORTVERSION=	0.88
PORTREVISION=	2
CATEGORIES=	sysutils net
MASTER_SITES=	http://cr.yp.to/ucspi-tcp/ \
		${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	garga/ucspi-tcp
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command-line tools for building TCP client-server applications
LICENSE=	restricted

OPTIONS=	MAN "Install man(1) pages" on \
		RSS_DIFF "Patch rblsmtpd for qmail users" off \
		SSL "Adds support for SSL (Secure Socket Layer)" off \
		RBL2SMTPD "Don't drop connection, pass envvar to smtpd" off

RESTRICTED=	Unsure of djb's license

MAKE_JOBS_SAFE=	yes
ALL_TARGET=	prog install instcheck

SCRIPTS_ENV=	BINOWN="${BINOWN}" BINGRP="${BINGRP}" BINMODE="${BINMODE}" \
		MANMODE="${MANMODE}" CFLAGS="${CFLAGS}"

.include <bsd.mport.options.mk>

.if defined(WITH_MAN)
MASTER_SITES+=	http://smarden.org/pape/djb/manpages/:man \
		${MASTER_SITE_FREEBSD_LOCAL:S/$/:man/}
MASTER_SITE_SUBDIR+=	garga/ucspi-tcp/:man
DISTFILES+=	${DISTNAME}${EXTRACT_SUFX} \
		${DISTNAME}-man.tar.gz:man
MAN1=		addcr.1 argv0.1 date@.1 delcr.1 finger@.1 fixcrio.1 \
		http@.1 mconnect.1 rblsmtpd.1 recordio.1 tcpcat.1 \
		tcpclient.1 tcprules.1 tcprulescheck.1 tcpserver.1 who@.1
.endif

.if defined(WITH_RSS_DIFF)
PATCH_SITES+=	http://www.qmail.org/
PATCHFILES+=	ucspi-rss.diff
PATCH_DIST_STRIP=	-p1
.endif

.if defined(WITH_SSL)
EXTENSIONS+=	openssl
PATCH_SITES+=	http://www.nrg4u.com/qmail/
PATCHFILES+=	ucspi-tcp-ssl-20050405.patch.gz
PATCH_DIST_STRIP=	-p1

post-patch:
	@${REINPLACE_CMD} -e 's|#INCS=-I/usr/local/include|INCS=-I${OPENSSLBASE}/include|g; \
			s|-lcrypto|-L${OPENSSLBASE}/lib |g' ${WRKSRC}/Makefile
.endif

.if defined(WITH_RBL2SMTPD)
PATCH_SITES+=		${MASTER_SITE_LOCAL:S/$/garga\/ucspi-tcp\/:rbl2smtpd/}
PATCHFILES+=		ucspi-tcp_rbl2smtpd.diff:rbl2smtpd
PATCH_DIST_STRIP=	-p1
.endif

.include <bsd.port.pre.mk>

post-configure:
	@${ECHO_CMD} ${PREFIX} > ${WRKSRC}/conf-home
	@${ECHO_CMD} ${CC} ${CFLAGS} > ${WRKSRC}/conf-cc
	@${ECHO_CMD} ${CC} -s > ${WRKSRC}/conf-ld

do-install:
.for file_name in addcr argv0 delcr fixcrio mconnect-io rblsmtpd recordio tcpclient tcprules tcprulescheck tcpserver
	@${INSTALL_PROGRAM} ${WRKSRC}/${file_name} ${PREFIX}/bin
.endfor
.for file_name in date@ finger@ http@ mconnect who@ tcpcat
	@${INSTALL_SCRIPT} ${WRKSRC}/${file_name} ${PREFIX}/bin
.endfor
.if !defined(WITHOUT_MAN)
	@cd ${WRKSRC}-man; ${INSTALL_MAN} ${MAN1} ${PREFIX}/man/man1/
.endif

.include <bsd.port.post.mk>
