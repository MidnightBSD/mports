# New ports collection makefile for:	courier-pythonfilter
# Date created:				Jun 19, 2006
# Whom:					Milan Obuch
#
# $FreeBSD: ports/mail/courier-pythonfilter/Makefile,v 1.2 2007/01/16 10:28:15 itetcu Exp $
# $MidnightBSD: mports/mail/courier-pythonfilter/Makefile,v 1.2 2007/05/09 05:57:52 ctriv Exp $
#

PORTNAME=	courier-pythonfilter
PORTVERSION=	0.16
CATEGORIES=	mail python
MASTER_SITES=	http://phantom.dragonsdawn.net/~gordon/courier-patches/courier-pythonfilter/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework for courier filter development in python
LICENSE=	gpl2

BUILD_DEPENDS=	courier-config:${PORTSDIR}/mail/courier

USE_PYTHON=	yes
USE_PYDISTUTILS=yes

MAILOWN=	courier
MAILGRP=	courier
MAILUID=	465
MAILGID=	465

PLIST_SUB+=	MAILOWN=${MAILOWN} MAILGRP=${MAILGRP} \
		LOCALSTATEDIR=${LOCALSTATEDIR}

LOCALSTATEDIR=	/var/spool/courier
SCRIPTSDIR=	${TRUE_PREFIX}/libexec/filters

OPTIONS=	DEBUG		"debug module"			on \
		NODUPLICATES	"noduplicates module"		off \
		CLAMAV		"clamav module"			off \
		AUTO_WHITELIST	"auto_whitelist module"		off \
		WHITELIST	"whitelist module"		on \
		WHITELIST_AUTH	"whitelist_auth module"		on \
		PRIVATEADDR	"privateaddr module"		off \
		SPFCHECK	"spfcheck module"		off \
		NOSUCCESSDSN	"nosuccessdsn module"		off \
		COMEAGAIN	"comeagain module"		off \
		GREYLIST	"greylist module"		off \
		DIALBACK	"dialback module"		off \
		RATELIMIT	"ratelimit module"		off \
		ATTACHMENTS	"attachments module"		off

.include <bsd.port.pre.mk>

PYDISTUTILS_INSTALLARGS:=${PYDISTUTILS_INSTALLARGS} --install-scripts=${SCRIPTSDIR}

.if defined(WITH_CLAMAV)
RUN_DEPENDS+=	${PYTHON_SITELIBDIR}/pyclamav.so:${PORTSDIR}/security/py-clamav
.endif

post-extract:
	${MV} ${WRKSRC}/pythonfilter.conf ${WRKSRC}/pythonfilter.conf.sample

post-configure:
	@${ECHO_MSG} Creating sample config file based on your OPTIONS ...
.if !defined(WITHOUT_DEBUG)
	@${ECHO_MSG} debug >> ${WRKSRC}/pythonfilter.conf.sample
.endif
.if defined(WITH_NODUPLICATES)
	@${ECHO_MSG} noduplicate >> ${WRKSRC}/pythonfilter.conf.sample
.endif
.if defined(WITH_CLAMAV)
	@${ECHO_MSG} clamav >> ${WRKSRC}/pythonfilter.conf.sample
.endif
.if !defined(WITHOUT_AUTO_WHITELIST)
	@${ECHO_MSG} auto_whitelist >> ${WRKSRC}/pythonfilter.conf.sample
.endif
.if !defined(WITHOUT_WHITELIST)
	@${ECHO_MSG} whitelist >> ${WRKSRC}/pythonfilter.conf.sample
.endif
.if !defined(WITHOUT_WHITELIST_AUTH)
	@${ECHO_MSG} whitelist_auth >> ${WRKSRC}/pythonfilter.conf.sample
.endif
.if defined(WITH_PRIVATEADDR)
	@${ECHO_MSG} privateaddr >> ${WRKSRC}/pythonfilter.conf.sample
.endif
.if defined(WITH_SPFCHECK)
	@${ECHO_MSG} spfcheck >> ${WRKSRC}/pythonfilter.conf.sample
.endif
.if defined(WITH_NOSUCCESSDSN)
	@${ECHO_MSG} nosuccessdsn >> ${WRKSRC}/pythonfilter.conf.sample
.endif
.if defined(WITH_COMEAGAIN)
	@${ECHO_MSG} comeagain >> ${WRKSRC}/pythonfilter.conf.sample
.endif
.if defined(WITH_GREYLIST)
	@${ECHO_MSG} greylist >> ${WRKSRC}/pythonfilter.conf.sample
.endif
.if defined(WITH_DIALBACK)
	@${ECHO_MSG} dialback >> ${WRKSRC}/pythonfilter.conf.sample
.endif
.if defined(WITH_RATELIMIT)
	@${ECHO_MSG} ratelimit >> ${WRKSRC}/pythonfilter.conf.sample
.endif
.if defined(WITH_ATTACHMENTS)
	@${ECHO_MSG} attachments >> ${WRKSRC}/pythonfilter.conf.sample
.endif


.include <bsd.port.post.mk>
