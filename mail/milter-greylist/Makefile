# New ports collection makefile for:	milter-greylist
# Date created:				27 Apr 2004
# Whom:					Cyril Guibourg
#
# $MidnightBSD: mports/mail/milter-greylist/Makefile,v 1.3 2008/05/18 18:38:15 laffer1 Exp $
# $FreeBSD: ports/mail/milter-greylist/Makefile,v 1.22 2006/12/13 11:19:21 ache Exp $
#

PORTNAME=	milter-greylist
PORTVERSION=	4.0
CATEGORIES=	mail
MASTER_SITES=	ftp://ftp.espci.fr/pub/milter-greylist/
DISTNAME=	milter-greylist-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Easy-to-use greylist milter for sendmail
LICENSE=	bsd4
# well bsd3 but it's advertising... be conservative

PKGMESSAGE=	${WRKDIR}/pkg-message

OPTIONS=	LIBSPF2	 "Enable SPF checks" Off \
		GEOIP	 "Enable GEOIP"  Off \
		CURL	" Enable CURL for URL checks" Off

##
# Use the following quirks to choose which sendmail to use (ports or system):
#
#   WITH_SENDMAIL_BASE=yes
# or
#   WITH_SENDMAIL_PORT=yes
#
# If unspecified, check for an up-to-date system version but give an
# installed port preference over it.
##

MAN5=		greylist.conf.5
MAN8=		milter-greylist.8

.include <bsd.port.pre.mk>

.if !defined(WITH_SENDMAIL_BASE) && \
    !defined(WITH_SENDMAIL_PORT) && \
    !exists(${LOCALBASE}/lib/libmilter.a)
WITH_SENDMAIL_BASE=yes
.endif

.if defined(WITH_SENDMAIL_BASE)
.if exists(/usr/lib/libmilter.a)
MILTERBASE=	/usr
.else
BROKEN=		"Base system sendmail not found or too old, rebuild with WITH_SENDMAIL_PORT=yes"
.endif
.else
BUILD_DEPENDS+=	${LOCALBASE}/lib/libmilter.a:${PORTSDIR}/mail/sendmail
MILTERBASE?=	${LOCALBASE}
.endif

.if defined(WITH_LIBSPF2)
LIB_DEPENDS+=	spf2.2:${PORTSDIR}/mail/libspf2
CONFIGURE_ARGS+=--with-libspf2=${LOCALBASE}
.endif

.if defined(WITH_GEOIP)
LIB_DEPENDS+=	GeoIP.5:${PORTSDIR}/net/GeoIP
CONFIGURE_ARGS+=--with-libGeoIP=${LOCALBASE}
.endif

.if defined(WITH_CURL)
LIB_DEPENDS+=	curl.4:${PORTSDIR}/ftp/curl
CONFIGURE_ARGS+=--with-curl=${LOCALBASE}
.endif

CFLAGS+=	${PTHREAD_CFLAGS}
LIBS+=		${PTHREAD_LIBS}

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ARGS+=	--with-user=mailnull --with-libmilter=${MILTERBASE}
CONFIGURE_ARGS+=	--enable-dnsrbl --with-thread-safe-resolver
CONFIGURE_ENV+=	CFLAGS="${CFLAGS}" LIBS="${LIBS} "

ALL_TARGET=	milter-greylist

USE_RC_SUBR=	yes
RC_SCRIPTS_SUB=	PREFIX=${PREFIX} RC_SUBR=${RC_SUBR}

post-extract:
	@${SED}	${RC_SCRIPTS_SUB:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/} \
		${FILESDIR}/milter-greylist.sh > ${WRKSRC}/milter-greylist.sh

do-install:
	@${MKDIR} ${PREFIX}/etc/mail
	@${INSTALL_PROGRAM} ${WRKSRC}/milter-greylist ${PREFIX}/libexec
	@${INSTALL_MAN} ${WRKSRC}/greylist.conf.5 ${PREFIX}/man/man5
	@${INSTALL_MAN} ${WRKSRC}/milter-greylist.8 ${PREFIX}/man/man8
	@${INSTALL_DATA} ${WRKSRC}/greylist.conf \
			${PREFIX}/etc/mail/greylist.conf.sample
	@${INSTALL_SCRIPT} ${WRKSRC}/milter-greylist.sh ${PREFIX}/etc/rc.d/
	@${SED} -e "s,%%DOCSDIR%%,${DOCSDIR},g" \
		-e "s,%%PREFIX%%,${PREFIX},g" \
		${.CURDIR}/pkg-message > ${PKGMESSAGE}

post-install:
	@${MKDIR} /var/milter-greylist
	@${CHOWN} -R mailnull /var/milter-greylist
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${MKDIR} ${EXAMPLESDIR}
	@${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/greylist.conf ${EXAMPLESDIR}
.endif

.include <bsd.port.post.mk>
