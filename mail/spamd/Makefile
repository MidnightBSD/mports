# New ports collection makefile for:	spamd
# Date created:		23 June 2003
# Whom:			Max Laier <max@love2party.net>
#
# $MidnightBSD: mports/mail/spamd/Makefile,v 1.1 2006/10/24 16:00:33 wintellect Exp $
# $FreeBSD: ports/mail/spamd/Makefile,v 1.10 2006/05/10 17:55:07 delphij Exp $
#

PORTNAME=	spamd
PORTVERSION=	3.7
PORTREVISION=	2
CATEGORIES=	mail
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	delphij
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Traps spammers with a very slow smtp-login and return 4xx error

USE_BZIP2=	yes

.include <bsd.port.pre.mk>

.if defined(WITH_IPFW)
CFLAGS+= -DIPFW
.else
LOCAL_PFCTL=	/sbin/pfctl
.endif

USE_RC_SUBR=	pfspamd.sh

.if !defined(BATCH) && !defined(PACKAGE_BUILDING)
IS_INTERACTIVE=	yes
.endif

MAN5=		spamd.conf.5
MAN8=		spamd.8 spamd-setup.8 spamdb.8 spamlogd.8

SAMPLE_SPAMD_CONF=	${PREFIX}/etc/spamd.conf.sample

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCAL_PFCTL%%|${LOCAL_PFCTL}|;	\
	    s|%%LOCAL_SPAMD_CONF%%|${PREFIX}/etc/spamd.conf|'		\
	    ${WRKSRC}/spamd-setup/spamd-setup.c
	@${REINPLACE_CMD} -e 's|/etc/spamd.conf|${PREFIX}/etc/spamd.conf|' \
	    ${WRKSRC}/spamd/spamd.8 ${WRKSRC}/spamd-setup/spamd-setup.8


do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/spamd/spamd ${PREFIX}/libexec
	${INSTALL_PROGRAM} ${WRKSRC}/spamlogd/spamlogd ${PREFIX}/libexec
	${INSTALL_PROGRAM} ${WRKSRC}/spamd-setup/spamd-setup ${PREFIX}/sbin
	${INSTALL_PROGRAM} ${WRKSRC}/spamdb/spamdb ${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/doc/spamd.conf.5 ${PREFIX}/man/man5
	${INSTALL_MAN} ${WRKSRC}/spamd/spamd.8 ${PREFIX}/man/man8
	${INSTALL_MAN} ${WRKSRC}/spamd-setup/spamd-setup.8 ${PREFIX}/man/man8
	${INSTALL_MAN} ${WRKSRC}/spamdb/spamdb.8 ${PREFIX}/man/man8
	${INSTALL_MAN} ${WRKSRC}/spamlogd/spamlogd.8 ${PREFIX}/man/man8
	@if [ ! -f ${SAMPLE_SPAMD_CONF} ]; then			\
		${ECHO_MSG} "Installing ${SAMPLE_SPAMD_CONF} file."; \
		${INSTALL_DATA} ${WRKSRC}/doc/spamd.conf	\
		${SAMPLE_SPAMD_CONF};				\
	fi

.include <bsd.port.post.mk>
