# New ports collection makefile for:   	bitlbee
# Date created:                        	10 June 2003
# Whom:                                 Peter van Dijk <peter@dataloss.nl>
#
# $MidnightBSD: mports/irc/bitlbee/Makefile,v 1.3 2007/08/30 19:04:59 laffer1 Exp $
# $FreeBSD: ports/irc/bitlbee/Makefile,v 1.26 2006/08/12 09:52:53 miwi Exp $
#

PORTNAME=	bitlbee
PORTVERSION=	1.0.4
CATEGORIES=	irc
MASTER_SITES=	http://get.bitlbee.org/src/

PATCH_SITES=	http://get.bitlbee.org/patches/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An IRC to other chat networks gateway

SUB_FILES=	pkg-message
MAN5=		bitlbee.conf.5
MAN8=		bitlbee.8

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNOME=	glib20
USE_GETOPT_LONG=yes
PKGMESSAGE=	${WRKDIR}/pkg-message

OPTIONS=	MSN "Enable MSN protocol support" On \
		LDAP "Enable LDAP authentication support" Off \
		RECODE "Enable oscar_recode_charset" Off \
		IPV6 "Enable IPV6 support" On

CONFIGURE_ARGS=	--mandir=${PREFIX}/man --config=${PREFIX}/etc/bitlbee

.include <bsd.port.pre.mk>

.if defined(WITH_LDAP)
PATCHFILES+=	${PORTNAME}-1.0-ldap.diff
.endif

.if !defined(WITHOUT_MSN)
LIB_DEPENDS+=	gnutls.26:${PORTSDIR}/security/gnutls
CONFIGURE_ARGS+=--msn=1
.else
CONFIGURE_ARGS+=--msn=0 --ssl=bogus
.endif

.if defined(WITH_RECODE)
post-patch:
	@cd ${WRKSRC} && \
		${PATCH} ${PATCH_ARGS} < ${FILESDIR}/oscar-recode-patch
.endif

.if defined(WITH_LDAP)
USE_OPENLDAP=	yes
CONFIGURE_ARGS+=--ldap=${LOCALBASE}
.endif

.if defined(WITHOUT_IPV6)
CONFIGURE_ARGS+=--ipv6=0
.endif

pre-install:
	@${MKDIR} -m 700 ${PREFIX}/etc/bitlbee

post-install:
	@${CP} ${WRKSRC}/bitlbee.conf ${PREFIX}/etc/bitlbee/bitlbee.conf.orig
	@${CP} ${WRKSRC}/motd.txt ${PREFIX}/etc/bitlbee/motd.txt.orig

.include <bsd.port.post.mk>
