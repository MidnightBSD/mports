# $MidnightBSD: mports/mail/milter-greylist/Makefile,v 1.12 2011/04/30 18:01:21 laffer1 Exp $

PORTNAME=	milter-greylist
PORTVERSION=	4.2.6
PORTREVISION=	1
CATEGORIES=	mail
MASTER_SITES=	ftp://ftp.espci.fr/pub/milter-greylist/
DISTNAME=	milter-greylist-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Easy-to-use greylist milter for sendmail and postfix
LICENSE=	bsd4

OPTIONS=	LIBSPF2	 "Enable SPF checks" off \
		GEOIP	 "Enable GEOIP"  off \
		CURL	 "Enable CURL for URL checks" off \
		OPENLDAP "Include OpenLDAP support" off \
		P0F "Include P0F support" off \
		POSTFIX  "Use Postfix instead of Sendmail" off

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

SUB_FILES=	pkg-message

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
LIB_DEPENDS+=	spf2.3:${PORTSDIR}/mail/libspf2
CONFIGURE_ARGS+=--with-libspf2=${LOCALBASE}
.endif

.if defined(WITH_GEOIP)
LIB_DEPENDS+=	GeoIP.5:${PORTSDIR}/net/GeoIP
CONFIGURE_ARGS+=--with-libGeoIP=${LOCALBASE}
.endif

.if defined(WITH_CURL)
LIB_DEPENDS+=	curl.6:${PORTSDIR}/ftp/curl
CONFIGURE_ARGS+=--with-curl=${LOCALBASE}
.endif

.if defined(WITH_OPENLDAP)
USE_OPENLDAP=yes
CONFIGURE_ARGS+=--with-openldap
.endif

.if defined(WITH_P0F)
RUN_DEPENDS+=	p0f:${PORTSDIR}/net-mgmt/p0f
CONFIGURE_ARGS+=	--enable-p0f
.endif

.if defined(WITH_POSTFIX)
CONFIGURE_ARGS+=--enable-postfix
.else
LDFLAGS+=	${SENDMAIL_LDFLAGS}
LIBS+=		${SENDMAIL_LDADD}
.endif

CFLAGS+=	${PTHREAD_CFLAGS}
LIBS+=		${PTHREAD_LIBS}

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.1
CONFIGURE_ARGS+=	--with-user=mailnull --with-libmilter=${MILTERBASE}
CONFIGURE_ARGS+=	--enable-dnsrbl --with-thread-safe-resolver
CONFIGURE_ENV+=	CFLAGS="${CFLAGS}" LIBS="${LIBS} "

ALL_TARGET=	milter-greylist

USE_RC_SUBR=	milter-greylist
RC_SCRIPTS_SUB=	PREFIX=${PREFIX} RC_SUBR=${RC_SUBR}

do-install:
	@${MKDIR} ${PREFIX}/etc/mail
	@${INSTALL_PROGRAM} ${WRKSRC}/milter-greylist ${PREFIX}/libexec
	@${INSTALL_MAN} ${WRKSRC}/greylist.conf.5 ${PREFIX}/man/man5
	@${INSTALL_MAN} ${WRKSRC}/milter-greylist.8 ${PREFIX}/man/man8
	@${INSTALL_DATA} ${WRKSRC}/greylist.conf \
			${PREFIX}/etc/mail/greylist.conf.sample

post-install:
	@${MKDIR} /var/milter-greylist
	@${CHOWN} -R mailnull:mailnull /var/milter-greylist
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${MKDIR} ${EXAMPLESDIR}
	@${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/greylist.conf ${EXAMPLESDIR}
.endif

.include <bsd.port.post.mk>
